package com.Blossom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		@GetMapping("/view")
		public String view (int bno,  Model model ) {
			 log.info("GET Board Detail Page ");
			 //해당 bno 게시글 정보를 DB에서 가져와 BoardDTO에서 model에 담아
			 //board/view.jsp로 전달 
			 // model ("one",bDto);
			
			
			 model.addAttribute("one", bService.boardview(bno));
			
		
			 
			return "board/view";
	}
}
