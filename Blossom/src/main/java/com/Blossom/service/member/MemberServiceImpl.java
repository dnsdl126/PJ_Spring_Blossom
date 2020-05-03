package com.Blossom.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.Blossom.domain.MemberDTO;
import com.Blossom.persistence.MemberDAO;

// @Service : 객체에댄한 생성 권한을 Spring한테 줄게 
// 실제 구현은 MemberService 가 아닌 MemberServiceImpl (자식)이진행 하므로 IOC 패턴을 적용 
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired// DB 연결 
	private SqlSession sqlSession;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
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
			  //session.setAttribute("userid", mDto.getId()); 
			  session.setAttribute("name", mDto.getName());
			
		}
		
		
		
	}

	@Override
	public int pwCheck(String id, String pw) { // 서비스 단에서 id, pw 받음
		String encPw = mDao.pwCheck(id); // mapper결과로  난수가 들어온다 
		int result = 0;
		if(passwordEncoder.matches(pw, encPw)) {
			result = 1;
		}
		return result;
	}

	@Override
	public int pwUpdate(MemberDTO mDto) {
		
		int result = 0;
		result = mDao.pwUpdate(mDto);
		return result;
	}

	@Override
	public void dropMem(HttpSession session, String id) {
		//비즈니스 로직
		// 1) : 해당 회원의 useyn=n으로 Update(DB)
		int result = mDao.dropMem(id);
		
		
		
		// 2) 로그인 정보를 삭제 (session 초기화)
			 // 로그인 한상태 session : 김쪼막지
			 // session에 값이 있으면 로그인 ok
			 // 김쪼막지 ==> 회원탈퇴 (session 값이 없어지는것은 아니다 공유 영역에 있기 때문에)
			 // session도 초기화가 필요 
		 if(result > 0) {
			  session.invalidate(); 
			  // session에 로그인된 회원의 값을 삭제 
			  // invalidate(); = 무효화 함수
			  
		 }
	
		
	}

	@Override
	public void myPage(MemberDTO mDto, HttpSession session) {
		int result = mDao.myPage(mDto);
		
		if(result > 0) {
			session.removeAttribute("name");
			session.setAttribute("userid", mDto.getEmail()); 
			session.setAttribute("name", mDto.getName());
			session.setAttribute("name", mDto.getPhone());
			session.setAttribute("name", mDto.getAddr1());
		}
	}	
	
}
	
