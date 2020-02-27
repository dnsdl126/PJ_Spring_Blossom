package com.Blossom.persistence;

import com.Blossom.domain.MemberDTO;

public interface LoginDAO {
	
	// 로그인 
	public MemberDTO loginUser(MemberDTO mDto);
	
	
	
}
