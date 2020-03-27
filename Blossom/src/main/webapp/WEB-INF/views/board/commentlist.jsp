<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/> 
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
<div class="coment">
		
		<div class="cometn_sub_title">
			<input type="hidden" class="replyListCnt" value="${list.size()}">
			 Comment "${list.size()}" 건
		</div>
		
		<c:forEach items = "${list}" var="list">
		
		<div class="coment_box">
			<div class="coment_box_css">			
				
				<div class="coment_box_list2">
					<div class="box_list">
						<div class="box_box" style="display: flex">
							<div class="like" style="padding: 5px;">
							   	 <fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/>
							</div>
							<div class="coment_like" style="margin-top: 5px;">
								<a href="#" class="like_list"><i class="fas fa-heart"></i></a>							
							</div>
							<div class="review_like_action__score">
								<div class="review_like_action__score_arrow"></div>
								<span class="review_like_action__score_text" style="color: white">0</span>						
							</div>
						</div>
						<div class="coment_content">
							${list.content}
						</div>
					</div>
					<div class="coment_content_title">						
						
					</div>					
				</div>
				<div class="coment_box_list1">
					<ul>
						<li>
							
							<div class="coment_box_list_box" style="font-weight: bold">
								작성자
							</div>
							<div class="coment_box_list_title" style="padding: 10px">
									${list.writer}
							</div>
							<c:if test="${name == list.writer}">
								<div class="delete_button_css">
									<button type="button" class="comment_delete_button" data_num="${list.rno}"> 삭제</button>
								</div>	
							</c:if>	
							
						</li>
					</ul>
				</div>
				
			</div>
					
		</div>
		</c:forEach>
		
		<c:if test="${list.size() == 0}">
			<div class="coment_box">
			<div class="coment_box_css">			
				
				<div class="coment_box_list2">
					<div class="box_list">
						<div class="box_box" style="display: flex">
							<div class="like" style="padding: 5px;">
							   	 <fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
							</div>
							<div class="coment_like" style="margin-top: 5px;">
								<a href="#" class="like_list"><i class="fas fa-heart"></i></a>							
							</div>
							<div class="review_like_action__score">
								<div class="review_like_action__score_arrow"></div>
								<span class="review_like_action__score_text" style="color: white">0</span>						
							</div>
						</div>
						<div class="coment_content">
							등록된 comment 가 없습니다 :(
						</div>
					</div>
					<div class="coment_content_title">						
						
					</div>					
				</div>
				<div class="coment_box_list1">
					<ul>
						<li>
							<div class="coment_box_list_box" style="font-weight: bold">
								작성자
							</div>
							<div class="coment_box_list_title" style="padding: 10px">
								관리자
							</div>
						</li>
					</ul>
				</div>
				
			</div>			
		</div>
		</c:if>
		<div class="new_button_comment" >
			<button type="button" class="new_button_comment_button">새로운 Comment 확인하기</button>
		</div>
		<div class="cometn_sub" >
			Comment
		</div>
		<div class="list_box" >
			<c:choose>
				<c:when test="${empty userid}">
					<div class="login_box_content_list_01" style="padding:5px;">
						<div class= "login_box_content_css">
							<span class="reply_btn">로그인</span>을 하셔야 댓글을 등록 할 수 있습니다.
						</div>
					</div>
				</c:when>
				<c:otherwise>
				<form class="frm_reply">
					<input type="hidden" name="bno" class="reply_bno">
					<input type="hidden" name="type" class="reply_type">
					<input type="hidden" name="writer" class="reply_writer">
					<div class="coment_plus">
						<div class="plus_box">
						 	<textarea placeholder="댓글을 입력하세요" name ="content" class="coment_input" style="border: none;"></textarea>						
						</div>
						<div class="comment_commit">
							
						 	<button type="button" class="reply_btn_plus">Comment</button>
						</div>
				    </div>	
				    <div class = "err_msg">
						<Strong>Comment</Strong>를 입력해주세요 
					</div>
				</form>
				</c:otherwise>
			</c:choose>
					
		</div>


	</div>

</body>
</html>