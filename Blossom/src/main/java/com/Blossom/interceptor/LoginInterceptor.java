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
		
		//이동하기 전 있었던 page URL
		String referer = request.getHeader("referer"); // 이전페이지 목적지만 알고있는 상태 
		 log.info(">>>>>>>>>> referer: " +referer);
		 // ?(쿼리스트링)뒤에 값을 알려준다 쿼리스트링이 없으면 null 값이 들어온다 
		// 인터셉터 /board/answer
			// uri ==> 쿼리스트링으로 잘라둬서 board/answer 까지만 나타나는 상태 
			
			//  1)session 체크(NO 로그인)
			//    referer(이전페이지로) 이동
			//      + message(nologin) + uri(uri)
			
			// 이전페이지: /board/view/10
			// message = nologin >> 로그인 모달창 출력
			// uri ==> 로그인 버튼 클릭시 uri 이동
		 String qString = request.getQueryString();
		// 이동 하려고 했던 page  URL		 
		String uri = request.getRequestURI(); // 내가 가려고 하는 페이지 
		String ctx = request.getContextPath(); // context - root
		String nextUrl = uri.substring(ctx.length()); //
		String prevUrl = "";
		String finalUrl = "http://localhost:8081/Blossom/";
		
		
		
		
		// 비정상적인 접근을 막는 기능
		if(referer == null) { // url을 바로 다이렉트로 치고 들어오면 null 이다 
			log.info("WARING>>>>>>>>>>> 비정상적인 점근 :(");
			response.sendRedirect(finalUrl); 
			// 비정상 접근시 바로 인덱스 페이지 로 이동
			// session(로그인 정보)확인 안한 상태 
			return false;
			
		 } else {
			 
			//게시글 등록, 수정(로그인이 필요한 view)단
			// 내부에서 접근했지만 비정상 경로일때 
			int indexQuery = referer.indexOf("?");
			
			if(indexQuery == -1) { // 
				prevUrl = referer.substring(finalUrl.length()-1);
					// http://localhost:8081/metop/ 28-1 = 27
			 } else {
					
				prevUrl = referer.substring(finalUrl.length()-1, indexQuery);
				//indexQuery = 40
				
			 }	
			log.info("prev URL >>>>>>>>>>>" + prevUrl);
			log.info("NEX URL >>>>>>>>>>>" + prevUrl);
		
			if(nextUrl.equals("/board/update") || nextUrl.equals("/board/delete")) {
				// 지금하려는 기능이 게시글 수정 or 삭제인것인지 
				// referer 주소에 board/view가 있는지 
				if(request.getParameter("title")==null) { 
					// /update가 2가지 get, post 두가지 경우가 있음
					// 상세계시글에서 view -> update로가는 경우
					// 게시글 수정 후 update -> update 로 다시 돌아가는 경우
					// update 에 수정하러 접속된 경우 작성자와 로그인 유저가 같다는 의미이므로
					//view에서 접속시에만 확인 진행 
					if(prevUrl.indexOf("board/view") == -1) {
						// 상세 게시글에서 정상 접근 했는지를 확인 
						// 글을 수정하거나 삭제할때 
						// 조건 1 로그인
						// 조건 2 해당글 작성자 
						log.info("WARING >>>> 비정상적인 접근 :(");
						response.sendRedirect(finalUrl);
						return false;
					}
				}
			}
	
	   }		
	// 정상적인 접근인 경우 실행 
		if(session.getAttribute("userid") == null) {
			// boaurd update 에서 로그아웃 누르면
			// session 초기화 /board/update 새로고치면
			// 다시 interceptor가 낚아챈다 
			// 로그아웃으로 session이 없기 때문에
			// 원래 페이지 board update 로 가게 되어 반복
			
			if(prevUrl.equals(nextUrl)) {
				log.info("Waring>>prevUrl == nextUrl :/");
				response.sendRedirect(finalUrl);
				return false;
			}
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			if(qString !=null) {
				
				uri=uri+"?"+qString;
				// 대댓글 달때 로그인이 안되어있으면 
				// 로그인 후 answer로 보내줘야 하는데 갈때 bno가 필요함
				// 쿼리스트링을 자르도록 설쟁해서 로그인시 
				// board/answer만 보내는데
				// qString으로 쿼리스트링 값을 알수 있게 해줌 
				
			}
			fMap.put("uri", uri);
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer ); // 이전 페이지로 보내준다 
			
			return false; // 이동 X
			
		 } else { // login ok
			 log.info(">>>>>>> LOGIN:)");
			 return true;
		 }
	
		
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

	

