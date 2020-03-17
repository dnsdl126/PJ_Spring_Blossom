<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 스크립트 립 : 자바코드를 쓸수 있게 해준다  -->
<!-- haeder 와 include 페이지가 합해진다.  -->
<%@ include file = "include.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/66fbac40f5.js" crossorigin="anonymous"></script>
<style type="text/css">
		
/*footer*/

#footer {

width: 1400px;
background-color: white;
position: relative;
margin-top: 200px;
margin: auto;


}

.footer_logo {
align-items: center;
display: flex;
}
.logo {
width: 90px;
padding: 10px;
}
.footer_logo_text {
font-weight: 900;
font-size: 15px;	  
padding: 10px;

}

.footer_logo_text_color{
color: #3D87C1;
font-weight: bold;
}

.footer_text{
padding-top: 10px;
font-size: 15px;
}

.footer_text_01{
padding-top: 10px;	
}

	</style>	
</head>
<body>
<footer>
			<div id="footer">
				<div class="footer_logo">
					<div class="logo_01"><a href="#"><img src="${path}/resources/img/clean_logo.png" class="logo"></a></div>
					<div><a href="#" class="footer_logo_text footer_logo_text_color" >개인정보 취급 방침</a></div>
					<span><div class="footer_logo_text">고객센터 : 070 - 1234 - 5678</div></span>
				</div>
				<div class="footer_text"><strong>
					(주)Blossom 사업자 정보
			    </strong></div>
			    <div class="footer_text_01">
			    	<div>
			    		<span>(주)Blossom |</span>
			    		<span> 대표자:JP.Roa |</span>
			    		<span> 사업자 번호 : 123-45-78910 |</span>
			    		<span> 개인정보보호책임자 : JP.Roa |</span>
			    		<span> 통신판매업 : 2020-광주광산A-0028 |</span>
			    	</div>
			    	<div>
			    		<span> 주소 : 광주광역시 광주구 광주동 광주로 240 - 14 |</span>
			    		<span> 이메일 : dnsdl126@gmail.com</span>
			    	</div>			    	
			    </div>				
			</div>
		</footer>
</body>
</html>