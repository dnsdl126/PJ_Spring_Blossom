package com.Blossom.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.Blossom.domain.BoardDTO;
import com.Blossom.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	BoardDAO bDao; 
	
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}

	@Override
	public List<BoardDTO> listAll(String sort_option , String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
	
		
		return bDao.listAll(map);
		
		
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map = new HashMap<>();
		// MAp 이라는 담는 공간을 만든다
		// <> = 제네릭(검문소) <key(이름표), value>만 가지고 와라 
		
		map.put("search_option", search_option);
		// map에 ("search_option", search_option) 를 넣어라 
		// 꺼낼때는 이름으로 꺼낼수 있다 (map.key 해야 value 값을 받을수 있음 )
		// 한번에 출력할 데이터는 list, 특정값을 넣어서 특정값하나만 뺄때는 map
		map.put("keyword", "%"+keyword+"%");
		
		return bDao.countArticle(map);
	}
	@Override
	public BoardDTO boardview(int bno) {				
		return bDao.view(bno);
	}

	@Override
	public void increaseViewCnt(HttpSession session, int bno ) {
		// 새로고침으로 조회수 증가하지 않도록 막는법
		// now_time : 현재 시간 
		// plus_time : 조회수 + 1 시간 --> session
		// now_time - plus_time = 조회수 +1 증가후 지난 시간 
		 
		long update_time = 0; // 조회수 +1 증가한 시간 
		
		// 최근에 조회수를 올린 시간
		// session을 활용한 조회수 증가 방지 
		if(session.getAttribute("update_time_" + bno) !=null) {
			// bno가 210 번 게시물 일경우
			// 처음 탓을때는 session.getAttribute("update_time_" + bno) null이 들어온다
			// 다시 새로고침 한경우 null 이아니므로 if 절을 타게됨 
			update_time = (long)session.getAttribute("update_time_" + bno);
			// session에 가서 update_time + 210을 찾아라
		}
		
		//현재 시간
		long current_time = System.currentTimeMillis();
		//System.currentTimeMillis(); 현제 시간을 읽고 수치로 바꾼다 
		
		// 일정 시간이 경과 후 조회수 증가 처리
		if(current_time - update_time > 24*60*60*1000) { // 하루뒤에 증가 가능 
			// DB에서 조회수 +1 증가
			bDao.increaseViewCnt(bno);
			// 조회수 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
			// session에 update_time_bno를 만들고
			//current_time - update_time 값이 들어간다
		}
		
		
		
		
	}
	
	@Transactional
	@Override
	public void delBoard(int bno) {
		
		bDao.deleteAttach(bno); //DB에서 첨부파일 삭제 
		bDao.delBoard(bno); // 게시글 삭제
		
		// 기타방법
		// 예) 90일 이후에 일괄삭제
		// tbl_board와 tbl_attach를 relation을 맺고
		// Cascade작업을 통해 tbl_board에서 해당 개시글 삭제하면
		// 자동으로 tbl_attach 에 해당 게시글 첨부파일 일괄삭제
		// 즉 첨부파일 DB에서 삭제하는 코드는 작성 안해도 됨 
	
		
		
	}
	
	@Transactional
	@Override
	public void write(BoardDTO bDto) {
		// tbl_board에 게시글 등록 (type, tiltle, content, writer)
		bDao.write(bDto);
		
		//tbl_attach에 해당 게시글 첨부파일 등록
		String[] files = bDto.getFiles();
		
		if(files == null) {
			return; //첨부파일 없음 종료
		}
		for (String name : files) {
			bDao.addAttach(name);
			// for each문으로 한건씩 처리한다 
		}
		
	}

	@Override
	public void updateBoard(BoardDTO bDto) {
		// 1. 게시글 내용 수정 
		 bDao.updateBoard(bDto);
		 
		 // 2. 해당 게시글 관련 첨부파일 모두 DB 에서 삭제 (tbl_attach)
		 bDao.deleteAttach(bDto.getBno());
		 
		 // 3. 수정시 존재하는 첨부파일 모두 DB에 등록  
		 
		 String [] files = bDto.getFiles();
		 
		 if(files == null) return;
		 for(String fullName:files) {
			 bDao.updateAttach(fullName, bDto.getBno());
		 }
		 
	
		 
		  
	}

	@Transactional
	// transaction을 해야 오류가 안나는 이유 
	// 답글등록 (INSERT) NEXTVAL 
	// Closed
	// Connection
	// 첨부파일 등록 (INSERT) CURRVAL
	// Closed
	// NEXTVAL 과 CURRVAL을 Transaction으로 묶어야
	// CURRVAL이 NEXTVAL을 인식할수 있다 
	// SELECT 키는 조회해서 무엇인가를 주기 때문에 선행작업이 필요할 경우 사용 한다 
	// 이번의 경우 같은 INSERT  작업이므로 Transactional을 사용한다
	@Override
	public void answer(BoardDTO bDto) {
		// 답글 알로기름
		// Current Status bDto"
		// answer : title, writer, type, content
		// main: bno, ref, re_level, re_step
		
			
		// 1) re_step을 수정
		//  : ref가 같은 row 중에 메인 게시글의 
		//    re_step보다 크기가 큰값을 찾아
		//    전부 + 1 ==> updateStep()	
		   bDao.updateStep(bDto);	
			

		// 2) 답글 DB에 INSERT 
		// re_step = 메인게시글 re_step +1
		// re_level = 메인 게시글 re_step +1
		// ref는 기존것 그대로 
			bDto.setRe_level(bDto.getRe_level()+1);
			 // 기존 메인의 re_level을  bDto.getRe_level에서 꺼내서 +1한 다음 setRe_level 담는다  
			bDto.setRe_step(bDto.getRe_step()+1);
			bDao.answer(bDto);
			
			//tbl_attach에 해당 게시글 첨부파일 등록
			// 각각의 번지에 파일 이름들이 저장 
			String[] files = bDto.getFiles();
			
			if(files == null) {
				return; //첨부파일 없음 종료
			}
			for (String name : files) {
				bDao.addAttach(name);
				// for each문으로 한건씩 처리한다 
			}
		
	}

	@Override
	public List<String> getAttach(int bno) {
		return bDao.getAttach(bno);
	}


	
	
	
		
	


	
	}

	
	

	
	
	


