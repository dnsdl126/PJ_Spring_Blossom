package com.Blossom.service.login;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Blossom.domain.MemberDTO;
import com.Blossom.persistence.LoginDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	private LoginDAO lDao;
	@Autowired
	public void newMemberDAO() {
		lDao = sqlSession.getMapper(LoginDAO.class);
	}

	@Override
	public int login(MemberDTO mDto, HttpSession session) {
		// 비즈니스 로직 처리
		// 1. DB에가서 회원인지 아닌지 유무 체크(useyn 이 y인지 n인지 (인증완료 했는지 여부 까지 확인 ))
		 MemberDTO loginDto =  lDao.loginUser(mDto); // loginMapper 에서 결과있으면 결과값 = 1 회원 아니면 회원 아님
		  log.info("□■□■□■□■□■□■□■□■□■□■□■□■□■□■ 로그인 결과" ); 
		  
		  //로그인 결과값
		  
		  int result = 0;
		  
		 
		  //result의 결과
		  // 0: 등록된 회원이 아닙니다. 회원가입을 진행해주세요
		  // 2: 이메일 인증을 하셔야만 로그인 할 수 있습니다. 
		  // 1: 로그인 성공 
		  // 3: 아이디 또는 비밀번호가 잘못되었습니다. 다시 확인해주세요 
		  
		  // 회원 정보가 없는 경우
		  if(loginDto == null) {			   
			  result = 0; 		
			  return result;
		  } 
		   //인증 안했을 경우
		  if(!(loginDto.getUseyn().equals("y"))) { //y가 아닌경우 N이거나 난수인 경우를 지칭하기 어려우므로
			  result = 2;
			  return result;
		  }
		 
		  //회원정보가 있고 인증을 한 경우
		  if(loginDto != null) {
			  
			  // 아이디와 패스워드가 같은지 체크
			  
			  if(passwordEncoder.matches(mDto.getPw(), loginDto.getPw())) {
				   //로그인 진행 
				  result = 1;
				  
				  // 세션에 로그인 유저 정보를 저장
				  session.removeAttribute("userid"); //removeAttribute 세션에 userid 값을 초기화 
				  session.removeAttribute("name");
				  session.setAttribute("userid", loginDto.getId()); // 위에 초기화된 session에 oginDto.getId() 넣겠다
				  session.setAttribute("name", loginDto.getName());
				  // 비즈니스 로직 (서비스 단) 
				  //  - 로그인 
				  //  - sesiion값을 넣는 것도 비즈니스 로직에서 처리 
				  // session 객체를 생성 해야 하는데 이것은 컨트롤러단에서 (session 객체 생성후 전달 )
				  // 비즈니스 로직을 처리하는데 필요한 것들을 만들어 주는 것는 컨트롤러 단이다
				  // 공용저장소 Cookie는 보안이 좋지 않고 로그인 정보등 중요한 정보는 session 으로 처리 
				  // null값은 로그인이 안된경우  
				  
				  
			  } else {
				  result = 3;
			  }
		  }
		  return result;
		
	}

	@Override
	public void logout(HttpSession session) {
		//비즈니스 로직 : 로그아웃
		
		// 세션 초기화
		
		
	    session.invalidate();
	
	}
	
	
	

}
