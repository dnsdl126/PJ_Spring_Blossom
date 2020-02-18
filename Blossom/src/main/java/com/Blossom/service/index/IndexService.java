package com.Blossom.service.index;

import java.util.List;

import com.Blossom.domain.ProductDTO;

public interface IndexService {
	 //베스트 상품을 5건 출력
	public List<ProductDTO> bestPdtList();
	
	//신상품을 5건 출력	
	
	// 4.@관련 SQl이 없으면 mapper.xml에 가서
	// id가 newPdtList와 같은 SQL 문을 찾아
	// Oracle DB로 가서 실행후
	// 결과를 return 받음
	public List<ProductDTO> newPdtList();
}
