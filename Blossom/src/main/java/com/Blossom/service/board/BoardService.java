package com.Blossom.service.board;

import java.util.List;

import com.Blossom.domain.BoardDTO;



public interface BoardService {
	
	//게시글 갯수 계산
	public int countArticle(String search_option, String keyword);
	
	//목록(페이지 나누기, 검색기능 포함)
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end);

	

	
}
