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
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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
	width: 72px;
}
.main{
	text-align: center;
	width: 310px;
}
.size {
padding: 10px;
height: 44px;
border-top: solid  #9EE6CF;   
vertical-align: middle;
}

.size_01 {
height: 44px;
border-top: solid  #9EE6CF;   
vertical-align: middle;
font-size: 20px;
 font-weight: bold;
}

.size_02{
padding: 10px;
height: 44px;
border-top: solid  #9EE6CF;   
vertical-align: middle;
}

.title_sub{
	text-align: left;
	width: 811px;
	padding: 6px;
	padding-left: 15px;
	display: flex;
    justify-content: space-between;
}

.contet_sub{
	text-align: center;
	width: 92px;
}
.contet_sub_sub {
   text-align: center;
	width: 239px;
}

.box {
	padding: 50px;
	border-top: solid  #9EE6CF;
	border-bottom: solid #9EE6CF;   
	width: 1130px;
    margin: auto;
    
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
	 background:#3D87C1;
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

.delete_button_css{

    margin: auto;
    display: flex;
    padding: 5px;
    justify-content: center;

}
.comment_delete_button{
font-size: 16px;
 outline: none;
 background: white;
 color: tomato;
 border: solid 1px tomato;
 width: 50xp;
 width: 50px;
 height: 30px;
 cursor: pointer;

}

.comment_delete_button:hover {
 color: white;
 background: tomato;

}

.update_regdate {

font-size: 12px;
padding: 6;
}

.clearfix {
    margin: 0;
    padding: 0;
    list-style: none;
    display: flex;
    
}

.mailbox-attachment-info {
    text-align: center;
    background: #1F8AD8;
    color: white;
    margin-top: 5px;
    height: 22px;
    font-size: 14px;
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
			<div class="title_sub size_01">
				${one.title}
				<div class="update_regdate">
					<c:if test="${one.regdate != one.updatedate}">
				   	 		 수정일 <fmt:formatDate value= "${one.updatedate }" pattern="yyyy-MM-dd HH:mm:ss"/>
				   	 </c:if>
				 </div>
			</div>						  			
		</div>
		<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
		<div class="content_ist">
			<div class="title size right font_we">
			   날짜
			</div>
			<div class="contet_sub_sub size_02 right">
				<c:choose>
			   	 	<c:when test="${today == regdate}" >
			   	 		<fmt:formatDate value="${one.regdate} " pattern="HH:mm:ss"/>
			   	 	</c:when>	
			   	 		<c:otherwise>
			   	 		
			   	 		 	작성일 <fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd "/> 
			   	 		</c:otherwise>
			   	 	   	 	
				</c:choose>
			</div>
			<div class="title size right font_we">
			   writer
			</div>
			<div class="contet_sub size right">
				${one.writer}
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
			<div class="contet_sub size right">
				${one.viewcnt}
			</div>
			<div class="title size right font_we">
			   File
			</div>
			<div class="contet_sub size">
				${one.filecnt}
			</div>		
			</div>
										  			
		</div>
		<div class="box">
			${one.view_content}
		 <ul class="mailbox-attachments clearfix uploadedList"></ul>
		</div>
		<div class="flex_class" >
			<div class="button_list">
			<!-- header는  http 의 header 을 사용 -->
				<a href="${header.referer}" class="box_deco test_list" >목록</a>
				<a href="${path}/board/answer?bno=${one.bno}" class="box_deco">답변</a>
			<c:if test="${name ==one.writer }">	<!-- 로그인 유저랑 작성자랑 같을때만 수정 삭제 -->
				<a href="${path}/board/update?bno=${one.bno}" class="box_deco">수정</a>
				<a href="#" class="box_deco delete">삭제</a>
			</c:if>	
			</div>
			
		</div>
	
	
	<!-- 댓글창 -->
	<div id="listReply"></div>

</body>
<script id="fileTemplate" type="text/x-handlebars-template" >
	<li style="margin-top: 10px; margin-right: 10px;">
		<div class="mailbox-attachment-icon has-img">
			<center><img src="{{imgSrc}}" alt="Attachment" class="s_img"></center>
		</div>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileurl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
			<span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
				
			</span>
		</div>
	</li>
</script>	
<script src="${path}/resources/js/fileAttach.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
var fileTemplate = Handlebars.compile($("#fileTemplate").html());
//삭제할 첨부파일 목록
var deleteFileList = new Array();

$(function() {
	//첨부파일 목록 불러오기
	var listCnt = listAttach('${path}', '${one.bno}');

	// 첨부파일 0건일때 '첨부파일 없음'출력
	console.log('FILE COUNT: ' + listCnt);
	
	if(listCnt == 0 ) {
		var text = '<span class= "no_attach"> 첨부파일이 없습니다.</sapn> ';
		$('.uploadedList').html(text);
	} else {
		
	}
	
	
	
	
});

/*  삭제 버튼 클릭시 모달창 open */
 $(function(){ //화면단이 다만들어지면 시작해라 
	
	 setInterval(refreshReply, 1800000); // 5분에 한번씩 refreshReply를 실행해라 setInterval는 spring 내장함수
	 
	 listReply(); //페이지 시작하자마자  호출해라 listReply(); 메서드를  
	 			  // listReply(); 아래 정의 되어있음
	 
	 $('.delete').click( function(){
		$('.modal_wrap').css('display','flex');	 
	 });
	 
	 			  // 삭제 알림 모달창에서 확인버튼  Click -> 게시글 삭제
	 $('#modal_msg_yes').click( function(){
		 // 1. Ajax로 해당 게시글의 첨부파일을 Local에서 삭제!
		 //uploadedList  내부의 .file 태그 각가 반복 
		 $(".uploadedList .file").each(function(i){ // input태그에 file 클래스로 해서 첨부파일 담기게 했었다
			 console.log(i+"," + $(this).val())
			 deleteFileList[i] = $(this).val();
		 });
		 //console.log(deleteFileList);
		 if(deleteFileList.length > 0) {
			 $.post('${path}/upload/deleteFileList',
					 {files: deleteFileList},
					 function(){
						 
					 });
		 }
		 // 2. 서버단으로 가서 첨부파일 DB에서 삭제!
		 // 3. 서버단으로 가서 게시글 삭제
		 
		 
		 location.href='${path}/board/delete?bno=${one.bno}';
	 });
	 
	
 
 });
 
 
 $(document).on('click','.box_deco', function(){
			
		 var referer = '${header.referer}';
		
		console.log('이전 URL:' + referer);
		
		
		var index = referer.indexOf('/board/list');
		console.log('index :' + index);
		
		
		if(index == '-1') {
			// href 속성을 "${path}/board/list" 로 경로 변경 
			$('.test_list').attr("href","${path}/board/list");
			
		} 
	  
	}); 

 
 $(document).on('click','.reply_btn',function(){
		$('.modal_login_wrap').css('display','flex');
		
	});
 

 
 $(document).on('click','.reply_btn_plus',function(){ 
	 // 문서에서 reply_btn_plus 클릭이 되면
	 // commentlist.jsp는 정확히 말하면 include.jsp가 include 된 상태는 아니다
	 
	 	var reply_txt = $('.coment_input').val();
	 // 2. reply_txt라고 변수에 사용자가 입력한 댓글의 내용(coment_input)을 담음
	 		console.log(reply_txt);
	 
	 //3. 조거문 사용자가 입력한 값이 ''이거나 깅이가 00이면
	 // 널값이기 때문에 댓글 입력부분으로 포커스를 이동하라
	 // 경고 메세지를 출력하고 여기서 이벤트를 종료
	 // 사용자가 입력한 값이 있으면 실행하지 않고 종료 
	 	if(reply_txt == '' || reply_txt.length == 0) {
	 		$('.reply_txt').focus();
	 		$('.err_msg').css('visibility', 'visible');
	 		return false;
	 	}	
	 	
	 	$('.reply_bno').val('${one.bno}'); 
	 	  // 게시글 번호를 reply_bno에 담아라 
	 	$('.reply_type').val('${one.type}'); 
	 	$('.reply_writer').val('${name}');
	 	// commentlist에 form태그로 싸고 input으로 선언했기 때문에 불러올수 있다
	 	// textarea도 마찬가지 
	 	
	 	
	 	
	 	$.ajax({
	 		// 댓글 등록
	 		// type, content, writer, bno
	 		
	 		url: '${path}/reply/insert',
	 		type: 'POST',
	 		data: $('.frm_reply').serialize(), //frm_reply 4개의 정보가 담겨 있음 .serialize()는 직렬화 해주는 함수
	 		//원래는 data{"bno": bno , "type" : type, "writer":name , "content":content}
	 		// {"key":value} 이렇게 담아줘야한다
	 		//DTO 선언한 변수명과 동일 해야 한다 
	 		//url: '${path}/reply/insert?bno='+bno+'&type='+type+'&writer='+nmae+'&content'+content,도 마찬가지 
	 		// 쿼리스트링으로 써줘야 한다
	 		// 위 작업들을 serialize가 쿼리스트링을 자동으로 만들어서 보내기때문
	 		
	 		success: function() {
	 			
	 			listReply();
	 		}
	 		
	 	});
		
	});
 
//새로운 댓글 확인하기 버튼 클릭시
 	$(document).on('click','new_button_comment_button', function(){
 		
 		listReply();
 	});
 
 // 댓글 삭제
 $(document).on('click', '.comment_delete_button', function(){
	 var rno = $(this).attr('data_num');
	 var bno = '${one.bno}';
	 
	 //comment_delete_button 는 for문으로 댓글 목록을 다 생성후 삭제를 진행 하여서
	 // 바로 rno(댓글 번호)를 가지고 올수 없다 (같은번호만 불러온다 )
	 // data_num="${list.rno} 으로 rno를 부른다음 
	 // $(this) = comment_delete_button 로 자신의 번호를 가지고 오라고 인식해줘야 한다 
	 
	 $.ajax({
		 type: "POST",
		 url: "${path}/reply/delete", // replyController에 list를 찾음
		 data: {'rno' : rno, 'bno' : bno},
		 success: function(){ 
			  
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

 
function refreshReply() {
	
	listReply();
	
}
 

 	
 

</script>
</html>
