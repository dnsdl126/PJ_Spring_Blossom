package com.Blossom.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.Blossom.domain.BoardDTO;



public interface BoardDAO {

	//게시글 갯수 계산
	public int countArticle(@Param("map") Map<String, String> map);
	
	//목록(페이지 나누기, 검색기능 포함)
	public List<BoardDTO> listAll(@Param("map") Map<String, Object> map);
	
	public BoardDTO view(@Param("bno") int bno);
	
	// 조회수 1 증가
	public void increaseViewCnt(@Param("bno") int bno);
	
	//게시글 삭제
	// 게시글을 바로 삭제하는 것이 아니여서
	// mapper 에서 updqte 로 보이지만 않게 수정  
	public void delBoard(int bno);
	
	
	//게시글 등록 
	
	public void write(BoardDTO bDto);
	// 게시글 수정
	public void updateBoard(@Param("board")BoardDTO bDto);
	
	// 게시글 답글 등록
	
	public void answer(BoardDTO bDto);
	
	public void updateStep(BoardDTO bDto);
	
	// 첨부파일 등록 
	public void addAttach(@Param("fullName") String fullName);
	
	//첨부파일 목록
	public List<String> getAttach(@Param("bno") int bno);

	//첨부파일 삭제
	public void deleteAttach(@Param("bno") int bno);
	
	//첨부파일 수정(재등록)
	public void updateAttach(@Param("fullName") String fullName, @Param("bno") int bno);
	
}
