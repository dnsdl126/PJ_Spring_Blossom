package com.Blossom.service.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Blossom.domain.MemberDTO;
import com.Blossom.persistence.MemberDAO;

// @Service : 객체에댄한 생성 권한을 Spring한테 줄게 
// 실제 구현은 MemberService 가 아닌 MemberServiceImpl (자식)이진행 하므로 IOC 패턴을 적용 
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	@Override
	public int idOverlap(String id) {
		// TODO Auto-generated method stub
		return mDao.idOverlap(id);
	}
	
	@Override
	public int memInsert(MemberDTO mDto) {
		return mDao.memInsert(mDto);
	//올때 12가지 정보 담아서 옴 
//		 리턴할때 호출문이 있으면 호출 먼저 진행
//		 memInsert 진행하고 결과값  담아서 호출한 곳에  리턴  

	}

	@Override
	public MemberDTO userView(String id) {
		
		return mDao.userView(id);
	}	
	
}
	
