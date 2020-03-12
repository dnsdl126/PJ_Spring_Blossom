package com.Blossom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Blossom.domain.ProductDTO;
import com.Blossom.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;

@Controller  //의존성 주입 : 제어권을 넘긴다 -> IOC패턴 () --> DI패턴을 사용할수 있다. 
@Slf4j // log 관련 기능 
public class IndexController {
	// @Inject, @Autowired, @Resource중 1개라도
	// 붙어있으면 의존성 주입 
	
	//@Inject와 @Autowired는 타입으로 의존성 주입
	//@Resource는 변수명으로 의존성 주입 
	
	@Autowired
	IndexService iService;
	
	
	@RequestMapping("/") // localhost:8081/프로젝트 이름 /(까지가 contextroot)-->  context루트 다음에 붙는 /를의미 
	public String indexView(Model model, HttpSession session) {
		log.info(">>>>>> INDEX PAGE 출력");
		// 컨트롤러는 기능을 처리 하는 것이 아니라 어디로 가라고 지정만 해줌 				
		//1. View 단에 출력할 베스트 상품 5건		
		model.addAttribute("BestPdt", iService.bestPdtList());
				
		//2.View단에 출력할 신상품 5건
		// 신상품 5건을  출력하는 비즈니스 로직을 처리하는 서비스 단으로 이동 
		// 서비스 단으로 이동
		model.addAttribute("NewPdt",iService.newPdtList());
		
		
		//개발 종료시 삭제할것
		/*
		 * session.removeAttribute("userid"); //removeAttribute 세션에 userid 값을 초기화
		 * session.removeAttribute("name"); session.setAttribute("userid",
		 * "dnsdl1331@naver.com"); // 위에 초기화된 session에 oginDto.getId() 넣겠다
		 * session.setAttribute("name","김뇽꾸렁" );
		 */
		
		//2. 출력할 화면을 결정  
		return "index";
      // 1.2번 가지고 viewreserve로 이동
	}

}
