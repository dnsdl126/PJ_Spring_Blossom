<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 스크립트 립 : 자바코드를 쓸수 있게 해준다  -->
<!-- haeder 와 include 페이지가 합해진다.  -->
<%@ include file = "include.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLOSSOM</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
  

	<style type="text/css">
	  form{
	    margin: 0px;	    
	    }
	 .login_err_msg {
    
      font-size: 12px;     
      color: red;
      display:none;
      }   
		div.header_wrap {
			width: 100%;
			background: white;
         box-shadow: 0 0 1px 1px rgba(20, 23, 28, .1), 0 3px 1px 0 rgba(20, 23, 28, .1);
         z-index: 999; /* z-index: 숫자가 클수록 가장 앞에 나와라 */
         /*요소배치 flex box : */
         position: fixed;
         top: 0;

		}
      div.header_content{
         width: 1400px;
         margin: 0 auto;
         height: 65px;
         box-sizing: border-box;        
         display: flex;
         justify-content: space-between;
         align-items: center;
      }
      .header_content_logo {}
      .header_content_search {}
      .header_content_search_group {
          display: flex;
          align-items: center;
          background-color: #f2f3f5;
          border-radius: 20px;
      }
      .hearder_content_search_input {
         background-color: transparent;        
         border-color: transparent;
         width: 220px;
         height: 44px;
         font-size: 13px;
         border-radius: 2px;
         padding: 10px 12px;
         outline: none; /*input 태그 Focus시 파랑테두리 */
      }
      .hearder_content_search_btn{
         
         border-color: transparent;
         background-color: transparent;
         width: 44px;
         height: 44px;
         cursor: pointer;
         color: #40BF75;
         border-top-right-radius: 20px;
         border-bottom-right-radius: 20px;
         

      }
      .hearder_content_search_btn:hover {
         background-color: #1F8AD8;
         color: white;

      }
      .header_content_nav {
         display: flex;
         align-items: center;
         justify-content: space-between;
         width: 486px;
      }
      .header_content_nav > div {
        
      }
      .header_content_member {  

               /*width: 160px;*/
               display: flex;              
               align-items:center;
               justify-content: space-between;
               flex-direction: row; /* default(생략가능)*/
             }
      .header_content_member > div {
         padding: 10px 0px 10px 3px;
      }
      .header_content_dropdown_group {
         position: relative;

      }  
      .header_content_dropdown_wrap:hover .header_dropdown {
         display: block;
         z-index: 2;
      }   
      .header_content_dropdown_group > a{
         display: inline-block;
         padding: 12px 15px;
         font-weight: 400;
         border: 1px solid transparent;
         border-radius: 2px;
         height: 45px;
         color: #3D87C1;
         line-height: 19px;

      }
      .header_content_dropdown_group:hover > a,
      .header_content_member_cart:hover > a {
         background-color: #f2f3f5;
         border-color: #1F8AD8;
         
      }
      .header_content_member_cart> a {
         display: inline-block;
         width: 45px;
         height: 45px;
         border-radius: 50%;
         color: #1F8AD8;
         border: 1px solid transparent;
         text-align: center;
         padding: 12px;
         line-height: 19px;
      }

      .hearder_content_logo_img {
         width: 121px;
         vertical-align: middle;
      }
      .header_dropdown_menu {
         border-bottom-left-radius: 2px;
         border-bottom-right-radius: 2px;
         box-shadow: 0 4px 16px rgba(20, 23, 28, .25);
        background-color: white;        
        padding: 10px 0;
         border-radius: 10px;
        

      }
      .header_dropdown_menu a {
         display: inline-block;
         font-size: 15px;
         color: #505763;
         text-align: center;
         padding: 5px 15px;
         font-weight: 400;
         width: 130px;
         position: relative;
        z-index: 100;
      }
       .header_dropdown_menu a:hover {
         color: #007791;
         background-color: #f2f3f5;
       }
      .header_dropdown {
         position: absolute;
         top: 53px;
         left: 0;
         display: none;
      }
      .arrow {
         position: absolute;
         top: -4px;
         left: 16px;
         width: 15px;
         height: 15px;
         transform: rotate(45deg);
         background-color: white;
         border-color: transparent transparent #FFF transparent;
         z-index: 99;
      }
     
      /* 모달 로그인 창 */
      .modal_login_wrap {
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
      .modal_box {
         position: relative;
         width: 372px;
         height: 600px;
         background-color: white;
         box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19);
         border-radius: 2px;
         overflow: hidden;
      }
      .top_logo{
         display: block;
      }
      div#content_layout{
         margin: 0 auto;
         width: 285px;
      }
      div#header_div{
         width: 169px;
   		 margin: 31px auto 15px;

      }
       div.div_input {
        background-color: white;
        border: 1px solid #dadada;
        width: 282px;
        height: 40px;
        margin-bottom: 2px;
        padding: 6px 27px 5px 18px;
       }
      .div_input {
         border-radius: 4px 4px 0 0;

      }
      span.input_box {
      display: block;
      overflow: hidden;
      } 
      input.input_login {
       border-width: 0px;
       width: 233px;
       padding: 7px 0px 6px 0px;
       outline: none;
      }
      #btn_login {
          border: none;
          display: block;
          background-color: #40BF75;
          color: white;
          font-size: 20px;
          width: 281px;
          height: 53px;
          text-align: center;
          padding-top: 2px;
          line-height: 50px;
          text-decoration: none;
          margin: 30px 0px 13px 0px;
      }
       #btn_login:hover {
          
         background-color: #1F8AD8;
      }
      .sign_box_enter {
         display: inline-block;;
         padding: 3px 5px;
         margin: -3px 10px;
      }
      .sign_box{
          margin: 20px 0;
          text-align: center; 
          color: #424242;
          font-size: 15px;
          line-height: 1.4;
       }
      

       .sign_box_enter:hover, 
       .sign_box_enter:focus, 
       .sign_box_enter:active {
         text-decoration: underline;
       }
       .SNS{
         display: block;
         margin: 30px 0;
       }
       
       .sign_in_text {
          margin: 15px 0;
          color: #757575;
          font-size: 12px;
          font-weight: normal;
          line-height: 1.33;
          text-align: center;
        }
        .SNS {
         text-align: center;
         font-size: 10;
        }
        .sns_list_enter {
         display: inline-block;
         margin: 0 10px;
         transition: opacity. 1s;
         position: relative;
        }
        .facebook_img, .naver_img, .kakao_img {
         width: 48px;
         height: 48px;
         border-radius: 5px;
         background-size: 320px;
         background-position: left 0px top -80px;
         width: 48px;
    
        }
        .sign_guest {
        margin: 30px 0 0;
        padding: 10px 0 0;
        border-top: 1px solid #dbdbdb;
        }
        .sing_guest_title {
             display: block;
             width: 100%;
             margin: -10px 0 20px;
             padding: 10px 0;
             background: none;
             border: none;
             color: #424242;
             font-family: inherit;
             font-size: 15px;
             line-height: 1.4;
             text-align: center;
         }
        .sing_guest_title:hover, 
        .sing_guest_title:focus, 
        .sing_guest_title:active {
         text-decoration: underline;
       }
       .sns_list_enter:hover::before{
         opacity: 0.3;
       }

       .sns_list_enter::before {
         
         content: '';
         position: absolute;
         width: 48px;
         height: 48px;
         top: 0;
         left: 0;
         background-color: white;
         opacity: 0;
       }
       .login_close {
         position: absolute;
         top: 7px;
         right: 7px;
       }
       .login_close > button {
         color: rgb(142, 142, 142);
         border: none;
         background: white;
         font-size: 30px;
         cursor: pointer;
         outline: none;
       }
       .login_close > button:hover {
         color: #1F8AD8; 
       }
       .pw_eye {
         position: absolute;
         color: #AAA;;
         font-size: 17px;
         top: 9px;
         right: 7px;
         cursor: pointer;
         height: 45px;
         line-height: 45px;
         width: 30px;
         text-align: center;
       }
       #login_pw{
         padding: 8px 40px 8px -9px
       }
      #naver_pw{
         position: relative;
      }
	</style>
