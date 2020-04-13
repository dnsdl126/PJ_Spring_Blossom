package com.Blossom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Blossom.domain.BoardDTO;
import com.Blossom.service.board.BoardService;
import com.Blossom.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
///board작업으로 시작하는것은 모두 여기로 와라 
@RequestMapping("/board")

public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@GetMapping("/list")
	public String list (
			// 페이지 이동을 안했을 경우 보내줄 정보가 없기 때문에
			//@RequestParm으로 dafault 값을 설정 
			//curPage에는 1이라는 값이 들어가 있다 
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="new") String sort_option,
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword,
			//4 개 옵션은 항상 셋트 
			Model model) {
		
		log.info("GET: BOATD LIST PAGE");
		
		//개시글 갯수 계산
		// 선행조건 리턴해서 돌아올때 15개 정보가 담긴다 
		int count = bService.countArticle(search_option, keyword);
		
		//페이지 관련 설정
		Pager pager = new Pager(count, curPage); 
		//() 붙어있으면 메서드 첫글자는 소문자로 시작해야 한다
		// 메서드 중에 대문자로 시작하는것은 생성자 메서드 뿐이다
		// 생성함가 동시에 값을 쓰고 싶은때 / 호출해서 쓰는것과 다르다 
		// pager 중 매게변수 2개바는 생성자를 찾아서 이동 --> pager class로 이동 
		// pager인스턴스에 값이 담겨서 돌아온다 (curBlock:1, curPage:1, Totpage:2, pageBegin:1 ....)
		
		// 대문자는 상수와 객체 
		//curPage 1페이지 2페이지 인지 
		int start = pager.getPageBegin(); 
		//pager에 pageBegin이 리턴으로 되어있다 pageBegin에는 1이 담긴 상태
		// int start = 1 이 담긴다 
																
		int end = pager.getPageEnd();
		//pager에 pageEnd이 리턴으로 되어있음 pageEnd에는 10이 담긴 상태
		// int end= 10 
		
		
		
		List<BoardDTO> list = bService.listAll(sort_option, search_option, keyword, start, end); // 게시물 목록 
		// 앞으로 보내질 양이 많기 때문에 BoardDTO를 map 으로 다시 또 담음 
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		model.addAttribute("map", map);
		
		
		return "board/list";
		
		
			
		}
		
		@GetMapping("/view/{bno}")
		public String view (@PathVariable(value="bno") int bno,  Model model 
										        ,HttpSession session) {
			 log.info("GET Board Detail Page ");
			 //해당 bno 게시글 정보를 DB에서 가져와 BoardDTO에서 model에 담아
			 //board/view.jsp로 전달 
			 // model ("one",bDto);
			 
			 //1. 해당 bno의 조회수 +1증가
			 bService.increaseViewCnt(session, bno);
			
			 //2. db에서 해당 bno 정보를 GET 해서 VIEW에 전송 
			 model.addAttribute("one", bService.boardview(bno));
			 model.addAttribute("key", "dropBoard"); // 삭제할때 한번 필요 
		
			 
			return "board/view";
	}
		
		@GetMapping("/delete")
		public String delete(int bno) {
			log.info(">>>>>>>>>>>> GET BOARD DELETE ACTION ");
			bService.delBoard(bno);
			
			return "redirect:/board/list";
		}
		
		@GetMapping("/write")
		public String write() {
			log.info(">>>>>>>>>>>>>GET BOARD NEW ACTION");
			return "board/register";
			
		}
		
		@PostMapping("/write")
		public String write(BoardDTO bDto) {
			log.info(">>>>>>>>>>>>>POST BOARD write ACTION");
			log.info(bDto.toString());
			 bService.write(bDto);
			
			//log.info("currval:" +bDto.getBno());
			return  "redirect:/board/view/"+bDto.getBno();
		}
		
		@GetMapping("/update")
		public String updateBoard(int bno, Model model) {
			log.info(">>>>>>>>>GET: Board update View Page");
			log.info("bno: " + bno);
			
			
			// 수정을 원하는 게시글의 정보를 (1줄) 원함 
			model.addAttribute("one", bService.boardview(bno));
			model.addAttribute("flag", "update");
			
			
			
			return "board/register";
		}
		
		@PostMapping("/update")
			public String updateBoard( BoardDTO bDto ) {
			
			
			bService.updateBoard(bDto);
			 
			// 게시글 작성후 상세페이지로 다시 return하려면 bno를 알아야하는데
			// INSERT seq_board.NEXTVAl을 처리해서 
			// NEXTVAL은 호출하는 순간 +1 이 증가
			// 당시의 bno값을 알려면 seq_board.CURRVAL을 사용 
			
			// 잘못된 예
			// <inxert id="write">
			// 		INSERT INTO tbl_board(bno,~~~)
			//		VALUES(seq_baord.NETVAL,~~~);
			// <inxert id="write">
			// <select id = "currval">
			// 		SELECT seq_board.CURRVAL  FROM dual
			// </select>
			// --> 위의 경우(트랜잭션으로 처리 했을때)는 
			//     NEXTVAL로 처리하여 commit하고 그다음 CURRVAL  이 해당 bno를 조회하러 가는데
			//     조회하러 간사이에 다른 글이 작성되어 NEXTVAL이 하나 추가가 되어있을 수도 있어 
			//     해당 bno가 아닌 그다음 bno를 가지고 올수 있다
			
			// 해결 방법 
				/*<insert id="write">
				 * INSERT INTO tbl_board(bno, type, title, content, writer)
				 * VALUES(seq_board.NEXTVAL, #{type}, #{title}, #{content}, #{writer} )
				 *    <selectKey keyProperty="bno" resultType ="Interger" order="AFTER">
				         SELECT seq_board.CURRVAL FROM dual
			          </selectKey> 
			      </insert>
				 */
			// 동시에 시작하도록 SELECT  키를 사용한다 
			// select키를 메인을 잡고 전후에 따라 select begin ,select after가 된다  
			// keyProperty="bno"의 값이 #{type}으로 담긴다 
		 
			
			return  "redirect:/board/view/"+bDto.getBno();
		}
		
		@GetMapping("/answer")
		public String answerBoard (BoardDTO bDto, Model model) {
			// bno하나만 쓸때는 BoardDTO를 쓰는것이 비효율적이지만
			// 게시글 정보를 받기위해 bDto가 필요하므로 비효율적인것은 아니다 
			// (BoardDTO bDto, Model model) 객체 생성을 해야하지만
			// @controller 붙은 클래스에 한해서 매게 변수로 선언한 것들을 
			// 자동으로  객체를 생성 해주기때문에 
			// new 를 사용하여 객체 생성 별도로 할 필요가 없다
			
			log.info(">>>>>>>>>>>> GET BOARD ANSWER VIEW PAGE ");
			bDto =bService.boardview(bDto.getBno());
			
			String newContent = "<p>이전 게시글 내용</p>" +
			                     bDto.getView_content() +
			                     "<br> =========================================================== ";
			
			bDto.setView_content(newContent);
			
			// 게시글 정보
			model.addAttribute("one",bDto);
			// flag값을 answer를 준다 
			model.addAttribute("flag", "answer");
			
			return "board/register";
		}
		
		//get은  html상 head 부분에 담기는데 길이 제한이 있다
		// Post방식으로 보내줘야 하는데 
		// view -> controller 에 갈때 방법이 3가지가 있다
		//  1) ajax 
		//  2) 쿼리스트링
		//  3) form 
		// 페이지 전환이 일어나지 않는다 -> ajax
		// 페이지 전환이 일어난다 -> 쿼리스트링, form
		//   get방식 -> 쿼리스트링 post, get -> form
		// 스프링 form  태그에 action 이 생략될경우 내 URL을 그대로 간다 (쿼리스트링 ? 때고 )
		// method는 생략 할 경우 default 값인 Post방식으로 처리한다 
		
		@PostMapping("/answer")
		public String answerBoard(BoardDTO bDto) {
			log.info(">>>>>>>>>>>> POST BOARD ANSWER ACTION ");
			
			// 현재 답글(bno(메인게시글 ), 타입, 제목, 내용, 작성자)
			log.info("답글 DTo: " +bDto.toString());
			
			
			
			// 메인게시글의 모든 정보 (메인게시글의 ref, re_step, re_level이 필요하므로 )
			BoardDTO prevDto = bService.boardview(bDto.getBno());
			log.info("메인 DTO: " + prevDto.toString());
			
			// 현재 상태 (bno(메인게시글 ), 타입, 제목, 내용, 작성자, ref(메인), re_step(메인), re_level(apdls)) 
			bDto.setRef(prevDto.getRef());
			bDto.setRe_step(prevDto.getRe_step());
			bDto.setRe_level(prevDto.getRe_level());
			
			bService.answer(bDto);
			    // ref = 메인게시글의  ref를 그대로 복사
				// re_step = 메인게시글 re_step +1
				// re_level = 메인 게시글 re_step +1
			
			
			
			
			return "redirect:/board/view/"+bDto.getBno();
		}
		 
		@PostMapping("/getAttach")
		@ResponseBody
		public List<String> getAttach(int bno){
			log.info(">>>>>>>>>>>> POST: Board getAttach Action");
			log.info(">>>>>>>>>>>> bno: " +bno);
			return bService.getAttach(bno);
		}
}
