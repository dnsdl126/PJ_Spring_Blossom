package com.Blossom.service.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Blossom.domain.TestBoardDTO;
import com.Blossom.persistence.TestDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TestServiceImple implements TestService {

	@Autowired // DB사용
	private SqlSession sqlSession;
	
	TestDAO tDao;
	
	@Autowired
	public void TestDAO() {
		tDao = sqlSession.getMapper(TestDAO.class);
	}
	


	@Override
	public List<TestBoardDTO> testlistall() {
		
		return tDao.testlistall();
	}



	@Override
	public void twrite(TestBoardDTO tDto) {
		tDao.twrite(tDto);
		
	}



	@Override
	public TestBoardDTO update(int tbno) {
		
		return tDao.update(tbno);
	}



	@Override
	public void tupdate(TestBoardDTO tDto) {
		tDao.tupdate(tDto);
		
	}


	

	
	
	
	
	
	
	
}
