package com.Blossom.persistence;

import com.Blossom.domain.MemberDTO;

public interface MemberDAO {
	
	//회원가입 ID 중복 체크 (+AJAX)
	public int idOverlap(String id);
	
	//회원가입 DB에 회원등록
	// mamper.xml 에 있는 memInsert 하는 작업이랑 같다고 맞춰뒀기 때문에 
	public int memInsert(MemberDTO mDto);
	
	//회원가입 DB에 회원 수정
	public int memUpdate(MemberDTO mDto);
	
	//회원가입 진행시 난수 생성 및 useyn 컬럼에 난수 입력
	public int getKey(String id, String key);
	
	//회원가입 이메일 인증후 useyn 컬럽 y로 값 변경
	public int alterKey(String id, String key);
	
	//1명의 회원 정보
	public MemberDTO userView(String id);
	
	//비밀번호 수정:현재 비밀번호체크
	
	public String pwCheck (String id);
	
	// 비밀번호 수정 : DB에 수정
	
	public int pwUpdate(MemberDTO mDto);
	
	
	
	
}
