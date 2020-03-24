<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세게시글</title>
<link rel="stylesheet" type="text/css"  href="${path}/resources/css/common.css">
	 <script src="https://kit.fontawesome.com/66fbac40f5.js" crossorigin="anonymous"></script>
<style type="text/css">


.content {
width: 1400px;
background-color: white;
position: relative;
margin-top: 150px;
margin: auto;



}
.sub_title {
text-align: center;
min-height: 30px;
margin: 100px 0 40px;

}
.content_ist {
	display: flex;
	width: 80%;
	margin: auto;
}

.title{
	text-align: center;
	width: 121px;
}
.main{
	text-align: center;
	width: 340px;
}
.size {
padding: 10px;
height: 44px;
border-top: solid  #9EE6CF;   
vertical-align: middle;
}

.title_sub{
	text-align: left;
	width: 80%
}

.contet_sub{
	text-align: center;
	width: 204px;
}

.box {
	padding: 50px;
	border-top: solid  #9EE6CF;
	border-bottom: solid #9EE6CF;   
	width: 59%;
    margin: auto;
    height: 400px;
}
.right{
	border-right: solid 1px #9EE6CF;
}
.font_we{
	font-weight: bold
}

.button_list{

	display: flex;
    justify-content: flex-end;
    width: 59%;
    outline: none;
    margin: auto;
}
.box {

	
}

.box_deco {
	width: 100px;
	height: 39px;
	line-height: 3px;	
	text-align: center;  
    padding: 20px;
    border-radius: 4px;
    margin: 10px;
    background: #f1f2f6;
}

.box_deco:hover {
	color: white;
	background:#9EE6CF;
}


/*댓글*/
.coment{
width: 1400px;
background-color: white;
position: relative;
margin-top: 150px;
margin: auto;
}
.cometn_sub_title{
	width: 80%;
	height: 30px;
	text-align: left;
	font-weight: bold;
	font-size: 14px;
	margin: auto;
	
	color: black;
	padding: 5px;
	border-bottom: solid #3D87C1;
}

.coment_box {
	padding: 10px;
	position: relative;
	width: 80%;
    margin: auto;
    display: flex;
}
.coment_box_css {
	display: flex;
	padding: 10px;
	border: solid 1px #a4b0be;
	width: 100%	

}
.like_list{
	border: solid 1px #a4b0be;
	width: 80px;
	height: 50px;
	padding: 2px;
	border-radius: 4px;
	margin-left: 10px;
	color:tomato;
	font-size: 12px;
}
/*.like_list:hover {
	background: #5e5e5e;
	color: white;
}*/
.review_like_action__score{
	display: inline-block;
    zoom: 1;
    background: #5e5e5e;
    border: 1px solid white;
    min-width: 35px;
    line-height: 22px;
    text-align: center;
    margin: 3px 8px 3px 7px;
    position: relative;
}
.review_like_action__score_arrow{
	width: 0;
    height: 0;
    border-top: 10px solid transparent;
    border-bottom: 10px solid transparent;
    border-right: 10px solid #5e5e5e;
    position: absolute;
    top: 2px;
    left: -5px;
    font-size: 0;
    line-height: 0;
}

.coment_box_list1{
	 width: 20%;
    padding: 39px;
    border-left: solid;
    text-align: center
}
.coment_box_list1 li:first-child{
	padding-top: 0;
	border: none;
}
.coment_box_list1 li div{
	color:#57606f;

}
.coment_box_list2{
	padding: 10px;
	width: 80%;
	
}
.box_list{
	padding: 10px;
	margin-bottom: 16px;
}
.coment_content_title{
	display: flex;
	margin-right: 10px;

}
.coment_content {
	padding: 5px;
	border-top: solid 1px;
}
.cometn_sub {
	width: 80%;
	height: 30px;
	text-align: left;
	font-weight: bold;
	font-size: 12px;
	margin: auto;
	background:  #3D87C1;
	color: white;
	padding: 5px;
}
.list_box {
	width: 80%;
	margin: auto;
}
.plus_box {
	border: solid 1px #a4b0be;
	width: 80%;
	height: 100px;
}
.coment_plus{
	padding: 10px;
	display: flex;
}
.coment_input{
	outline: none;
    width: 100%;
    height: 100%;
    padding: 10px;
    font-size: 15px;
}    
.comment_commit{
	width: 13%;
    margin: auto;
    text-align: center;
    height: 69px;
    padding: 24px;
    font-size: 15px;
    border-radius: 4px;
	background: #f1f2f6;
}
.comment_commit:hover {
	background:  #9EE6CF;
	color: white; 
}
.like_button{
	display: flex;
	justify-content: flex-end;
	width: 80%;
	margin: auto;
}
.like_like{

	width: 94px;
    height: 44px;
    line-height: 7px;
    text-align: center;
    padding: 16px;
    border-radius: 4px;
    margin: 10px;
    border: solid 1px tomato;
    color: black;
}
.like_like:hover {
	color:white;
	background: tomato}
	
</style>
</head>

<body>
	<div class="content">
		<div class= sub_title>
			<h1>FAQ</h1>
		</div>
		<div class="like_button">
			<a href="" class="like_like">LIKE <i class="fas fa-heart"></i></a>
			<span></span>
		</div>
		<div class="content_ist">
			<div class="main size right font_we">
			   subject
			</div>
			<div class="title_sub size">
				${one.title}
			</div>						  			
		</div>
		<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
		<div class="content_ist">
			<div class="title size right font_we">
			   writer
			</div>
			<div class="contet_sub size right">
				${one.writer}
			</div>
			<div class="title size right font_we">
			   날짜
			</div>
			<div class="contet_sub size right">
				<c:choose>
			   	 	<c:when test="${today == regdate}" >
			   	 		<fmt:formatDate value="${one.updatedate}" pattern="HH:mm:ss"/>
			   	 	</c:when>
			   	 	<c:otherwise>
			   	 		<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd"/>
			   	 	</c:otherwise>
				</c:choose>
			</div>
			<div class="title size right font_we">
			   coment
			</div>
			<div class="contet_sub size right">
				${one.replycnt}
			</div>
			<div class="title size right font_we">
			   like
			</div>
			<div class="contet_sub size right">
				${one.goodcnt}
			</div>
			<div class="title size right font_we">
			   View
			</div>
			<div class="contet_sub size">
				${one.viewcnt}
			</div>		
			</div>
										  			
		</div>
		<div class="box">
			동백샴푸는 인덕ㅇ친덕 ㅓ해요 
		</div>
		<div class="flex_class" >
			<div class="button_list">
				<a href="${path}/board/list" class="box_deco">목록</a>
				<a href="#" class="box_deco">답변</a>
			<c:if test="${name ==one.writer }">	<!-- 로그인 유저랑 작성자랑 같을때만 수정 삭제 -->
				<a href="#" class="box_deco">수정</a>
				<a href="#" class="box_deco">삭제</a>
			</c:if>	
			</div>
			
		</div>
	</div>
	<div class="coment">
		<div class="cometn_sub_title">
			Coment List
		</div>
		<div class="coment_box">
			<div class="coment_box_css">			
				
				<div class="coment_box_list2">
					<div class="box_list">
						<div class="box_box" style="display: flex">
							<div class="like" style="padding: 5px;">
								2019-03-23
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
							뇽덕이 꿀꿀 점심달라 꿀굴 
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
								김뇽꾸렁
							</div>
						</li>
					</ul>
				</div>
				
			</div>			
		</div>
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