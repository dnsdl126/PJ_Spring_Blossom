package com.Blossom.service.index;

import java.util.List;

import com.Blossom.domain.ProductDTO;

public interface IndexService {
	 //베스트 상품을 5건 출력
	public List<ProductDTO> bestPdtList();
}
