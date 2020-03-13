package com.Blossom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.Blossom.domain.MemberDTO;
import com.Blossom.service.login.LoginService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/login")
@Slf4j
@RestController

public class LoginController {
	
	@Autowired
	 LoginService lService;
	
	@PostMapping("/in")
	public Integer login(MemberDTO mDto, HttpSession session) { // 매게변수로 입력만해도 Controller 단이 객체 생성해준다
		log.info(">>>> POST : LOGIN/Login ACTION");
		log.info(mDto.toString());
	    
		// 로그인 
		int result = lService.login(mDto, session); // loginService
		
		return result;
		
	}
	
	@PostMapping("/out")
	public void logOut(HttpSession session) {
		log.info(">>>> POST : LOGOUT/LOGOUT ACTION");
		// 비즈니스 로직 : 로그아웃
		// 비즈니스 로직 : 내가할 기능 
		//세션을 초기화 
		lService.logout(session);
	}

}