</head>
<body>
   <div class="modal_login_wrap">
     <div class="modal_box">
       <div class="login_close">
          <button><i class="fas fa-times"></i></button>
       </div>
    <div id= content_layout>
         <header>
            <div  id="header_div">
               <img class="modal_content_logo_img" src="${path}/resources/img/linkedin_banner_image_1.png" alt="로고이미지" style = "width: 184px">               
            </div>
         </header>
         <div class="login_err_msg">
               <h1 style="font-size: 12px">로그인 중 문제가 발생하였습니다 <br>이메일이나 비밀번호를 다시 확인해주세요</h1>               
          </div>
          <form class="frm_login" onsubmit="return false;" >            
            <div class="div_input" id="naver_id">
             <span class="input_box">
               <input type="text"  id="login_id" name = "id" placeholder="아이디"  class="input_login" id="inputid" required>
             </span>
            </div>
            <div class="div_input" id="naver_pw">              
               <input type="password" id="login_pw" name = "pw" placeholder="비밀번호" class="input_login" id="inputpw" required minlength="6" maxlength="18">              
               <span class="pw_eye"><i class="fas fa-eye-slash"></i></span>
             </div>        
             <div >
             	
                <button type ="submit" id="btn_login">Login</button>
                
             </div>
          </form>
             <div class="sign_box">
               <!-- session 에서 userid 비어있으면 -->
                <a class="sign_box_enter" href="#">아이디/비밀번호 찾기</a>
                <a class="sign_box_enter" href="#">회원가입</a> 
                              
            </div>
            <selection class="SNS">
                <h2 class = "sign_in_text">SNS계정으로 간편 로그인/회원가입</h2>
                <div class="sns_list">
                   <a class="sns_list_enter" href="https://www.facebook.com/login">
                      <span class="facebook" aria-label="페이스북으로 로그인">
                         <img class="facebook_img" src="${path}/resources/img/facebook.png ">
                      </span>
                   </a>
                   <a class="sns_list_enter" href="https://www.naver.com">
                      <span class="naver" aria-label="네이버로 로그인">
                         <img class="naver_img" src="${path}/resources/img/naversm.png">                    
                         
                      </span>
                   </a>
                   <a class="sns_list_enter" href="https://www.facebook.com/login">
                      <span class="kako" aria-label="카카오 로그인">
                         <img class="kakao_img" src="${path}/resources/img/kakao.png">
                      </span>
                   </a>
                   <section class="sign_guest">
                      <button class="sing_guest_title">
                         비회원 주문 조회하기
                      </button>
                      
                   </section>                   
                </div>
             </selection>
       
      </div>        
     </div>


         
    </div> 

  <header>
   	<div class="header_wrap">
   		<div class="header_content">
   			<div class="header_content_logo">
               <a href="#">
                  <img class="hearder_content_logo_img" src="${path}/resources/img/linkedin_banner_image_1.png" alt="로고이미지">
                  
                </a>               
               </div>   				 
   				<div class="header_content_search">
                  <form name="frm_search" action="" method="GET">
                     <div class="header_content_search_group">
                        <input type="text" placeholder="상품을 검색해 보세요" name="keyword" class="hearder_content_search_input">
                        <button type="button" class="hearder_content_search_btn"><i class="fas fa-search"></i></button>
                     </div>

                  
                  </form>                  
               </div>
   				<div class="header_content_nav">
                  <div class="header_content_dropdown_wrap">
      					<div class="header_content_dropdown_group ">
                        <a href="#" class="magicline">스킨케어</a>
                        <div class = "header_dropdown">
                            <div class="arrow"></div>
                              <ul class="header_dropdown_menu">
                                 <li><a href="#" >스킨</a></li>
                                 <li><a href="#" >토너</a></li>
                                 <li><a href="#" >에센스</a></li>
                                 <li><a href="#" >크림</a></li>
                              </ul>
                        </div> 
                     </div>
                  </div>
   					<div class="header_content_dropdown_wrap">
                  <div class="header_content_dropdown_group "><a href="#" class="magicline">바디케어</a>
                      <div class = "header_dropdown">
                            <div class="arrow"></div>
                              <ul class="header_dropdown_menu">
                                 <li><a href="#" >미스트</a></li>
                                 <li><a href="#" >바디로션</a></li>
                                 <li><a href="#" >바디크림</a></li>
                              </ul>
                        </div> 
                  </div>
               </div>
                  <div class="header_content_dropdown_wrap">
   					<div class="header_content_dropdown_group "><a href="#" class="magicline">헤어</a>
                         <div class = "header_dropdown">
                            <div class="arrow"></div>
                              <ul class="header_dropdown_menu">
                                 <li><a href="#" >샴푸</a></li>
                                 <li><a href="#" >린스</a></li>
                                 <li><a href="#" >헤어팩</a></li>
                              </ul>
                        </div> 
                  </div>
               </div>
   					<div class="header_content_dropdown_group"><a href="#" class="magicline">리뷰</a></div>
   					<div class="header_content_dropdown_group"><a href="#" class="magicline">브랜드소개</a></div>
               </div>
   				<div class="header_content_member">
                  <div class="header_content_dropdown_wrap">
                    <div class="header_content_dropdown_group">
                      <!-- 네비게이션 -->
                     <a href="#"><i class="far fa-smile"></i>&nbsp;마이페이지</a>
                        <!--dropdwon 메뉴 -->                        
                        <div class = "header_dropdown">
                         <div class="arrow"></div>
                           <ul class="header_dropdown_menu">
                              <li><a href="#" >회원정보수정</a></li>
                              <li><a href="#" >위시리스트 </a></li>
                              <li><a href="#" >주문확인</a></li>
                              <li><a href="#" >고객센터</a></li>
                           </ul>
                        </div>                        
                    </div>   
                  </div>
                  <div>
                     <div class="header_content_member_cart">
                        <a href="#"><i class="fas fa-shopping-bag"></i></a>
                     </div>
                  </div>
				<div class = "login_content_box" style = "display: flex ">
				 <c:choose>
				   <c:when test = "${empty sessionScope.userid}">
   					<div><button type ="button" class="btn btn-basic login_open">로그인</button></div>
                    <div><button type ="button" id="header_btn_join" class="btn btn-primary">회원가입</button></div>
                   </c:when>
                   <c:otherwise>
                     <div><button type ="button"  class="btn btn-primary">로그아웃</button></div>
                   </c:otherwise>  
                 </c:choose>
                </div>	      
                      					
               </div>   
   		     </div>
   	</div>


  </header>
