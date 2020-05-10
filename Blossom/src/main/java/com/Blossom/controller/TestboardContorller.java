package com.Blossom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Blossom.domain.TestBoardDTO;
import com.Blossom.domain.TestDTO;
import com.Blossom.service.test.TestService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/test")
public class TestboardContorller{
   
	@Autowired
	TestService tService; // 서비스 를 써야애
	
	@GetMapping("/boardNewFile")
	public String testlist(Model model) {
		log.info("테스트 진행하께요오오오");
		
		List<TestBoardDTO> list = tService.testlistall();
		for (TestBoardDTO testBoardDTO : list) {
			log.info(testBoardDTO.toString());
		}
		log.info("있음?"+list);
		model.addAttribute("list", list);
		
		
		return "test/boardNewFile";
		
	}
	
	@GetMapping("/newwrite")
	public String write() {
		return "/test/newwrite";
	}
	
	@PostMapping("/newwrite")
	public String twrite(TestBoardDTO tDto) {
		log.info("나와다 " + tDto.toString());
		tService.twrite(tDto);
		
		
		return "/test/newwrite";
	}
    
	@GetMapping("/update")
	public String update( int tbno, Model model) {
		log.info("변경한다아앙");
		log.info("번호"+tbno);
		
		model.addAttribute("one", tService.update(tbno) );
		
		
		return "/test/newwrite";
	}
	
	@PostMapping("/update")
	public String tupdate(TestBoardDTO tDto) {
		log.info("수정간다아 " + tDto.toString());
		tService.tupdate(tDto);
		
		return "/test/boardNewFile";
	}
    
    
}
