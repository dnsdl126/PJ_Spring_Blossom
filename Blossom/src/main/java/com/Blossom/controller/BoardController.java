package com.Blossom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Blossom.domain.BoardDTO;
import com.Blossom.service.board.BoardService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@GetMapping("/list")
	public String list (Model model) {
		log.info("GET: BOATD LIST PAGE");
		
		List<BoardDTO> list = bService.listAll(); // 게시물 목록 
		// 앞으로 보내질 양이 많기 때문에 BoardDTO를 map 으로 다시 또 담음 
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		
		model.addAttribute("map", map);
		
		
		return "board/list";
		
	}
}
