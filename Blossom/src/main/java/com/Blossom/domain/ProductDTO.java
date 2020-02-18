package com.Blossom.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.DATE;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

public class ProductDTO {
	private int pno; 
	private String pname; 
	private String ptype; 
	private String pmemo; 
	private int price;     
	private int avail_cnt; 
	private int sale_cnt; 
	private DATE regdate ; 
	private String p_img;
	
	
}
