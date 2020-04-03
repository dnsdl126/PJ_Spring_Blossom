<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/66fbac40f5.js" crossorigin="anonymous"></script>
<style type="text/css">

.board_content_wrap{

	width: 1200px;
	margin: auto;
	
	border-bottom: none;
	height: 600px;
	padding: 20px;

}

.board_content_wrap_list {
	width: 100%;
	height: 40px;	
	margin-bottom: 10px;
	display: flex;
}
.board_content_wrap_list_box1{
	font-weight: bold;
	width: 120px;
	font-size: 15px;
	text-align: right;
	height: 40px;
	padding: 10px;
}
.board_content_wrap_list_box{
	width: 850px;
	font-size: 15px;
	margin-left: 5px;
	border: solid 1px #a4b0be;
	padding: 10px;
}

.text_box{
   
   font-size: 15px;
   border: solid 1px;
   padding: 10px;
  margin: 0px 0px 0px 5px;
    height: 431px;
    width: 840px;
    border: solid 1px #a4b0be;
    
}

.board_content_wrap_list_box_select{
	width: 100%;
	font-size: 15px;
	margin-left: 5px;
	border: solid 1px;
	
}

.select_box{
 outline: none;
 border: none;
 width: 100%

}

.board_content_wrap02{
	width: 1200px;
	margin: auto;
	
	height: 190px;
	padding: 20px;
	border-top: none;

}




.text_box_02{
	 border: dashed 2px #a4b0be;
	text-align: center;
    line-height: 6;
    outline: none;
}

.text_box_02_button{
	width: 24%;
    margin: auto;
    text-align: left;
 
    justify-content: space-around;
    display: flex;

}

.file_cancle_button{
	
    width: 100px;
    font-size: 17px;
    height: 36px;
    border-radius: 4px;
    outline: none;
    border: solid 1px tomato; 
    color: tomato;
    background: white;
    margin-top: 70px;

}

.file_agree_button{
	
    width: 100px;
    font-size: 17px;
    height: 36px;
    border-radius: 4px;
    outline: none;
    border: solid 1px #1F8AD8; 
    color:#1F8AD8;
    background: white;
    margin-top: 70px;

}

.file_cancle_button:hover {

	color: white;
	background: tomato;
	cursor: pointer;
	outline: none;
}

.file_agree_button:hover {

	color: white;
	background: #1F8AD8;
	cursor: pointer;
	outline: none;
}

.icon_css{
	font-size: 52px;
    padding-top: 13px;
    margin-right: 5px;
    color:#a4b0be;
}

.file_uplod{
	text-align: center;
    padding-top: 26px;
    font-size: 18px;
    margin-right: 5px;
}

.board_content_clear{

	border: solid 1px;
	font-size: 20px;
	text-align: center;
	
	width: 50px;
	height: 50px;
	
	margin: auto;
}

.Newcontetn_titl {

	text-align: center;
	color: #1F8AD8;
	margin-top: 150px;
	font-size: 30px;
	font-weight: bold;

}

.board_content_wrap_list_S {
  display: flex;
    width: 980px;
    height: 350px;

}

.box1_css{
margin-right: 8px;
   margin-left: 12px

}
.err_msg{
	font-size: 15px;
    margin-left: 131px;
    margin-bottom: 10px;
    color: tomato;
    font-weight: bold;
    display: none;
   

}

	
</style>
</head>
<body>
	<div class="Newcontetn_titl" > 게시글 등록 </div>
	<form:form id="frm_baord" >
		<div class="content_box_wrap">
		<div class="board_content_wrap">
			<div class="board_content_wrap_list">
		
				<div class="board_content_wrap_list_box1">
					작성자 :
				</div>
				<div class="board_content_wrap_list_box">
					${name}
					<input type="hidden" value="${name}" name="writer">
				</div>
			</div>
			<div class="board_content_wrap_list">
				<div class="board_content_wrap_list_box1">
					종류 :
				</div>
				<div class="board_content_wrap_list_box" >
					<select class="select_box" style="font-size: 15px;" name="type">
						<option value="free">자유게시판</option>
						<option value="qna" >QnA게시판</option>
						<option value="review">리뷰</option>					
					</select> 
				</div>			
				
			</div>
			<div class="board_content_wrap_list">
				<div class="board_content_wrap_list_box1">
					제목 :
				</div>
				<!-- 등록이랑 수정이랑 페이지를 공유하지만 value값은 수정시에만 one.write를 가지고 오기때문에   -->
				<input class="board_content_wrap_list_box" placeholder="제목을 입력하세요" type="text" name="title" id="boadr_title" value="${one.title}"/>
			</div>
			<div class="err_msg"> 제목을 입력하세요</div>
			<div class="board_content_wrap_list_S">
				<div class="board_content_wrap_list_box1 box1_css" >
					내용 :
				</div>
				<script type="text/javascript" src="${path}/resources/smarteaditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
				<textarea class="text_box_03 board_content_wrap_list_box_03"  id="board_textbox_area" name="content"  style="min-width:850px;"> 
					${one.content}
				</textarea>		
			</div>	
		</div>
		<div class="board_content_wrap02">
			<div class="board_content_wrap_list">
				<div class="board_content_wrap_list_box1" >
					첨부파일 :
				</div>
				<div class="board_content_wrap_list_box " style="height: 100px; display: flex; justify-content: center; border: dashed 2px  #9EE6CF;">
					
					<i class="fas fa-file-import icon_css"></i>
					<div class="file_uplod">파일을 올려주세요</div>
				</div>
						
			</div>
			<div class="text_box_02_button">
				<button type="button" class="file_cancle_button">취소</button>
				<button type="button" class="file_agree_button">완료</button>
			</div>	
	
		</div>	
		</div>
	</form:form>	
<script type="text/javascript">

	$(function(){
		
		
		
		if('${one.bno}' != '') {
			
			
			$('.Newcontetn_titl').text('게시글 수정');
			
			$('.select_box').val('${one.type}').attr('selected','selected');
			
		}
	});
	
	/*  취소 버튼 클릭시 정상 비정상 경로 설정 */
	$(document).on('click','.file_cancle_button', function(){
		var referer = '${header.referer}';
		console.log('이전 URL:' + referer);
		
		var index = referer.indexOf('/board/list');
		console.log('index :' + referer.indexOf('/board/list'))
			
		if(index == '-1') {
		 	location.href='${path}/board/list';
		} else {
			location.href='${header.referer}'; 	
		}
	
	}); 
	
	$(document).on('click','.file_agree_button', function (){
		
		// 유효성 체크 (제목)
		var title = $('#boadr_title').val();
		
		if(title == '' || title.legnth == 0) {
			//에러메세지 제목을 입력해주세요
			alert('값 입력하시요 ');
			$('.err_msg').css('display','block');
			return false;
		} else {
			 oEditors.getById["board_textbox_area"].exec("UPDATE_CONTENTS_FIELD", []);
			$('#frm_baord').submit();
		}
	});

</script>	
	
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "board_textbox_area",
		 sSkinURI: "${path}/resources/smarteaditor/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
		});
	</script>


</body>
</html>