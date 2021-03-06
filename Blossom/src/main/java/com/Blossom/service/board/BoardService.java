package com.Blossom.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.Blossom.domain.BoardDTO;
import com.Blossom.domain.MemberDTO;
import com.Blossom.persistence.BoardDAO;



public interface BoardService {
	
	//게시글 갯수 계산
	public int countArticle(String search_option, String keyword);
	
	//목록(페이지 나누기, 검색기능 포함)
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end);

	public BoardDTO boardview (int bno); 
	// 돌아올 타입에따라 정의
	// 리턴시 BoardDTO로 받아야하기 때문에
	// public BoardDTO로 정의
	
	public void increaseViewCnt( HttpSession session, int bno);
	
	public void delBoard(int bno);
	
	//게시글 등록 
	public void write(BoardDTO bDto);
	
	//게시글 수정
	public void updateBoard(BoardDTO bDto);
	
	//게시글 답글 등록
	public void answer(BoardDTO bDto);
	
	//해당 게시글 첨부파일 목록 출력
	public List<String> getAttach(int bno);
}
