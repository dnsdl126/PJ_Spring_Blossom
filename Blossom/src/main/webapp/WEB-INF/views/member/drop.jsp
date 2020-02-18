<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로썸 탈퇴 </title>
<link rel="icon" type="image/x-icon" href="../img/naver/naversm.png">
	<link rel="stylesheet" type="text/css" href="{path}/resources/css/common.css">
   <script src="https://kit.fontawesome.com/66fbac40f5.js" crossorigin="anonymous"></script>
   <style type="text/css">
    * {
   		font-family: Dotum, '돋움' ,Helverica, sans-serif;
   		box-sizing: border-box;
   	}
   	body, h1, h2, h3, h4, h5, h6, ul, p{
   		margin: 0;
   		padding: 0;
   	}
   	body { 
   		background-color: white;
   	       font-size: 12px;}
   	ul { 
   		list-style: none; 
   	  	 }
   	a { text-decoration: none; color: inherit;}

   #container.snbContainer {
   	padding: 48px 0 0;
   	border: 1
   	border: 1px solid blue;
   }
   #container {
   	position: relative;
   	min-height: 500px;
   	border-top: 1px solid black;
   }
   .mypage_top {
   	position: relative;
   	background:#f1f2f6;
   	width: 1243px;
    margin: 0 auto;
    height: 146px;
    box-sizing: border-box;
    display: flex;
   /* justify-content: space-between; 자동분배 */ 
    align-items: center;
   }
   .b_logo {
		width: 158px;
		height: 107px;			
		margin-left: 20px;
		margin-right: auto;	
   	      
   }
   .userInfo {
   	font-size: 29px;
   	font-weight: 15;
   	margin-left: 30px;
   }
   .usermessege {
   	font-size: 17px;
   	font-weight: 15;
   	margin-left: 30px;
   }
   
   .userpoint{
    position: absolute;
    right: 380px;
	text-align: center;

   }
   .userpoint>li{
   }
   
   #contents{
   	position: relative;
    max-width: 1067px;
    min-width: 811px;
    margin: 0 auto;   
   
    background-color : white;
    
   }
   .contents{
   	min-height: 501px;   
    border-bottom: 1px solid #dcdcdc;
   }
   .subtitle {
   	margin: -37px 0 24px;
   	font-size: 35px;
   	
   	color: red;
   	text-align: center;

   }
   .mbOutTop {
    margin: 36px 0 0;
    padding-left: 175px;
    background: url(../../../img/error.png) no-repeat 34px 0;

   }
   .mbOutTop .tit {
   	margin: 51px 0 24px;
   	font-size: 24px;
   	color: #222;
   }
   .position {
   	display: flex;
   	padding-left: 352px;

   }
   .position_nav:hover {
	display: block;
   }
   .position_nav_group {
   	position: relative;
   	padding-right: 53px;
   }
   .img_position {
   	justify-content: center;
   

   }
   .position_icon > * {
   	display: block;
   }
   .text_position {
   	text-align: center;
   }
   .text_size{
	text-align: center;
   }
   .error_img {
   	height: 180px;
   	display: flex;
   	align-items: center;
   	vertical-align: center;
 
     
  
	}
	.error_img_position {
		display: block;
		margin: 0 auto;
	}
	
	.bloosom_out_text {
		text-align: center;
		font-size: 15px;
	}
	.bloosom_out_text_01 {
		text-align: center;

	}
	.join_out_agree_password {
		padding: 10px 51px 15px;
		margin: 20px 355px 0;
		height: 99px;
	
		
		
	}
	.id_pass {
		text-align: center;
		font-size: 14px;
		border-bottom: 1px solid black;
	}
	.join_out_agree_password tr {
		padding: 10px 0 0 10px;
		color: #222;
		vertical-align: middle;
	}

	.pass_01 {
		margin-left: 12px;
	}
	 .id_password {
	 	padding-top : 8px;
	 }
	    .btn_double_area{
			margin:  29px 5px 0px 795px;
			overflow: hidden;
		}
		.btn_double_area > span {
			display: block;
			float: left;
			width: 150px;
		}

		.btn_agree {
		color: #fff;
		border: 1px solid #40BF75;
		background-color: #40BF75;;
		}
		
		.btn_agree:hover {
		 background-color: #1F8AD8;
		 border: 1px solid #1F8AD8;
          
		}

		.btn_default {
		    color: #333;
		    border: 1px solid #e7e7e7;
		    background-color: #fff;
        }
		.btn_type {
	    width: auto;
	    margin: 0px 5px;
	    font-size: 20px;
	    font-weight: 600;
	    line-height: 61px;
	    display: block;
	    box-sizing: border-box;
	    height: 61px;
	    padding-top: 1px;
	    text-align: center;
       }



       /*모달창*/
  .modal_wrap {
    position: fixed;
    z-index: 1000;
    background-color: rgba(0,0,0,0.4);
    overflow: auto;
    width: 100%;
    height: 100%;
    display: none;
    justify-content: center;
    align-items: center;
    }
    .modal_logo {
    	width: 50%;
       	height: 120px;
       	background-image: url('../../../img/투명배경.png');
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
    	font-size: 20px;
        font-weight: 900;

    }

    .modal_check{
			margin: 11px 36px 795px;
			overflow: hidden;
		}
	.modal_check > span {
			display: block;
			float: left;
			width: 150px;
		}



		.btn_agree {
		color: #fff;
		border: 1px solid #40BF75;
		background-color: #40BF75;;
		}
		
		.btn_agree:hover {
		 background-color: #1F8AD8;
		 border: 1px solid #1F8AD8;
          
		}	

   </style>
   
