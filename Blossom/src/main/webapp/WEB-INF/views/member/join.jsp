<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ include file = "../include/include.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
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
   	ul { list-style: none; }
   	a { text-decoration: none; color: inherit;}
   	
   	.user_sign_up {
   		padding-top: 58px; 
   	}
   	.container {
   		margin: auto ;
   		width: 100%px;
   		box-sizing: border-box;
   		min-height: 1px;
   		
   	}
   	.user_sign_up_form_wrap {
   		width: 524px;
   		margin: 0 auto;
   		border: 1px solid #e5e5e5;
        padding: 58px 69px 58px;
   		
   	}
   	.user_sign_up_title {
   		font-size: 20px;
   		font-weight: 700;
   	}
   	.hearder_content_logo_img {
			display: block;
			width: 183px;
			height: 78px;			
			margin-left:auto;
			margin-right: auto;
		}
	
	.user_sign_up_form_group_label {
		display: block;
		margin: 0 0 12px;
		font-size: 15px;
		font-weight: 700;
		color: #292929;
		line-height: 21px;
		word-break: keep-all;
		
	}
	.user_sign_up_form_group_input {
		margin: 10px 0 0;
		border: 1px;
		

	}
	.count {
	   display: flex;
   	    align-items: center;
	
	}
	.email_input {
		display: flex;
	}
	.input_group {
		flex: 1 0 auto;
	}
	.name_class {
	display : flex;
	}
	/*유저이름*/
	.name_count {
	color: #7c7c7c;
    font-size: 14px;
    font-weight: bold;
    margin-left: 10px;
	}
	.email_input_local, .email_input_domain {
		position: relative;
		flex: 1 1 0px;
	}
	.email_input .errored .form_control {
		border-color: #f77;
	}
	.email_input .errored .form_control:focus {
		outline: none;
		box-shadow: 0 0 2px rgba(255, 119, 119, .5);
	}
	.form_control  {
		outline: none;
		border-radius: 2px;
	}
	.focus_visible {

		font-size: 15px;
		border-radius: 4px;
		line-height: 29px;

	}
	.email_input_domain > .form_control 
	.email_input_local > .form_control {
		width: 100%;
	}
	.email_input_domain> .form_control>option,
	.email_input_local> .form_control>option {
		color: #424242;
	}
	.user_sign_up_form_group_input
	.form_control {
		font-size: 15px;
		border-radius: 4px;
	}
	.input_group  {

	}
	.form_control {
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
	.email_input_separator {
		flex: 0 0 20px;
		text-align: center;
		line-height: 40px;
		color: #dbdbdb;
	}
	.email_input_domain_expand {
		    position: absolute;
		    top: 10px;
		    right: 10px;
		    padding: 5px;
		    background: none;
		    border: none;
		    font-size: 0;
		    cursor: default;
		    color: rgba(0,0,0,.3);
	}
   .join_err_msg {
   	margin: 10px 0;
   	font-size: 13px;
   	line-height: 21px;
   	color: #f77;
	visibility: hidden;	
	display: inline-block;
   }
	   
	.user_sign_up_form_group_description {
		margin: 0;
		font-size: 13px;
		color: #757575;
		line-height: 1.4;
	}   
	.int {
   		display: block;
   		position: relative;
   		width: 100%;
   		height: 29px;
   		padding-right: 25px;
   		line-height: 29px;
   		border: none;
   		background: #fff;
   		font-size: 15px;
   		z-index: 10;}

   	.birthday_yy, .birthday_mm	{
   		position: relative;
		flex: 1 1 0px;
   	}

   	.birthday_yy > .form_control 
	.birthday_mm > .form_control {
		width: 100%;
	}

	.form_day {
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
		border-radius: 4px;
	}
	.year_input_local, .month_input_domain, .day_input_local {
		position: relative;
		flex: 1 1 0px;

	}
	.day_iput {
		display: flex;
		justify-content: center;
	}
	.year_input_local,  .month_input_domain {
		padding-right: 10px;
	}

	.btn_double_area {
   		margin: 30px 0 9px;
   	}

   	.btn_type {
   	color: white;
    background-color: #40BF75;
    border-radius: 10px;
    border: none;
    display: block;
   	width: 27%;
   	padding: 21px 0 17px;
   	font-size: 20px;
   	font-weight: 700;
   	text-align: center;
   	cursor: no-drop;
   	margin: auto;
   	}
   	.btn_agree {
    color: white;
    background-color: #1F8AD8;
    border-radius: 10px;
    border: none;
    display: block;
   	width: 27%;
   	padding: 21px 0 17px;
   	font-size: 20px;
   	font-weight: 700;
   	text-align: center;
   	cursor: no-drop;
   	margin: auto;
   	}
   	.address_control{
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
   	.address_flex {
   		display: flex;

   	}
   	.address {
   		
   	}
   	#back {
   	 position: fixed;
   	 z-index : 1200;
   	 background-color : rgba(0,0,0,0.4);
   	 overflow: auto;
   	 width: 100%;
   	 height: 100%;
   	 top:0;
   	 left:0;
   	 display: none;
   	 align-items: center;
   	 justify-content: center;
   	 
   	}
   	.loading_img{
   		animation: ani_loading 1.5s infinite linear;
   		font-size:70px;
   		color: #EBA444;  	
   	}
   	
   	@keyframes ani_loading {
   	 from {-webkit-transform: rotate(0deg);}
   	 to {-webkit-transform: rotate(359deg);}
   	}
	 	#footer {
			padding: 15px 0;
		}
		#footer > ul {
			margin: 0 auto 9px; /*상 좌우 하 */
			text-align: center;			
		}
		#footer * {
			font-size: 11px;
			line-height: normal;
			list-style: none;
			color: #333;
		}
		#footer> ul > li {
			display: inline;
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		#footer > ul > li > li:hover {
			color: #1fbc02;
			text-decoration: underline;
		}
		#footer ul li:first-child { /*모든 li 이 중에 첫번재만 */
			border-left: 0px!important; /*!important - 제일 높은 레벨 , 자주쓰지는 말아야 한다 */
		}

		#footer ul li:first-child {
			border-left: 0px;important;
		}

		#addr_logo {
			width: 63px;
			height: 11px;
		}
		#address {
			margin: 0 auto;
			text-align: center;			
		}
		#address * {
			font : 9px verdana;
		}
		#address a {
			font-weight: bold;			
		}
		#address a:hover {
			color: #1fbc02;
		}
	
   </style>
   
