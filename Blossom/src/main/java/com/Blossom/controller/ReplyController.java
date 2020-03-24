package com.Blossom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Blossom.domain.ReplyDTO;
import com.Blossom.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	@GetMapping("/list")
	public String list(int bno, Model model) {
		
		log.info(">>>>> GET: Reply List PAGE");
		
		
//		for(ReplyDTO replyDTO : list) {
//			log.info(replyDTO.toString());
//		}
		
		model.addAttribute("list", rService.list(bno));
		
		return "/board/commentlist";
	}

}
