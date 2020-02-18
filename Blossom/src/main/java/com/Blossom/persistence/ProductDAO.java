package com.Blossom.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.Blossom.domain.ProductDTO;

public interface ProductDAO {

//	@Select("SELECT COUNT(*) FROM tbl_pdt")
//	public int getCount();	
//	public int getCount2();
	
	public List<ProductDTO> bestPdtList();
	
	public List<ProductDTO> newPdtList();
}
