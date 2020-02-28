package com.Blossom.service.member;

import org.springframework.stereotype.Service;

import com.Blossom.domain.MemberDTO;

public interface MemberService {

		//회원가입 id 중복체크 (AJAX)
	public int idOverlap (String id); 
	
	//회원가입 (DB에 등록)
	public int memInsert (MemberDTO mDto);
	
	// 1명의 회원정보
	public MemberDTO userView(String id);
}
