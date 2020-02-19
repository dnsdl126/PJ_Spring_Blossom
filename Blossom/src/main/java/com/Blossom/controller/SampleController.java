package com.Blossom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Blossom.domain.SampleDTO;

import lombok.extern.slf4j.Slf4j;

 //lombok 라이브러리의 log기능을 사용
@Slf4j

//Spring이 동작시 DispatcherServlet 생성과정에서
//servlet-context.xml의 환경설정을 읽어들이는데
//servlet-context.xml 내의 component-scan이
//설정된 경로를 돌아다니며 @Controller가 붙어있는
//Class들을 전부 Spring  Context에 Beans로 등록
//되어 있어야 DispatcherServlet이 Handler Mapping 과
//Handler Adapter을 통해 요청처리를 시킬수 있음

//Spring Context에 Beans로 등록되었다
//= Spring이 객체의 제어권을 개발자로부터 넘겨받음 (IOC패턴)

//Spring Context에 Beans로 등록되어있는 객체들만
//의존성주입 가능 (DI패턴)

@RequestMapping("/sample")
@Controller
public class SampleController {
	   
	//sample.jsp 출력
	  @RequestMapping("/")
	   public String print() {
		   return "sample";
	  }
	
		
	  //@RequestMapping(value="/sample/view", method=RequestMethod.POST)
	  @GetMapping("/view")	  
	   public String view(String user) {
		  log.info("Get 방식 호출");
		  log.info("user: " + user);
		   return "result";
	  }
	  
	  //@RequestMapping(value="/sample/view", method=RequestMethod.POST)
	  @PostMapping("/view")
	  public String view(SampleDTO sDto) 
	  {
		   //input 2개 값을 전달(Name 속성값)
		   // name=user, name=pass
		   //@Requestparam 생략가능 하다
		   


		  
		  // (과거) view단으로부터 데이터를 받는 방법
		  // request.getParameter(""); 값을 모두 String 타입으로 받음
		  // 개발자가 받아서 형변환하는 작업이 필수
		  // 추가로 값을 view단에서 넘겨주지 않으면 Null값이 들억
		  // 하단에 매개 변수를 사용하는 부분에서 Error 발생
		  //Null 체크 해주는 코드 필수 
//		  String user = request.getParameter("user");
//		  String pass = request.getParameter("pass");
		  
		  
		  log.info("Post 방식 호출");
		  //log.info(user + "," + pass);
		  log.info(sDto.toString());
		   return "result";
	  }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
