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
margin-bottom: 120px;
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
    border-left: solid 1px #a4b0be;
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

.new_button_comment{
	display: flex;
    justify-content: center;
    padding: 11px;
    width: 79%;
    margin: auto;
}
.new_button_comment_button{
    font-size: 15px;
    background: #f1f2f6;
    border: none;  
    color: black;
    cursor: pointer;
    outline: none;
    border-radius: 4px;

}
.new_button_comment_button:hover {
	 background:#9EE6CF;
	 color: white;

}
.cometn_sub {
	width: 79%;
	height: 30px;
	text-align: left;
	font-weight: bold;
	font-size: 12px;
	margin: auto;
	background:  #3D87C1;
	color: white;
	padding: 5px;
	margin-top: 10;
}
.list_box {
	width: 79%;
	margin: auto;
}
.plus_box {
	border: solid 1px #a4b0be;
	width: 80%;
	height: 100px;
}
.err_msg {
	color: tomato;
	font-size: 14px;
	margin-left:10px;
	visibility: hidden;
	
}
.coment_plus{
	padding: 10px;
	display: flex;
	border: solid 1px #a4b0be;
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
   
    border-radius: 4px;
	
} 

.reply_btn_plus{
	padding: 32px;
    font-size: 15px;
    border: none;
    cursor: pointer;
    background: #f1f2f6;
    outline: none;
}
.reply_btn_plus:hover {
	color: white;
	background:#9EE6CF;
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
	
.login_box_content_list_01{
	width: 100%;
    height: 75px;
    padding: 7px;

}
.login_box_content_css {
	padding : 5px;
	border: solid 1px ;	
	height: 50px;
    font-size: 15px;
    padding: 14px;
}
.reply_btn{
	font-weight: bold;
    color: skyblue;
    cursor: pointer;
	
}
</style>

</head>
<%@ include file = "../include/Modal.jsp"%>
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
			<div class="contet_sub size right replycnt_plus">
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
				<a href="${header.referer}" class="box_deco">목록</a>
				<a href="#" class="box_deco">답변</a>
			<c:if test="${name ==one.writer }">	<!-- 로그인 유저랑 작성자랑 같을때만 수정 삭제 -->
				<a href="#" class="box_deco">수정</a>
				<a href="#" class="box_deco delete">삭제</a>
			</c:if>	
			</div>
			
		</div>
	
	
	<!-- 댓글창 -->
	<div id="listReply"></div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
/*  삭제 버튼 클릭시 모달창 open */
 $(function(){ //화면단이 다만들어지면 시작해라 
	 
	 listReply(); //페이지 시작하자마자  호출해라 listReply(); 메서드를  
	 			  // listReply(); 아래 정의 되어있음
	 
	 $('.delete').click( function(){
		$('.modal_wrap').css('display','flex');	 
	 });
	 
	 $('#modal_msg_yes').click( function(){
		 location.href='${path}/board/delete?bno=${one.bno}';
	 });
	 
	
 
 });
 

 
 $(document).on('click','.reply_btn',function(){
		$('.modal_login_wrap').css('display','flex');
		
	});
 
 $(document).on('click','.reply_btn_plus',function(){ 
	 // 문서에서 reply_btn_plus 클릭이 되면
	 // commentlist.jsp는 정확히 말하면 include.jsp가 include 된 상태는 아니다
	 
	 	var reply_txt = $('.coment_input').val();
	 		console.log(reply_txt);
	 
	 	if(reply_txt == '' || reply_txt.length == 0) {
	 		$('.reply_txt').focus();
	 		$('.err_msg').css('visibility', 'visible');
	 		return false;
	 	}	
	 	
	 	$('.reply_bno').val('${one.bno}'); // 게시글 번호 입력
	 	$('.reply_type').val('${one.type}'); 
	 	$('.reply_writer').val('${name}');
	 	
	 	
	 	$.ajax({
	 		// 댓글 등록
	 		// type, content, writer, bno
	 		url: '${path}/reply/insert',
	 		type: 'POST',
	 		data: $('.frm_reply').serialize(), //frm_reply 4개의 정보가 담겨 있음 .serialize()는 직렬화 해주는 함수
	 		success: function() {
	 			
	 			listReply();
	 		}
	 		
	 	});
		
	});
 
 // 댓글 목록 출력 함수
 function listReply(){
	 $.ajax({
		 type: "get",
		 async: false,
		 url: "${path}/reply/list?bno=${one.bno}", // replyController에 list를 찾음
		 success: function(result){ 
			  // result에는 commentlist.jsp가 들어있다 
			  // http://localhost:8081/Blossom/reply/list?bno=339 를 url로 입력하면
			  // commentlist.jsp의 값들이 출력된다  	  
			 //result:  responeseText 응답텍스트 (html)
		 	$("#listReply").html(result);
		 }		 
	 });
	 $('.replycnt_plus').text($('.replyListCnt').val());
	 // ajax는 비동기 방식이기 때문에 동시에 같이 처리되어 replycnt가 +1 되기전에 처리된다
	 // async: false로 처리해야 된다 
 }
 

 

</script>
</html>
