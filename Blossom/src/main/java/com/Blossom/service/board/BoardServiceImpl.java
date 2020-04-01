package com.Blossom.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

	@Override
	public void delBoard(int bno) {
		bDao.delBoard(bno);
		
	}

	@Override
	public void write(BoardDTO bDto) {
		bDao.write(bDto);
		
	}


	
	
	
		
	


	
	}

	
	

	
	
	


