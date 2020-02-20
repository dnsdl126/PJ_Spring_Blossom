package com.Blossom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.Blossom.domain.MemberDTO;
import com.Blossom.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;


@RequestMapping("/member")
// member은 다와라
@Slf4j
//로그
@Controller
//빈즈등록
@SessionAttributes({"memberDTO"})
public class MemberController {
	@Autowired
	MemberService mService;
	/*
	 * SessionAttributes를 사용하기 위해서는
	 * 반드시 해당 변수를 생성하는 method가 controller
	 * 해당 메서드에서는 @ModelAttribute("변수명")
	 */

	@GetMapping("/constract")
	public String viewConstract () {
		log.info(">>>> MEMBER/CONSTRACT PAGE 출력");
		 return "member/constract";
		        
	}
	
	@GetMapping("/join")
	public String getjoin (MemberDTO mDto) {
		log.info("GET 방식");
		log.info(mDto.toString());
		
		 return "member/join";
		        
	}
	
	// 회원가입 ID 중복체크
	@ResponseBody
	@PostMapping("/idoverlap")
	public int idOverlap(String id) {
		log.info(">>>> ID OVERLAP CHECk");
		log.info("아이디: " + id);
		return mService.idOverlap(id);
	}
	
	
}
	