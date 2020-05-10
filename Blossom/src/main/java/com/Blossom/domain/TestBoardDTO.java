package com.Blossom.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class TestBoardDTO {
	private int tbno ;
	private String title;
	private String twriter;
	private Date tdate;
}
