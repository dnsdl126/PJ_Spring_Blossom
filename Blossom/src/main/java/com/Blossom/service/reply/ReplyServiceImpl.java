package com.Blossom.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Blossom.domain.ReplyDTO;
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

	@Override
	public List<ReplyDTO> list(int bno) {
		// 해당 게시글의 댓글 못록을 보내야 한다 
		// 댓글 목록은 DB에 있어서 
		// DAO로 이동이 필요하다 
		
		return rDao.list(bno);
	}

	
	
	
	
	
	

	
 	

	
	
	
	
	
	
}
