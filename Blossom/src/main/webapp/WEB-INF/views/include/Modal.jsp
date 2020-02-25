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
    modal_wrap {
	    position: fixed;
	    z-index: 1000;
	    background-color: rgba(0,0,0,0.4);
	    overflow: auto;
	    width: 100%;
	    height: 100%;
	    justify-content: center;
	    align-items: center;
	    display: flex;
    }
    .modal_logo {
    	width: 50%;
       	height: 120px;
       	background-image: url('${path}/resources/img/mainbaner_01.png');
       	background-repeat: no-repeat;
       	background-size: 150px 110px;
       	background-position: center;
 		margin: 10px auto 0;

    }
    .modal_content {
    	position: relative;
    	width: 372px;
    	height: 254px;
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

    }

    .modal_check {
		
		overflow: hidden;
		margin-left: 29px;
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
	    min-width: 118px;
	    padding: 11px;
	    margin-right: 10px;
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
				<div class="modal_logo"></div>
				<div class = "modal_text">
					이메일 인증후 가입 완료됩니다.
				</div>			
				<div class="modal_check">
		   			 <span><a href="#" class="btn_type modal_cancle">취소</a></span>
		   			<span><a href="#" class="btn_type moadl_agree">확인</a></span>	   			  	  	
		   		</div>						
			</div>
		</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).on('click', '.modal_close', function() {
       $('.modal_wrap').css('display','none'); 
     
       
    });

</script>
</body>
</html>