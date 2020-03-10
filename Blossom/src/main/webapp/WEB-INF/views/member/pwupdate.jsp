<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
  
<%@ include file = "../include/include.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<link rel="icon" type="image/x-icon" href="../img/naver/naversm.png">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
   <script src="https://kit.fontawesome.com/66fbac40f5.js" crossorigin="anonymous"></script>
   <style type="text/css">
     .container {
	margin-top: 150px;
	margin-right: auto;
    margin-left: auto;
    width: 464px;
    box-sizing: border-box;
    min-height: 1px;
}
.password_box {
	width: 524px;
    margin: 0 auto;
    border: 1px solid #e5e5e5;
    padding: 58px 69px 58px;

}
#logo {
	display: block;
    width: 183px;
    height: 96px;
    margin-left: auto;
    margin-right: auto;


}
.password_css {
	margin-top: 8px;
    padding-left: 5px;
    color: #666;
}
.present_password {
	position: relative;
    height: 43px;   
    
}
.presen_password_input {
	transition: .2s border-color, .2s box-shadow, .2s background-color;
    display: block;
    box-sizing: border-box;
    height: 40px;
    width: 100%;
    padding: 0 15px;
    line-height: 40px;
    border: solid 1px #dbdbdb;
    background-color: #ffffff;
    color: #424242;
    font-size: 12px;
}
.present_password_change {
	position: relative;
    height: 40px;
}
.change_agree {
	color: white;
    background-color: #40BF75;
    border-radius: 10px;
    border: none;
    display: block;
    width: 40%;
    padding: 21px 0 17px;
    font-size: 20px;
    font-weight: 300;
    text-align: center;
     margin-top: 30px;
}
.change_agree:hover {
	background-color: #1F8AD8;

}
.err_msg {
	font-size: 13px;
	color: red;	
    margin-bottom: 20px;
}
.change_ok{
	display: flex;
	justify-content: space-around;
}   

.btn_type {
   	color: white;
    background-color: #40BF75;
    border-radius: 10px;
    border: none;
    display: block;
   	width: 100%;
   	padding: 21px 0 17px;
   	font-size: 20px;
   	font-weight: 700;
   	text-align: center;
   	cursor: no-drop;
   	margin: auto;
   	}
   </style>
