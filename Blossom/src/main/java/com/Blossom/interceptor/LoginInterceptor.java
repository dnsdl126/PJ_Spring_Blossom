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
		
		String referer = request.getHeader("referer"); // 이전페이지 목적지만 알고있는 상태 
		log.info("□■□■□■□■□■□■□■□■□■□■이전 URL :" + referer);
		
		// Login NO
		if(session.getAttribute("userid") == null) {
			log.info("□■□■□■□■□■□■□■□■□■□■ NOLOGIN :(");
			
			 	// request : 서버로 요청
				// Referer : 바로 직전에 머물렀던 웹 링크 주소 
			    
			
			 // URL만 신경, GET or POST 중요하지 않다
			 // 회원수정 페이지: GET:/member/update
			 // 회원수정 DB: POST:/meber/update
			 // request(GET, POST) > response(forward, sendRedirect)
			
			//원페이지 가서 에러 메세지를 띄워야 한다 
			// flashmap : 1회성 데이터 
			// 1번 주고 사라진다 -> 새로고침하면 받아오지 못한다 
			
			
			// login NO
			
				
				String uri = request.getRequestURI();
				log.info(">>>>> 목적지 : " + uri);
				
				if(referer == null) {
					// 비정상 경로로 접근한 경우
				    // url로 바로 접근한(외부에서 접근) 경우 (referer이 없는 경우)
					referer = "http://localhost:8081/Blossom/";
				} else {
					//게시글 등록, 수정(로그인이 필요한 view)단
					// 내부에서 접근했지만 비정상 경로일때 
					int index = referer.lastIndexOf("/");
					int len = referer.length();
					log.info(">>>>>> 인덱스 : " + index);
					log.info(">>>>>> 인덱스 : " + len);
					String mapWord = referer.substring(index, len);
					// substring 문자열을 잘라라 index에서 len 까지 (맨 끝에 write를 잘라라 )
					log.info("수정된 URL:" + mapWord);
					
					if(mapWord.equals("/write")) {
						response.sendRedirect(request.getContextPath()+ "/board/list");
						return false;
					}
				}
				
				
				
				// 게시글 작성에서 로그아웃 할경우
				 // return true : 게시글 등록 페이지 
				 //  로그아웃기능 : 1. 세션을 초기화 2. 원페이지로 새로고침
				 // 게시글 작성 페이지에서 로그아웃 하면 ajax를 타고 가서 세션이 먼저 삭제된다
				 // 원페지 /board/write 로 돌아가는데  새로고침을 진행한다
				 // /board/write 다시한번 입력 (input) 하는데
				 // interceptor로 가게 해뒀기 때문에
				 // interceptor로 가는데 session이 없기 때문에
				 // nologin 메세지를 담아 referer (이전페이지 : /board/write)로 간다 
				 // 위에 경로를 계속 반복하게 되다가 일정 횟수가 되면 timeout 기능으로 작업을 종료 
				
				
			
			
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			fMap.put("uri", uri);
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer ); // 이전 페이지로 보내준다 
			
			return false;
			//URL로 바로 접근한 경우(referer 이 없는 경우) 인덱스 페이지로 
			
		}else { 
			
			
			log.info("□■□■□■□■□■□■□■□■□■□■ LOGIN :)");
			return true; // 원래 가려던 곳으로 이동 -> 이동 O 
				 
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
