package com.Blossom.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


	
	
	

}