</body>

<script type="text/javascript">
   //jQuery 문법
   // $('선택자').옵션();
   // $('#test').css('color', 'green');
   // $ = jQuery
   //('#test') = 선택자(id가 test)
   //.css() = 옵션(글자색을 녹색);

   //jQuery 이벤트 문법(클립, 포커스, 블러 등)
   //$(document).on('이벤트','선택자', 'function()')
   // 이벤트 발생시 동작할 내용들 ...
   // });
   //$(doucment).on('click', '#test', fuction()
   //           $(this).css('color','blue');
   //});
   //$(doucment).on() = 문서전체에서
   //('click')        = 클릭 이벤트가 발생하면
   //('#test')        = 아이디가 test 인
   //function(){}     = 익명함수(이름이 없는 함수)
   //$(this)          = 나 자신(여기서는 #test)
   //해석 : 문서전체에서 id가 test인 태그가 클릭되면
   //            나를(#test) 글자색을 blue로 변경해라!


   //로그인 input(id, pw)에 focus 되면 테두리색 변경
   $(document).on('focus', '.div_input', function(){
       $(this).css('border', '1.2px solid #40BF75')
   });
   $(document).on('blur', '.div_input', function(){
       $(this).css('border', '1.2px solid #757575')
   });
      


   //Login 버튼 클릭시 Modal 창 Open
   $(document).on('click', '.login_open', function() {
   $('.modal_login_wrap').css('display','flex');
   $('#login_id').focus();
   });

   //MODAL 창의 X버튼을 클릭하면 MODAL창 close
   $(document).on('click', '.login_close', function() {
       $('.modal_login_wrap').css('display','none'); 
       $('.frm_login')[0].reset();
        $('.pw_eye').prev().attr('type','password');

         $('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
                        .css('color','#AAA');
       //$('.login_input').val('');
       
       $('.login_err_msg').css('display', 'none');
    });
   
  
   //LOGIN Modal창 암호 보이기 or 숨기기 
  
    //값을 가져오는 방법
    // : 서버단으로 값을 보낼때 사용하는 태그들이 대부분
    // <span class="aaa"> 동토리 </span>
    // <input type="text" class="dobby"> 동비 </inpute>
    //
    // input 태그 값 가져오는 방법
    // $('.dobby').val();
    // input 태그 값 넣는 방법
    // $('.dobby').val('메롱');

    // input 태그 이외의 값 가져오는 방법
    // $('.aaa').text();
    // input 태그 이외의 값 넣는 방법
    // $('.aaa').text('뭐시영??');

    //태그의 옵션(attribute)을 가져오고 싶을 때
    // $('.dobby').attr('type');
    // $('.dobby').attr('class');
   
    //LOGIN Modal창 암호 보이기 or 숨기기
    $(document).on('click','.pw_eye', function() {
      var code = $(this).prev().attr('type');
      if(code=='password'){
         $(this).prev().attr('type','text');
         $(this).html('<i class="fas fa-eye"></i>')
                        .css('color','#666');
      } else {
         $(this).prev().attr('type','password');
         $(this).html('<i class="fas fa-eye-slash"></i>')
                        .css('color','#AAA');
      }
     });
    
    // login 버튼 클릭시 AJAX 동작
    $(document).on('click', '#btn_login', function(){
 	   var id = $('#login_id').val();
 	   var pw = $('#login_pw').val();
 	   
 	 // 유효성 체크 (id, pw) NULL 체크
 	   if(id != '' && pw !='' && id.length !=0 && pw.length !=0) {
 		  
 	     $.ajax({
 	    	 url: '${path}/login/in',
 	    	 type: 'POST',
 	    	 data: 'id='+id+'&pw='+pw,
 	     			
 	    	 
 	    	   // &pw 에 & 데이터가 혼합되지 않도록 나누는 역할 
 	    	   success: function(data){
 	    	 if(data == 0 || data == 3) {
 	    		 $('.login_err_msg').css('display', 'block').text('로그인중 문제가 발생했습니다. 아이디 및 비밀번호를 확인해주세요')
 	    	 } else if(data == 1) {
 	    		 console.log('로그인 성공');
 	    		 location.reload(); // 새로고침 
 	    	 } else if(data ==  2) {
 	    		 $('.login_err_msg').css('display', 'block').text('이메일 인증을 하셔야만 로그인이 가능합니다.')
 	    		 
 	    	 }
 	    	
 	    		   
    	   },
 	    		 error : function(){
 	    		alert('System Error:/');
 	    	 }
 	     });
 	  }
    });

    
    /* Header 가입하기 이동시 가입페이지로 이등 */
	$(document).on('click', '#header_btn_join' ,function() {

		location.href="${path}/member/constract";
	});

</script>
</html>