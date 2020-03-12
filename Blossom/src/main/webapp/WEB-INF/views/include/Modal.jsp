<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ include file = "../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modal</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/66fbac40f5.js" crossorigin="anonymous"></script>
<style type="text/css">
	     /*모달창*/
    .modal_wrap {
	    position: fixed;
	    z-index: 1000;
	    background-color: rgba(0,0,0,0.4);
	    overflow: auto;
	    width: 100%;
	    height: 100%;
	    justify-content: center;
	    align-items: center;
	    display: none;
    }
    .modal_logo {
    	width: 50%;
       	height: 120px;       	
       	
       	background-repeat: no-repeat;
       	background-size: 150px 110px;
       	background-position: center;
 		margin: 3px auto 0;

    }
    .modal_content {
    	position: relative;
    	width: 413px;
    	height: 291px;
    	background-color: white;
  		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
    	border-radius: 2px;
    	overflow: hidden;
    	padding: 10px;
    }
    .modal_content button{
    	position: absolute;
    	top: 5px;
    	right: 5px;
    	border: none;
    	background-color: white;
		outline: none;

    }
    .modal_text {
    	text-align: center;
    	font-size: 18px;
        text-align: center;   		
    	margin-top: 10px;
    	font-weight: 800;

    }
    .modal_text_1 {
		text-align: center;
		margin-top: 5px;  
    }

    .modal_check {
		display: flex;
		overflow: hidden;
		justify-content: space-around;
	    padding-left: 35px;
	    padding-right: 35px;
	    padding-top: 15px;
	}
	.modal_check > span {
		display: block;
		float: left;
		width: 150px;
	   text-align: center;
       margin-top: 10px;
	}
    .moadl_agree {
		color: #fff;
		border: 1px solid #40BF75;
		background-color: #40BF75;
	}		
	.moadl_agree:hover {
		 background-color: #1F8AD8;
		 border: 1px solid #1F8AD8;
          
	}
	.modal_cancle:hover {

		color: black;
		border: 1px solid #1F8AD8;
	}
	.btn_type {
	   	border-radius: 4px;
	    border: 1px solid #d6d6d6;
	    text-align: center;
	    display: inline-block;
	    padding: 11px;
	    width: 140px;
   		
   	}

   	.modal_close{
		background: white;
   	}
   
   	.modal_close > button{
   		color: rgb(142,142,142);
		border:none;		
		font-size: 30px;
		cursor: pointer;
		outline: none;
   	}	
   	.modal_close > button:hover {
 		color: #1F8AD8;

   	}		
		
</style>

</head>
<body>
  <div class="modal_wrap" style="">
			<div class="modal_content">
				<div class="modal_close">
				  <button><i class="fas fa-times" ></i></button>
			    </div>
				<div class = modal_logo style="background-image: url('${path}/resources/img/clean_logo.png');"></div>
				<div class = "modal_msg_main_txt modal_text">
					
				</div>
				<div class = "modal_text_1 modal_msg_sub_txt"></div>
				
				<div></div>			
				<div class="modal_check">
		   			 <a href="#" class="btn_type modal_cancle" id="modal_msg_close">취소</a>
		   			<a href="#" class="btn_type moadl_agree" id="modal_msg_yes">확인</a>   			  	  	
		   		</div>						
			</div>
		</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on('click', '.modal_close', function() {
       $('.modal_wrap').css('display','none'); 
          
    });
	$(function(){
		var id = '${id}';
		var email = '${email}';
		var key = '${key}';
		
		var join_main_txt = id + '님 회원가입을 축하드립니다.';
		var join_sub_txt = email + '으로 인증메일을 보냈습니다. 인증하셔야만 사이트 활동이 가능합니다.';
		var auth_mian_txt = id + '님 이메일 인증되셨습니다.';
		var auth_sub_txt = '지금부터 사이트 활동이 가능합니다. 감사합니다';
		var dropResult_main_txt = id +'님 탈퇴되셨습니다.';
		var dropResult_sub_txt = '그동안 이용해주셔서 감사합니다.';
		
		if(key == 'join') {
			$('.modal_msg_main_txt').text(join_main_txt);  // 메인 텍스트
			$('.modal_msg_sub_txt').text(join_sub_txt);    // 서브 텍스트
			$('#modal_msg_yes').css('display','none')  // 확인버튼 제거
			$('#modal_cancle').text('확인');
			$('.modal_wrap').css('display','flex');   // 모달창 출력
		} else if (key == 'auth') {
			$('.modal_msg_main_txt').text(auth_mian_txt);  
			$('.modal_msg_sub_txt').text(auth_sub_txt);   
			$('#modal_msg_close').css('display','none')
			                   .text('확인');
			$('.modal_wrap').css('display','flex');  
		} else if (key == 'dropResult') {
			$('.modal_msg_main_txt').text(dropResult_main_txt); 
			$('.modal_msg_sub_txt').text(dropResult_sub_txt);
			$('#modal_msg_yes').css('display','none')  // 확인버튼 제거
			$('#modal_msg_close').text('확인');
			$('.modal_wrap').css('display','flex');
		}
		
		$('#modal_msg_yes').on('click',function(){
			$('.modal_wrap').css('display', 'none');			
		});
		$('#modal_msg_close').on('click',function(){
			$('.modal_wrap').css('display','none');			
		});
		
	}); 

</script>
</body>
</html>