</head>
<body>
<div class="container">
 	<div class="password_box">
 		<div class="logo">
 			<img src="${path}/resources/img/linkedin_banner_image_1.png" id="logo">
 		</div>
 		<div class="password_chang_header password_css">
 			<h1 style="color: black">비밀번호 변경</h1>
 			<p style="margin-bottom: -11px"> 안전한 비밀번호로 변경 하세요 </p>
 			<p> 이전에 사용하지 않은 비밀번호가 안전합니다. </p>				
 		</div>
 	 <form:form id= "frm_member" modelAttribute="memberDTO" autocomplete="">
 		<div class="password_change_box">
 			<div class="present_password change" style="margin-bottom: 8px">
 				<input type="text" name="pasword_pr" placeholder="현재 비밀번호"  id="nowpw" class="presen_password_input">
 			</div>
			<div class="err_msg">
				비밀번호를 확인해주세요
			</div>
			<div class="present_password_change_box" style="margin-bottom: 8px">
	 			<div class="present_password_change change"  style="margin-bottom: 2px;">
	 				<input type="text" name="pw" placeholder="변경할 비밀번호" class="presen_password_input" id=upw >
	 			</div>
	 			<div class="present_password_change change">
	 				<input type="text" name="rpw" placeholder="비밀번호 재확인" class="presen_password_input" id=urpw>
	 			</div>
	 		</div>	
 			<div class="err_msg">
				비밀번호를 확인해주세요
			</div>
 		</div>
 		
 		<div class="change_ok" >
 			<button type="button" id='btn_join' class="btn_type btn_agree">수정하기</button> 			
 		</div>
 		</form:form>
 		</div>
		

 	</div>

 


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
   

    $(function(){ // = $(document).ready(function()
    	//var name = "뇽똥구리" // $('#upw').keyup(function() -> 전역변수 공유
    	
    	var pwFlag = false;
    	
    	var checkArr = new Array(2).fill(false);
    	
    	 $('#nowpw').keyup(function(){ 
	    	//document 안에 keyup : 나혼자만 동작
	    	// 전역변수 쓰면 그것을 공유할것인지 안할것인지  
	    	   	
	    	var nowpw = $(this).val();
	    	console.log('입력' + nowpw)
	    	
	    	var result = joinvalidate.checkNowpw(nowpw);
	    	console.log("code: " + result.code + result.desc);
	    	ckDesign(result.code, result.desc, 0, 0);
    	
	    	if(result.code == 100) {
	    		checkArr[0] = true;
	    	} else {
	    		checkArr[0] = false;
	    	}
    	  
  		});			
    			
    	$('#upw').keyup(function() {
    		
    		//1. 사용자가 입력한 값 받기
    		//.trim()의 또다른 사용 방법
    		var nowpw = $.trim($('#nowpw').val());   		
    		var pw = $.trim($('#upw').val());
    	    var rpw =  $.trim($('#urpw').val());
    	    
    	    //2. 유효성 체크하기
    	    var result = joinvalidate.checkpw(nowpw, pw, rpw);

    	    if (result.code == 0 || result.code == 10 || result.code == 6) {
    	    	pwFlag = true;
    	    } else {
    	    	pwFlag = false;
    	    } 
    	    
    	      ckDesign(result.code, result.desc, 1, 1);
    	    
    	    
    	    if(result.code == 10){
    	    	checkArr[1] = true;		
    		    
    	    } else if(result.code == 6) {
    	    	checkArr[1] = false;
    	    } else {
    	    	checkArr[1] = false;
    	    }
    	});
    	
    	$('.change').keyup(function(){
   		 printCheckArr(checkArr);
   		});
	
    	// 비밀번호 재확인 유효성 체크 
    	$('#urpw').keyup(function(){
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());
		
			var result = joinvalidate.checkRpw(pw, rpw, pwFlag);
				//console.log(result.code+","+result.desc);
			ckDesign(result.code, result.desc, 1, 1);
    	    	
	
			if(result.code == 10){
				checkArr[1] = true;
				
			} else if(result.code == 6){
				checkArr[1] = false;
				
			} else {
				checkArr[1] = false;
			}
			
		});


    	//버튼 활성화!
    	$('.change').keyup(function(){
    		
    		printCheckArr(checkArr);
    		ckColorBtn();
    		
    	});
    	
    function ckColorBtn() {
    		var checkAll = true;
    		for(var i = 0; i < checkArr.length; i++){
    			if(!checkArr[i]){
    				checkAll = false;
    			}
    		}
    		printCheckArr(checkArr);
    		if(checkAll){
    			$('.btn_type').addClass('btn_agree');
    			$('.btn_type').css('cursor','pointer');
    		} else{
    			$('.btn_type').removeClass('btn_agree');
    			$('.btn_type').css('cursor','no-drop');
    		}

    	}
    	$('#btn_join').click(function(){
    		var invalidAll = true;
    		for(var i = 0; i < checkArr.length; i++){
    			if(!checkArr[i]){
    				invalidAll = false;
    				$('.err_msg:eq('+i+')').css('visibility','visible')
					   .text(desc)
					   .css('color','#f24443');
    			}
    		}
    		if(invalidAll) {
    			$('#frm_member').submit();
    		} else {
    			alert('유효성체크를 진행해주세요!');
    		}
    		
    	});
    	
    	
   });     	
  
function ckDesign(code, desc, line, msg){
  	  if(code == 0 || code == 10 || code == 100 ){ //통과o
  			$('.change:eq('+line+')').css('border','1px solid #3885ca');
  			$('.err_msg:eq('+msg+')').css('visibility','visible')
  								   .text(desc)
  								   .css('color','#3885ca');
  			return true;
  			
  		} else { // 통과x
  			$('.change:eq('+line+')').css('border','1px solid #f24443');
  			// 테두리 색생변경
  			$('.err_msg:eq('+msg+')').css('visibility','visible')
  								   .text(desc)
  								   .css('color','#f24443');
  			// 에러메세지 출력
  			return false;
  		}
  	}
  	
function printCheckArr(checkArr) {
 	for(var i=0; i < checkArr.length; i++) {
	 	console.log(i+'번지: ' + checkArr[i]); 
	 }
 }


  	 		    	
</script>
</html>
