package com.Blossom.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Blossom.domain.MemberDTO;
import com.Blossom.persistence.MemberDAO;

// @Service : 객체에댄한 생성 권한을 Spring한테 줄게 
// 실제 구현은 MemberService 가 아닌 MemberServiceImpl (자식)이진행 하므로 IOC 패턴을 적용 
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired// DB 연결 
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() { //DAO 와 mapper 연결 
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

	@Override
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		int result = mDao.memUpdate(mDto);
		
		if(result > 0) { //수정 성공
			 // 세션에 로그인 유저 정보를 수정된 정보로 변경 
			   
			  session.removeAttribute("name");
			  session.setAttribute("userid", mDto.getId()); 
			  session.setAttribute("name", mDto.getName());
			
		}
		
		
		
	}

	@Override
	public int pwCheck(String id, String pw) { // 서비스 단에서 id, pw 받음
		
		return mDao.pwCheck(id,pw); 
	}	
	
}
	
