package com.Blossom.service.test;

import java.util.List;

import com.Blossom.domain.TestBoardDTO;
import com.Blossom.domain.TestDTO;

public interface TestService {

	// 게시글 리스트 
	public List<TestBoardDTO> testlistall();
	
	//게시글 작성
	
	public void twrite(TestBoardDTO tDto);
	
	public TestBoardDTO update(int tbno);
	
	public void tupdate(TestBoardDTO tDto);
}
