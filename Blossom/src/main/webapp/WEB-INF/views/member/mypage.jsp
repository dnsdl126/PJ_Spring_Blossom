<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
  
<%@ include file = "../include/include.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>my page</title>
	<link rel="stylesheet" type="text/css" href="../../css/common.css">
   <script src="https://kit.fontawesome.com/66fbac40f5.js" crossorigin="anonymous"></script>
   <style type="text/css">
    .mypage_wrap {
	width: 655px;
    height: 418px;
    margin: auto;
    border: solid 1px #e5e5e5;
    padding: 77px;
   margin-top: 50px;
}
 }  
 .mypage_content {
 
 width: 41%;
 border: solid 1px #9EE6CF; 
 height: 88%;
 margin: auto;
 border-radius: 5px;


 }
 .mypage_box{
 font-size: 20px;
 text-align: center;
 line-height: 55px;
 background: #9EE6CF;
 color: white;
 height: 20%;

 }
 
 .mypage_content_img{
  
  margin: auto;
  height: 80%;
  background-repeat: no-repeat;
  align-items: center;
  justify-content: center;

}
.content_img {
  width: 100%;
  height: 100%;
}

.mypage_info_wrap{
height: 72%;
padding: 16px;
}

.mypage_ifno{
width: 278px;
height: 30px;
font-size: 15px;
margin: auto;
border-bottom: dashed 3px #9EE6CF;
}

.position {
	width: 100%;
	height: 78%;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}
.button{
	display: flex;
    justify-content: space-between;
    margin-top: 56px;
    text-align: center;
    line-height: 2.5;
}
.button_box{
    border: none;   
    width: 130px;
    height: 40px;
    border-radius: 4px;
    cursor: pointer;
    text-decoration: none;
    background-color : #e5e5e5;
    t
}
.button_box:hover {

	border: solid 1px  #1F8AD8;
}

.button_box:visited {
	text-decoration: none;
	color : black;
}


   </style>
   
</head>
<body>
 <div class="mypage_wrap">
	 	<div class="position">
		 	<div class="mypage_content" style="width: 39%; border: solid 1px #9EE6CF; ">
		 		<div class="mypage_box">
		 			my page
		 		</div>
		 		<div class="mypage_content_img">
		 			<img src="${path}/resources/img/moomin.PNG" class = "content_img">
		 		</div>		
		 	</div>
		 	
		 	<form class="mypage_info_wrap" style=" margin-top: 51px;" >
		 	  <div class="mypage_ifno" style="display: flex; margin-top: 10px;">
		 	  	 <strong><div class="name" style="margin-right: 5px;"> 아이디/이메일 :</div></strong>
		 	  	 <div class="name_info" style="margin-left: 5px;"> ${user.email}</div>
		 	  </div>
		 	   <div class="mypage_ifno" style="display: flex; margin-top: 10px;">
		 	  	 <strong><div class="name" style="margin-right: 5px;"> 이름 :</div></strong>
		 	  	 <div class="name_info" style="margin-left: 5px;"> ${user.name}</div>
		 	  </div>
		 	   <div class="mypage_ifno" style="display: flex; margin-top: 10px;">
		 	  	 <strong><div class="name" style="margin-right: 5px;"> 연락처 :</div></strong>
		 	  	 <div class="name_info" style="margin-left: 5px;"> ${user.phone}</div>
		 	  </div>
		 	   <div class="mypage_ifno" style="display: flex; margin-top: 10px;">
		 	  	 <strong><div class="name" style="margin-right: 5px;"> 주소 :</div></strong>
		 	  	 <div class="name_info" style="margin-left: 5px;"> ${user.addr1}</div>
		 	  </div>
		  	</form>	

	  </div>	
	  <div class="button ">
	  		<a href="${path}/member/update" class="button_box constract" id = "constract">회원정보수정</a>
			<a href="${path}/member/pwupdate"  class="button_box" id = "pwupdate">비밀번호</a>
			<a href="${path}/member/drop" class="button_box" id = "drop">회원탈퇴</a>
	  </div>
 </div>
</body>
</html>