package com.Blossom.service.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.Blossom.domain.MemberDTO;

public interface MemberService {

		//회원가입 id 중복체크 (AJAX)
	public int idOverlap (String id); 
	
	//회원가입 (DB에 등록)
	public int memInsert (MemberDTO mDto);
	
	// 1명의 회원정보
	public MemberDTO userView(String id);
	
	// 회원 수정 (DB에 수정)
	public void memUpdate(MemberDTO mDto, HttpSession session);
	
	// 비밀번호 수정 : 현재비밀번호 체크 
	public int pwCheck(String id, String pw);
	
	//비밀번호 수정 : DB에 수정
	public int pwUpdate(MemberDTO mDto);
	
	// 회원 탈퇴 	
	public void dropMem (HttpSession session, String id);
		
	//마이페이지 정보 가지고 오기 
	public void myPage(MemberDTO mDto, HttpSession session);
}