</head>
<body>
	   
<section class="container user_sign_up">
	<!-- <form id="frm_member" action="${path}/member/join" method="post"> -->
	<form:form id= "frm_member" modelAttribute="memberDTO" autocomplete="on">	
		<div class="user_sign_up_form_wrap">			
			<div class=" sign_up_logo">
						
				<a href="${path}"><img class="hearder_content_logo_img" src="${path}/resources/img/linkedin_banner_image_1.png" alt="로고이미지"></a>
			</div>			
			<div class="user_sign_up_form_group">
					<div  class="user_sign_up_form_group_label">
						이메일/아이디
					</div>
					<div class="user_sign_up_form_group_input ">
						<div class="user_sign_up_form_group">
							<div class="input_group email_input errored">
								<span class="email_input_local">
									<input class="form_control focus_visible int_log" placeholder="이메일" name="id" id="uid" value ="${user.id}">
								</span>
								<span class="email_input_separator">@</span>
								<span class="email_input_domain">
								   
									<select class="form_control empty selectEmail" id="umail" >
										<option selected value disabled>선택해 주세요</option>
										<option value="directVal">직접입력</option>	
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
									</select>
									<input type="hidden" name="email" id="emailAll">
								</span>
							</div>
							<div class="join_err_msg">
								필수 입력 항목 입니다.
						    </div>
						</div>
					</div>												
					<div class="user_sign_up_form_group_input error" >
						<div class="user_sign_up_form_group_label" >
							비밀번호	                         
						</div>
						<div class="user_sign_up_form_group_description pw_group" >
							8자이상 영문 대 소문자, 숫자, 특수문자를 사용하세요
						</div>
						<div class="user_sign_up_form_group_input ">
							<input class="form_control focus_visible int_log pw_group" type="text" id="upw" name="pw" placeholder="비밀번호 입력" >
						</div>						
						<div class="join_err_msg pw_group">
							필수 입력 항목 입니다.
					    </div>						
					</div>
					<div class="user_sign_up_form_group error ">
						<div  class="user_sign_up_form_group_label" >
							비밀번호 재확인	                         
						</div>						
						<div class="user_sign_up_form_group_input">
							<input class="form_control focus_visible int_log" type="password" id="urpw" placeholder="비밀번호 재입력">
						</div>						
						<div class="join_err_msg">
							필수 입력 항목 입니다.
					    </div>						
					</div>
					<div class="user_sign_up_form_group error ">
						<div  class="user_sign_up_form_group_label name_class" >						
							이름
							<div class="name_count">
						  		<span class="cnt">0</span>/20						  
						    </div>		                         
						</div>						 						
						<div class="user_sign_up_form_group_input count">
							<input type="text"  name="name" id="uname" value class="form_control error int_log" value ="${user.name}">
						    					
						</div>						
						<div class="join_err_msg">
							필수 입력 항목 입니다.
					    </div>						
					</div>
					
					
					<div class="user_sign_up_form_group error">
						<div  class="user_sign_up_form_group_label">
							주소
						</div>
						<div class="user_sign_up_form_group_input">
							<div class="address_flex">
							   <input class="addr_only address_control error int_log" type="text" id="sample6_postcode" placeholder="우편번호" name="postcode" value ="${user.postcode}">
						       <span>
						         <input class="address_control address_control error int_log" type="button" id="btn_post" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						        </span><br>
						    </div>	
							    <input class="addr_only form_control error int_log" type="text" id="sample6_address" placeholder="주소" name="addr1" value ="${user.addr1}">
							<div class="address">
							 	<input class="form_control error int_log" type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr2" value ="${user.addr2}">
								<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
							</div>						 
					    </div>	
					    <div class="join_err_msg">
							필수 입력 항목 입니다.
					    </div>
				    </div>
		     </div>
					
				<div class="user_sign_up_form_group error">
					<div  class="user_sign_up_form_group_label" >
						연락처                         
					</div>						
					<div class="user_sign_up_form_group_input">
						<input type="tel" name="phone" id="uphone" class="form_control error int_log" placeholder="-없이 입력 예)0101234567" value ="${user.phone}">
					</div>						
					<div class="join_err_msg">
						필수 입력 항목 입니다.
					</div>						
				</div>
		</div>
					
				<div class="btn_double_area">
						<span><button type="button" id='btn_join' class="btn_type btn_agree">가입하기</button></span>
				</div>
		</form:form>	
		<!--</form>-->
	</section>	
	<footer>
			<div id="footer">
				<ul>
					<li><a hrdf='#'>이용약관"</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
			</div>
			<div id="address">
				<span>
					 <a href="https://www.naver.com">
						<img id="addr_logo" src="../img/naver/naver_logo.png">
					</a>
				</span>
				<span>copyright</span>
				<span>@</span>
				<span><strong><a href="#">NAVER Corp</a></strong></span>
				<span>ALL Rights Reserved.</span>
			</div>
			
		</footer>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/daum_post.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	
