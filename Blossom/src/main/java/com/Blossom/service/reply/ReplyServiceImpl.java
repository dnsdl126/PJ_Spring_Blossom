package com.Blossom.service.reply;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		// void는 return이 없다
		// 호출만 진행 
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

	@Transactional
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
//		// map 으로 하는 방법
//		HashMap<String, object>map = new HashMap<>();
//		map.put("bno", bno);
//		map.put("type", "plus");
//		rDao.replyUpdate(map);
		
		
//		비즈니스 로직 1번 2번 둘다 true 해야 하기 때문에
//	 	transaction 처리 해줘야 한다 ex) 2중하나만 true 되면 rollback  되라 		
		// open 1. 댓글 등록 close = commit
		// open 2. 댓글수 + 1 close
		// open 1.댓글등록 , 2.댓글수 + 1 close 
		// 1.  transaction 을 쓰려면 pome.xml 에  aspectjrt)와 AOP 관련 라이브러리가 있어야 한다
		// 2. servlet-contest 하단에 Namespaces  들어가서 AOP 와 tx에 체크 
		// 3.  servlet-contest 에서  <aop:aspectj-autoproxy></aop:aspectj-autoproxy> aop기능을 쓰겟다고 명시
		// 4. root-cntest  Namespaces  들어가서  tx에 체크 후 <!-- 트랜잭션 관련 설정 --> 해준다 
		
		
		
		
	}


	//댓글 삭제
	@Transactional
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
