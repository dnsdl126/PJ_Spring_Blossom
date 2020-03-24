<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="coment">
<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
		<div class="cometn_sub_title">
			Comment List ${list.size()}
		</div>
		<c:forEach items = "${list}" var="list">
		<div class="coment_box">
			<div class="coment_box_css">			
				
				<div class="coment_box_list2">
					<div class="box_list">
						<div class="box_box" style="display: flex">
							<div class="like" style="padding: 5px;">
								
								<c:choose>
							   	 	<c:when test="${today == regdate}" >
							   	 		<fmt:formatDate value="${list.regdate}" pattern="HH:mm:ss"/>
							   	 	</c:when>
							   	 	<c:otherwise>
							   	 		<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/>
							   	 	</c:otherwise>
								</c:choose>
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
						</li>
					</ul>
				</div>
				
			</div>			
		</div>
		</c:forEach>
		<div class="cometn_sub">
			Coment
		</div>
		<div class="list_box">
			<div class="coment_plus">
				<div class="plus_box">
				 <input type="text" name="" placeholder="댓글을 입력하세요" class="coment_input" style="border: none;">					
				</div>
				<div class="comment_commit">
				 <a href="">commnet</a>
				</div>
			</div>			
		</div>


	</div>

</body>
</html>