$(function(){
	// 비밀번호가 유효한 값인지 체크해주는 flag 값
 	var pwFlag = false;

 	// 유효성체크 여부를 알려주는 배열
 	var checkArr = new Array(5).fill(false);
 	// printCheckArr(checkArr);
 
 	// 유효성체크 모두 통과 or  불통 여부를 알려주는 변수 
	var checkAll = false;	
	
	alert('user: ' + '${user}');
	
	 // 버튼 텍스트가 스정하기
	 
	
	if('${user}' !='') {
		 //->비밀번호, 비밀번호 재설정 제거
		 $('.user_sign_up_form_group_description').css('visibility','hidden');
		 $('.user_sign_up_form_group_input:eq(2)').css('visibility','hidden');
		 $('.user_sign_up_form_group_input:eq(3)').css('visibility','hidden');
		 // id에 readonly 효과를 줘서 입력이 불가능
		 
		 // id=#id를 제거해서 우리가 입력한 유효성 체크 동작 불가능
		 $('#uid').attr('readonly','true').removeAttr('id');
		 $('.email_input_separator').css('display','none');
		 $('.email_input_domain').css('display','none');
		
		 //회원 정보 수정 디자인 변경
		 // -> 버튼 텍스트가 수정하기로 변경
		 $('#btn_join').text('수정하기');
		// DB에서 가져온 값 기존에 사용자가 등록한 값 변수에 담음
		  var name = '${user.name}';
		  var phone = '${user.phone}';
		  var postcode = '${user.postcode}';
		  var addr1 = '${user.addr1}';
		  var addr2 = '${user.addr2}';
		// 유효성 체크 진행 -> 무조건 통과가 들어가야 한다 
		  ckName(name); 
		  ckPhone(phone);
		  ckAddr(addr2, addr1);
		  checkArr[0] = true;
		  checkArr[1] = true;
		 // 
		  ckColorBtn();
		 // 값 여부 확인 
		 printCheckArr(checkArr);
		  
		
	}
	 
function ckDesign(code, desc, line, msg){
	  if(code == 0 || code == 10){ //통과o
			$('.email_input_local:eq('+line+')').css('border','1px solid #3885ca');
			$('.join_err_msg:eq('+msg+')').css('visibility','visible')
								   .text(desc)
								   .css('color','#3885ca');
			return true;
			
		} else { // 통과x
			$('.email_input_local:eq('+line+')').css('border','1px solid #f24443');
			// 테두리 색생변경
			$('.join_err_msg:eq('+msg+')').css('visibility','visible')
								   .text(desc)
								   .css('color','#f24443');
			// 에러메세지 출력
			return false;
		}
	}
	 		
	// 이메일 직접입력	
	
	$('.selboxDirect').hide();
	
	

	// 아이디 유효성 체크 
	$('#uid').keyup(function () {
		// 사용자가 입력한 값의 좌우여백을 제거하고 id에 입력
			var id = $(this).val().trim(); // 사용자가 입력한 값
			//validate.js의 checkId로 유효성 체크fmf 실행 후
			// 결과를 result에 담음(code, desc)

			var result = joinvalidate.checkid(id);
			console.log(result.code+","+result.desc);
			// 유효성 체크 결과로 테두리 색과 err메세지를 출력하는 
			// 함수 실행 

			if(result.code == 0){
				checkArr[0] = true;
			} else {
				checkArr[0] = false;
			}
			// printCheckArr(checkArr); 확인용도
			// 유효성체크 결과로 테두리색과 err 메세지를 출력하는 함수 실행
			ckDesign(result.code, result.desc,0, 0);
	 });

	//비밀번호 유효성 체크 

	$('#upw').keyup(function() {
		
		//1. 사용자가 입력한 값 받기
		//.trim()의 또다른 사용 방법
		var pw = $.trim($(this).val());
	    var rpw = $('#urpw').val().trim();
	    
	    //2. 유효성 체크하기
	    var result = joinvalidate.checkpw(pw, rpw);
	    // console.log(result.code="," + result.desc);

	    if (result.code == 0 || result.code == 10) {
	    	pwFlag = true;
	    	ckDesign(result.code, result.desc, 2, 1);
	    } else if(result.code == 6){
	    	pwFlag = true;
	    	ckDesign(result.code, result.desc, 2, 2);
	    } else {
	    	pwFlag = false;
	    	ckDesign(result.code, result.desc, 2, 1);
	    }  if(result.code == 10){
	    	checkArr[1] = true;		
		    $('.user_sign_up_form_group_input:eq(2)').css('border','1px solid #3885ca');
	    } else {
	    	checkArr[1] = false;
	    }
	   
	});

	// 비밀번호 재확인 유효성 체크 

	$('#urpw').keyup(function(){
		var pw = $.trim($('#upw').val());
		var rpw = $.trim($('#urpw').val());
	
		var result = joinvalidate.checkRpw(pw, rpw, pwFlag);
		console.log(result.code+","+result.desc);

		if(result.code == 10){
			checkArr[1] = true;
			$('.user_sign_up_form_group_input:eq(3)').css('border','1px solid #3885ca');
		} else if(result.code == 6){
			checkArr[1] = false;
			$('.user_sign_up_form_group_input:eq(3)').css('border','1px solid red');
		}
		ckDesign(result.code, result.desc, 3, 2);
	});

	// 이름 유효성체크
	$('#uname').keyup(function(){
		var name = $(this).val().trim();
		ckName(name);
		console.log(name); // 꼭 확인하고 넘어가기
		$('.cnt').text(name.length);
		
	});
	
	function ckName(name) {

		var result = joinvalidate.checkName(name);
		 console.log("이름코드" + result.code);
		if(result.code == 0){
			checkArr[2] = true;
		} else {
			checkArr[2] = false;
		}
		printCheckArr(checkArr);
		ckDesign(result.code, result.desc, 4,3);
	}
			
	// 이름 카운트
		

	// 전화번호 유효성체크
	$('#uphone').keyup(function(){
		var phone = $.trim($('#uphone').val());
		console.log(phone); 
		$('.phone_cnt').text(phone.lengh);
		ckPhone(phone);

	});
	
	function ckPhone(phone) {
		var result = joinvalidate.checkPhone(phone);
		ckDesign(result.code, result.desc, 8, 5);
		
		if(result.code == 0){
			checkArr[4] = true;
		} else {
			checkArr[4] = false;
		}
		printCheckArr(checkArr);
		
	}

	// 주소 이벤트
	// 사용자가 주소를 직접 적는 걸 막고 우편번호찾기 버튼으로 주소찾게 하기위해서
	$('.addr_only').click(function(){
		// 사용자가 우편번호 또는 주소 input을 클릭했을때!
		$('#btn_post').click();
	});
	
	// 주소를 적지않고 상세주소를 적으러 왔을때 먼저 주소를 적게 하기위해 우편번호찾기 버튼을 누르게함
	$('#sample6_detailAddress').focus(function(){
		var addrPost = $('#sample6_postcode').val();
		if(addrPost == '' || addrPost == 0){
			// $('#btn_post').click();
		}
	});
	
	// 주소 유효성체크
	$('#sample6_detailAddress').keyup(function(){ //keyup : 키보드로 입력할때 마다 
		var addr2 = $.trim($(this).val());
		var postcode = $('#sample6_postcode').val();
		ckAddr(postcode, addr2)
	
	});
	function ckAddr(postcode, addr2) {
		var result = joinvalidate.checkAddr(addr2, postcode); // 유효성 체크 	
		if(result.code == 3){ // 우편번호&주소x
			checkArr[3] = false;
			ckDesign(result.code, result.desc, 5,4);
		} else if(result.code == 0){ // 성공
			checkArr[3] = true;
			ckDesign(result.code, result.desc, 4,4);
			ckDesign(result.code, result.desc, 5,4);
			ckDesign(result.code, result.desc, 6,4);
		} else { // 상세주소 통과x한 모든경우
			checkArr[3] = false;
			ckDesign(result.code, result.desc, 6,4);
		}
		printCheckArr(checkArr);
	}

	//버튼 활성화!
	$('.int_log').keyup(function(){
		
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

	//회원가입 버튼 클릭!
	$('#btn_join').click(function(){
		var invalidAll = true;
		for(var i=0; i < checkArr.length; i++){
			if(!checkArr[i]){
				invalidAll = false;
				$('.join_err_msg:eq('+i+')').css('visibility','visible')
							   .css('color','#f24443');
			} 
		}
		printCheckArr(checkArr);
		if(invalidAll){
			
			FunLoadingBarStart(); //로딩바 생성
			
			console.log(invalidAll);
			var id = $('#uid').val();
			var url = $('#umail').val();
	
			$('#emailAll').val(id+"@"+url);
			console.log($('#emailAll').val(id+"@"+url));
		
			alert('회원가입성공');
			$('#frm_member').submit();
		} else{
			console.log(invalidAll);
			alert('값을 모두 입력해주세요.');
			
		}
	});


  

		
		 
//Login 버튼 클릭시 Modal 창 Open
$(document).on('click', '.btn_agree', function() {
	$('.modal_wrap').css('display','flex');
});
		
		 		
// 개발시 사용 : 유효성 체크 전체 여부를  출력해주는 함수 (true, false)
 function printCheckArr(checkArr) {
 	for(var i=0; i < checkArr.length; i++) {
	 	console.log(i+'번지: ' + checkArr[i]); 
	 }
 }	 	

// 로딩바 출력
function FunLoadingBarStart() {
	var loadingBarImage = ''; // 가운데 띄워 줄 이미지
	loadingBarImage += "<div id='back'>";
	loadingBarImage += "<div id='loadingBar'>";
	loadingBarImage += "<i class='fas fa-spinner loading_img'></i>";
	loadingBarImage += "</div></div>";
	$('body').append(loadingBarImage);
	$('#back').css('display', 'flex');
	$('#loadingImg').show();
}

});


	

</script>
</html>