/*
 * Login이 필요한 기능 수행시
 * Session 체크를 하는 Interceptor
 */

package com.Blossom.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	// interceptor는 상속이 필요하다  	
	// HandlerInterceptorAdapter 가 있어야지만 상속이 가능하다
	
	@Override
	 // URL 전
	 //@Override : 부모 메서드를 재정의 해서 사용 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//boolean : return 값으로 true  & false 만 받는다 
		// true : Interceptor가 메서드 진행하도록 보내준다
		// false : Interceptor가 돌려 보낸다 
		// Session 객체 생성
		
		HttpSession session = request.getSession();
		
		// Login NO
		if(session.getAttribute("userid") == null) {
			log.info("□■□■□■□■□■□■□■□■□■□■ NOLOGIN :(");
			String referer = request.getHeader("referer"); // 이전페이지 목적지만 알고있는 상태 
			 	// request : 서버로 요청
				// Referer : 바로 직전에 머물렀던 웹 링크 주소 
			    
			log.info("□■□■□■□■□■□■□■□■□■□■이전 URL :" + referer);
			 // URL만 신경, GET or POST 중요하지 않다
			 // 회원수정 페이지: GET:/member/update
			 // 회원수정 DB: POST:/meber/update
			 // request(GET, POST) > response(forward, sendRedirect)
			
			//원페이지 가서 에러 메세지를 띄워야 한다 
			// flashmap : 1회성 데이터 
			// 1번 주고 사라진다 -> 새로고침하면 받아오지 못한다 
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			
			
			//URL로 바로 접근한 경우(referer 이 없는 경우) 인덱스 페이지로 
			if(referer == null) {
				referer = "http://localhost:8081/Blossom/";
			}
			log.info("null URL" + referer);
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer ); // 이전 페이지로 보내준다 
			
			
			 return false; //  이동 x
				 // 이전 url
				 // 상품페이지 15번 페이지에 20번재 게시물에 댓글 달려고 함
				 // http://127.0.0.1:8081/metop/free/view?page=15&bno=20
				 // 댓글을 작성 -> 로그인이 필요
				 
				 // request 
				 // http://127.0.0.1:8081/metop/reply/insert?bno=20
				 
				 // Interceptor 체크하여 
				 // 성공 : http://127.0.0.1:8081/metop/reply/insert?bno=20
				 // 실패 : http://127.0.0.1:8081/metop/free/view?page=15&bno=20
				 //        return 이전페이지;  
			 
		} else { // Login OK
			log.info("□■□■□■□■□■□■□■□■□■□■ LOGIN :)");
			return true; // 원래 가려던 곳으로 이동 -> 이동 O
		}
		
		
	}
	
	
//	@Override
//	 // URL 후
//	 //@Override : 부모 메서드를 재정의 해서 사용 
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		super.postHandle(request, response, handler, modelAndView);
//	}

	
}
