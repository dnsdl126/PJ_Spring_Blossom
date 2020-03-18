package com.Blossom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Blossom.domain.BoardDTO;
import com.Blossom.service.board.BoardService;
import com.Blossom.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@GetMapping("/list")
	public String list (
			// 페이지 이동을 안했을 경우 보내줄 정보가 없기 때문에
			//@RequestParm으로 dafault 값을 설정 
			@RequestParam(defaultValue="1") int curPage, 
			Model model) {
		log.info("GET: BOATD LIST PAGE");
		
		//개시글 갯수 계산
		// 선행조건 리턴시 15개 정보가 담긴다 
		int count = bService.countArticle();
		
		//페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		//curPage 1페이지 2페이지 인지 
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		
		
		List<BoardDTO> list = bService.listAll(start, end); // 게시물 목록 
		// 앞으로 보내질 양이 많기 때문에 BoardDTO를 map 으로 다시 또 담음 
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		
		model.addAttribute("map", map);
		
		
		return "board/list";
		
	}
}
