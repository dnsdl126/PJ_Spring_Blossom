package com.Blossom.service.index;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Blossom.domain.ProductDTO;
import com.Blossom.persistence.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IndexServiceImpl implements IndexService{
	// 기존에는 DAO -> Mybatis -> DB(Oracle) 순차적으로
	// 동작해서 비효율적이던 실행방법을 다음과 같이 
	// DAO + Mapper를 결합하여 사용하는 방식을 사용
	
	// sqlSession을 사용하기 위해 의존성 주입
	// : root-context.xml에서 생성된 sqlSession 빈즈주입 받음
	// 를 주입 준비 
	@Autowired
	private SqlSession sqlSession;
	
	ProductDAO pDao;// 전역변수  --> DB접근시 SQL문 실행 
	@Autowired
	public void newProductDAO () {
		pDao = sqlSession.getMapper(ProductDAO.class);
		// ProductDAO.class를 통해서 Mapper를 가지고 오겠다.
		// 할수 있는일을 다 넘겨 주고 pDao에 담음 
	}
	
	@Override
	public List<ProductDTO> bestPdtList() {
		//비즈니스로직
		// : best상품 5건을 조회해서 view(메인)단에 출력
		//log.info("@을 이용한 방법: " + pDao.getCount());
		//log.info("xml을 이용한 방법: " + pDao.getCount2());
		
		
		
//		for(ProductDTO productDTO : list) {
//			log.info(productDTO.toString());
//		}
		return pDao.bestPdtList();
		
	}

	@Override
	public List<ProductDTO> newPdtList() {
		// TODO Auto-generated method stub
		
		//3. 비즈니스 로직을 처리 !
		// : 신상품 5건을 출력 --> DB작업
		// : DB작업은 Model단 시킴
		
		// DB작업을 위해 Model단으로 이동
		// Model(ProductDAO+Mapper) 인터페이스의 newPdtList() 메서드를
		// 실행하고 return 받음!
 	   return pDao.newPdtList(); // 5건의 신상 데이터가 담음 
 		
 	 
	}

	
}
