package com.Blossom.service.reply;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Blossom.domain.ReplyDTO;
import com.Blossom.persistence.BoardDAO;
import com.Blossom.persistence.ReplyDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private SqlSession sqlSession;

	private ReplyDAO rDao;
	
	
	
	@Autowired
	public void newReplyDAO() {
		rDao = sqlSession.getMapper(ReplyDAO.class);
		// rDao = mapper + Dao  
	}
	
	private BoardDAO bDao;
	
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	

	@Override
	public List<ReplyDTO> list(int bno) {
		// 해당 게시글의 댓글 못록을 보내야 한다 
		// 댓글 목록은 DB에 있어서 
		// DAO로 이동이 필요하다 
		
		return rDao.list(bno);
	}

	@Override
	public void insert(ReplyDTO rDto) {
		//비즈니스 로직
		// 해당 게시글에 댓글을 등록하고
		// 해당 게시글의 reply_cnt +1gka
		
		// 1. 댓글 등록
		rDao.insert(rDto);
		
		// 2. 게시글 댓글 수 + 1
		String type = "plus";
		rDao.replyUpdate(rDto.getBno(), type);
		
		
		
	}


	//댓글 삭제
	@Override
	public void delete(int rno, int bno) {
		// 댓글 삭제 
		rDao.delete(rno);
		
		String type = "Minus";
		rDao.replyUpdate(bno, type);
		
//		// map 으로 하는 방법
//		HashMap<String, object>map = new HashMap<>();
//		map.put("bno", bno);
//		map.put("type", "minus");
//		rDao.replyUpdate(map);
//		
	}

	

	
	
	
	
	
	

	
 	

	
	
	
	
	
	
}
