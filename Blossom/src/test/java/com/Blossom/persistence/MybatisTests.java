package com.Blossom.persistence;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations=
{"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class MybatisTests {
	
	private static final Logger logger=
			LoggerFactory.getLogger(MybatisTests.class);
	
	@Autowired
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory() {
		logger.info("sqlFactory:"+sqlFactory);
	}
	@Test 
	public void testSession() {
		try (SqlSession sqlSession = sqlFactory.openSession()){
			System.out.println("SqlSession:"+sqlSession);
			System.out.println("Mybatis 연결 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
