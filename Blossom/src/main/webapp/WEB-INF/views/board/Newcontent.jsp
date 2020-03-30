<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp"%> 
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
	width: 15%;
	font-size: 15px;
	text-align: right;
	padding: 10px;
}
.board_content_wrap_list_box{
	width: 73%;
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

}

body {
top : 0;
}

	


</style>
</head>
<body>
	<div class="Newcontetn_titl" > 게시글 작성 </div>>
	<div class="content_box_wrap">
	<div class="board_content_wrap">
		<div class="board_content_wrap_list">
			<div class="board_content_wrap_list_box1">
				작성자 :
			</div>
			<div class="board_content_wrap_list_box">
				뇽덕이LI
			</div>
		</div>
		<div class="board_content_wrap_list">
			<div class="board_content_wrap_list_box1">
				종류 :
			</div>
			<div class="board_content_wrap_list_box">
				<select class="select_box" style="font-size: 15px;">
					<option value="">자유게시판</option>
					<option value="">QnA게시판</option>
					<option value="">리뷰</option>					
				</select> 
			</div>			
			
		</div>
		<div class="board_content_wrap_list">
			<div class="board_content_wrap_list_box1">
				제목 :
			</div>
			<input class="board_content_wrap_list_box" placeholder="제목을 입력하세요" type="text" />
				
			
		</div>
		<div class="board_content_wrap_list">
			<div class="board_content_wrap_list_box1">
				내용 :
			</div>
			<textarea class="text_box board_content_wrap_list_box" > 
				
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
				<span><div class="file_uplod">파일을 올려주세요 </div></span>
			</div>
					
		</div>
		<div class="text_box_02_button">
			<button type="button" class="file_cancle_button">취소</button>
			<button type="button" class="file_agree_button">완료</button>
		</div>	

	</div>	
	</div>
</body>
</html>