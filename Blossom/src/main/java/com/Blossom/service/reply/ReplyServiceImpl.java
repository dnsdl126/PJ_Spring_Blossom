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
	}

	@Override
	public List<ReplyDTO> list(int bno) {
		// TODO Auto-generated method stub
		return rDao.list(bno);
	}

	
	
	
	
	
	

	
 	

	
	
	
	
	
	
}
