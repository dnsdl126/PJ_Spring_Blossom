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
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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
    margin-top: 35px;

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
    margin-top: 35px;

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


.board_div {
	width: 849px;
    margin-left: 127px;
    border: dashed 1px;
    height: 76%;
    line-height: 76px;
    font-size:20px;
    text-align: center;
}

.clearfix  {
	margin: 0;
    padding: 0;
    list-style: none;
    display: flex;
    width: 849px;
    margin-left: 127px;
}
.mailbox-attachment-info {
 	text-align: center;
    background: #1F8AD8;
    color: white;
    margin-top: 5px;
    height: 22px;
    font-size: 14px;
}
	
.delBtn {
cursor: pointer;
}
#search_content {

visibility: hidden;
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
				<textarea class="text_box_03 board_content_wrap_list_box_03"  id="board_textbox_area" name="view_content"  style="min-width:850px;">${one.view_content}</textarea>
			</div>	
		</div>
		<div class="board_content_wrap02">
		<!-- 첨부파일 -->
			<div class="input_wrap form_group">
				<div class = "board_div fileDrop">
					<p ><i class="fas fa-paperclip"></i>첨부파일을 드래그 해주세요</p>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
			</div>
			<div class="text_box_02_button">
				<button type="button" class="file_cancle_button">취소</button>
				<button type="button" class="file_agree_button">완료</button>                                          
			</div>	
	
		</div>	
		</div>
	</form:form>	
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
				<i class="fas fa-times"></i>
			</span>
		</div>
	</li>
</script>	
<script src="${path}/resources/js/fileAttach.js"></script>
<script type="text/javascript">
var flag = '${flag}';
console.log('flag :' + flag);

//Handlebars  파일 템플릿 컴파일 
var fileTemplate = Handlebars.compile($("#fileTemplate").html());
$(function(){
		
	// resgister ==> 게시글 등록과 게시글 수정
	// ${one}에 값이 있으면 수정 페이지 로딩 
		if(flag == 'update') {
			
			$('.Newcontetn_titl').text('게시글 수정');
			 
			// selectbox값으로 selected
			$('.select_box').val('${one.type}').attr('selected','selected');
			
		} else if (flag == 'answer') {
			
			$('.Newcontetn_titl').text('게시글 답글');
			
			// selectbox값으로 selected
			$('.select_box').val('${one.type}')
			                .attr('selected','selected')
			                .attr('onFocus', 'this.initialSelect = this.selectedIndex')
			                .attr('onChange', 'this.selectedIndex = this.initialSelect');
			
		    $('#boadr_title').val('RE: ' + '${one.title}')
		                     .attr('readonly', 'readonly');
		}
	
		// 첨부파일 올리기
	    	//1.웹브라우저에 drag&drop시 파일이 열리는 문제 (기본 효과)
			//: 기본 효과 막음!
			$('.fileDrop').on('dragenter dragover', function(e){
				e.preventDefault();
			});
	    	
	    	// 2. 사용자가 파일을 drop했을때
	    	$('.fileDrop').on('drop',function(e){
	    		e.preventDefault();
	    		
	    		var files=e.originalEvent.dataTransfer.files; 
	    		// 드래그에 전달된 첨부파일
	    		// drag & drop할때 어려거 파일을 넣으면 배열로 담긴다 
	    		var file=files[0];
	    		// 그중 하나만 꺼내옴
	    		// 파일은 한번에 여러개를 Drag&Drop해도 그중 맨앞에 한개파일만 업로드 된다
	    		// Drag&Drop한 파일중 첫번째 파일이 담김
	    		
	    		var formData = new FormData(); 
	    		// 폼 객체 생성
	    		// 파일하나를 드래그 드롭하면 그순간 바로 Ajax를 바로 저장해야해서
	    		// 한번에 form태그로 쌀필요가 없기때문에
	    		// 깡통 formData를 만들어서이용
	    		
	    		formData.append('file',file); 
	    		// 폼에 파일 1개 추가
	    		// file 이란이름으로 formData에 담는다 
	    		
	    		// 서버에 파일 업로드
	    		
	    		$.ajax({
	    			url: '${path}/upload/uploadAjax',
	    			data: formData,
	    			datatype: "text",  
	    			processData: false,	    			
	    			contentType: false, 	    			
	    			type: 'POST',	    			
	    			success: function(data){
	    				
	    				console.log(data);
	    				
	    				printFiles(data, '${path}'); 
	    			}
	    			
	    		});
	    	});
	    	
	    	$('.uploadedList').on('click','.delBtn',function(event){
	    		var bno ='${one.bno}';
	    		
	    		var that = $(this);
	    		
	    		
	    		if(bno == '') { // 게시글 등록 

 					$.ajax({
 						url: '${path}/upload/deleteFile',
 						type: 'POST',
 						data: {fileName: $(this).attr('data-src')},
 						success: function(data) { //success: function(data) = deleted가 담긴다 
 							if(data == 'deleted') {
 								that.parents('li').remove();
 								// 내 부모(상위태그들 중에 li  태그를 찾아라 )
 								//.remove(); 태그 없애라 
 							}
 							
 						}, error: function(){
 							alert('System Error!!!');
 						}
 						
 					});
	    		} else {       // 게시글 수정 
	    			
	    		}
	    	});
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
			// 스마트 에디터의 값을 #board_textbox_area에 담아라 
			 oEditors.getById["board_textbox_area"].exec("UPDATE_CONTENTS_FIELD", []);
				
			 var view_content = $('#board_textbox_area').val();
			 // 순수 텍스트
			 //view_content 에서 정규식을 통해 HTML태그를 제거 후 순수 Text만 추출 
			 var search_content = view_content.replace(/(<([^>]+)>)/ig,"").replace("&nbsp;", "");
						 
			  // 게시글 등록버튼을 눌렀을때 frm_board태그에 맨 마지막에
			  // 평소에는 없다가 
			  //'<textarea id= "search_content" name="search_content"></textarea> '를 추가 
			  
			 $('#frm_baord').append('<textarea id= "search_content" name="search_content"></textarea> ');
			 $('#search_content').val(search_content);
			 
			 // 첨부파일 목록[배열]도 추가
			 var str='';
			 // uploadedList  내부의 .file 태그 각각 반복
			 $(".uploadedList .file").each(function(i){ 
				 //uploadedList 안에 있는 file
				 //.each 앞에 uploadedList만큼 반복해라 
				 // i 는 인덱스값 
				 console.log(i);
				 //hidden 태그 구성
				 str +="<input type='hidden' name='files["+i+"]' value='" + $(this).val()+"'>";
			 });
			 //로컬 드라이브에 저장되어있는 해당 게시글
			 //첨부파일 삭제
			/*  if(deleteFileList.length > 0) {
				 $.post('${path}/upload/deleteAllFile', {files:deleteFileList}, function(){});
			 } */
			 
			 // 폼에 hidden태그들을 붙임
			 $("#frm_baord").append(str);
			 // 예를 들어 str + 가 3번 반복된 경우 
			 //  str +="<input type='hidden' name='files[0]' value='" + $(this).val()+"'>"
			 //  str +="<input type='hidden' name='files[1]' value='" + $(this).val()+"'>"
			 //  str +="<input type='hidden' name='files[2]' value='" + $(this).val()+"'>"
			 // 이것을 form태그 끝나는 곳에 붙여준다 
			 
			 //서버로 전송
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