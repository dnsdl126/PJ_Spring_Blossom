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
   </style>
</head>
<body>
<div class="container">
 	<div class="password_box">
 		<div class="logo">
 			<img src="../../../blossom/img/clean_logo.png" id="logo">
 		</div>
 		<div class="password_chang_header password_css">
 			<h1 style="color: black">비밀번호 변경</h1>
 			<p style="margin-bottom: -11px"> 안전한 비밀번호로 변경 하세요 </p>
 			<p> 이전에 사용하지 않은 비밀번호가 안전합니다. </p>				
 		</div>
 		<div class="password_chang_box">
 			<div class="present_password" style="margin-bottom: 8px">
 				<input type="text" name="pasword_pr" placeholder="현재 비밀번호"  id="nowpw" class="presen_password_input">
 			</div>
			<div class="err_msg">
				비밀번호를 확인해주세요
			</div>
			<div class="present_password_change_box" style="margin-bottom: 8px">
	 			<div class="present_password_change"  style="margin-bottom: 2px;">
	 				<input type="text" name="pasword_pr" placeholder="변경할 비밀번호" class="presen_password_input" >
	 			</div>
	 			<div class="present_password_change">
	 				<input type="text" name="pasword_pr" placeholder="비밀번호 재확인" class="presen_password_input">
	 			</div>
	 		</div>	
 			<div class="err_msg">
				비밀번호를 확인해주세요
			</div>
 		</div>
 		<div class="change_ok" >
 			<button type="button" id='btn_join' class="btn_type change_agree"> 취소 </button>
 			<button type="button" id='btn_join' class="btn_type change_agree"> 완료  </button> 			
 		</div>
 		</div>


 	</div>

 


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
    $(document).on('keyup', '#nowpw', function(){
    	   	
    	var nowpw = $(this).val();
    	console.log('입력' + nowpw)
    	
    	var result = joinvalidate.checkNowpw(nowpw);
    	console.log("code: " + result.code + result.desc);
    	ckDesign(result.code, result.desc, 0, 0);
    	
    	
    });	

    function ckDesign(code, desc, line, msg){
  	  if(code == 0 || code == 10 || code == 100 ){ //통과o
  			$('.present_password_change:eq('+line+')').css('border','1px solid #3885ca');
  			$('.err_msg:eq('+msg+')').css('visibility','visible')
  								   .text(desc)
  								   .css('color','#3885ca');
  			return true;
  			
  		} else { // 통과x
  			$('.present_password_change:eq('+line+')').css('border','1px solid #f24443');
  			// 테두리 색생변경
  			$('.err_msg:eq('+msg+')').css('visibility','visible')
  								   .text(desc)
  								   .css('color','#f24443');
  			// 에러메세지 출력
  			return false;
  		}
  	}
  	 		    	
</script>
</html>
