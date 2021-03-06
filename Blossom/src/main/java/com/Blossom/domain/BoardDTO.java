package com.Blossom.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class BoardDTO {
	
		private int bno; 				// 게시글 번호
		private String type;
		private String title; 			// 게시글 제목
	    private String view_content;    // 게시글 내용(에디터 태그 추가)
	    private String search_content;  // 게시글 내용(순수 text)
	    private String writer; 			//게시글 작성자
	    private int viewcnt; 			//조회수
	    private int replycnt; 			//댓글수
	    private int goodcnt;			//좋아요
	    private int filecnt;            // 첨부파일수
	    private String name; 			// 작성자 이름 (tbl_membe과 테이블과 조인)
	    private Date regdate; 			// 작성일자
	    private Date updatedate;		// 수정일자
	    private String show; 			// 화면 표시여부
	    private String[] files; 		//첨부파일 이름 배열
	    private int ref; 				//답변 그룹 번호
	    private int re_step; 			// 답변 출력 순서
	    private int re_level; 			// 답변 단계(계층형)
}