</head>
<body>
  <div class="modal_wrap" style="display: flex;">
		<div class="modal_content">
			<div class="login_close">
			<button><i class="fas fa-times"></i></button>
		</div>
			<div class="modal_logo"></div>
			<div class = "modal_text">
				탈퇴를 진행 하시겠습니까?
			</div>

			
				<div class="modal_check">
	   			  	<span><a href="#" class="btn_type btn_default">취소</a></span>
	   				<span><a href="#" class="btn_type btn_agree">확인</a></span>	   			  	  	
	   			</div>
			
			
		</div>



	</div>


	<div id="container" class="snbContainer">
		<div class="mypage_top">
			<div class="logo">
				<img class = "b_logo" src="../../../img/HatchfulExport-All (2)/logo.png" alt="logo">
			</div>
			
			<p class="user" >
				<span class="userInfo"><strong>Welcom</strong></span><br>
			
			<span class="usermessege" >
				<strong>"조운이"</strong> 고객님 환영합니다.
			</span>
			</p>
			<div class="position">
				<div class="position_nav">
					<div class="position_nav_group">
						<p>
						<a href="#" class="position_icon">
							<img src="../../../img/icon/point.png" class="img_position">
							<strong class="text_size">보유 포인트 </strong>
							<div class="text_position"><strong>"2,000"점</strong></div>

						</strong>
						</a>
						
					</p>
					</div>
				</div>
				<div class="position_nav">
					<div class="position_nav_group">
						<p>
						<a href="#" class="position_icon">
							<img src="../../../img/icon/coupon.png" class="img_position">
							<strong class="text_size">보유 쿠폰</strong>
							<div class="text_position"><strong>"0"장</strong></div>
						</a>
						
					</p>
					</div>
				</div>
				<div class="position_nav">
					<div class="position_nav_group">
						<p>
						<a href="#" class="position_icon">
							<img src="../../../img/icon/post.png" class="img_position">
							<strong class="text_size">구매 내역 </strong>
							<div class="text_position"><strong>"2"건</strong></div>
						</a>
						
					</p>
					</div>
				</div>
				
			</div>

				
		</div>
		<div></div>
			<section id ="contents">
				<section class="contents">
					<div class="error_img">
						<img src="../../../img/error.png" class="error_img_position">
					</div>
					<div class="bloosom_out_text">
				 	<h3 class="subtitle">회원탈퇴 전 꼭 확인 해주세요 </h3>
				 	
				 		<p class="tit_t1"> Bloosom 웹사이트를 이용하는 데 불편한 사항이 있으셨나요?</p>
				 		<p class="txt_t2">
				 			" 사이트를 이용하시며, 불편한 점이 있으셨다면 아래에 사유를 남겨주세요." <br>
                            "보다 나은 Bloosom 될 수 있도록 참고 하겠습니다. 회원 탈퇴 전 아래의 사항들을 확인해 주세요.""
				 			
				 		</p>
				 	</div>
				 	<div>
				 		<br>
				 	</div>
					<div class="bloosom_out_text_01">
				 		<strong><p class="text_t3">1. 회원님께서 탈퇴시, 탈퇴와 함께 삭제되는 정보입니다.</strong><br>
				 			<div>
				 				<br>
				 			</div>
						Blossom 에 저장된 개인 정보<br>
						누적포인트 정보 및 회원등급<br>
						온라인 쿠폰정보

				 		</p>
				 	</div>	
				 	<div class="text_zero">
				 		<br>
				 	</div>
				 	<div class="bloosom_out_text_01">
				 		<strong><p class="text_t3">2.
				 		회원탈퇴 후, 즉시 재가입 가능합니다. 동일 아이디는 사용할 수 없습니다.</strong>					
				 	  </p>
				 	</div>
				 	
				 	<div class="join_out_agree_password">
				 		<h5 class="id_pass"><strong>아이디와 비밀번호를 입력하세요</strong></h5>
				 		<div class="id_password">
				 			아이디
							   <input type="text" class="pass_01" placeholder="아이디" >	
				 			 </div>
				 			<div class="password">비밀번호
								<input type="password" class="pass" placeholder="비밀번호" >
					 		</div>
				 		</div>

				 	</div>

				 	</div>
				 		
				 	</div>
				 	
				</section>


				<div class="btn_double_area">
	   			  	  	<span><a href="#" class="btn_type btn_default">취소</a></span>
	   			  	  	<span><a href="#" class="btn_type btn_agree">확인</a></span>	   			  	  	
	   			</div>
		    </section>
		
			
		</div>
		
	</div>
</body>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


	//Login 버튼 클릭시 Modal 창 Open
   $(document).on('click', '.login_open', function() {
   $('.modal_wrap').css('display','flex');
   $('#login_id').focus();
   });




   //MODAL 창의 X버튼을 클릭하면 MODAL창 close
   $(document).on('click', '.login_close', function() {
       $('.modal_wrap').css('display','none'); 
       $('.frm_login')[0].reset();
        $('.pw_eye').prev().attr('type','password');

         $('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
                        .css('color','#AAA');
       //$('.login_input').val('');
    });
</script>
</html>