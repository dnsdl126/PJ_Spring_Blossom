package com.Blossom.persistence;

import java.util.List;

import com.Blossom.domain.TestBoardDTO;

public interface TestDAO {

	public List<TestBoardDTO> testlistall();
	
	public void twrite(TestBoardDTO tDto);
	
	public TestBoardDTO update(int tbno);
	
	public void tupdate(TestBoardDTO tDto);
}
