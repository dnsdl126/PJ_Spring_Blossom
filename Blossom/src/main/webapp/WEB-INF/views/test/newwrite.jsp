<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글을 작성하세여</title>
<style type="text/css">
		.test_Wrp {
			display: flex;
			margin-top: 300px
		}
		.test_css {

			width: 180px;
			height: 25px;
			border: solid 1px black;
		}
		.test_Wrp_content {
			display: flex;
		}


	</style>
</head>
<body>
  <div class="test_Wrp">
  	<div class="tno test_css ">
  		번호 
  	</div>

  	<div class="title test_css">
  		제목
  	</div>
  	<div class="twriter test_css">
  		작성자
  	</div>
  	<div class="date test_css">
  		날짜 
  	</div>

  </div>
  <form:form id="frm_newtest" >
   <div class="test_Wrp_content">
  	<div class="tno_content test_css">
  		번호
  		
  	</div>
   		
  	<div class="title_content test_css">
  		<input type="text"  placeholder="제목을 입력하세요 " name="title" id="testtitle" value= "${one.title}">
  		<!--인풋값의 밸류는 너가 타이핑 한거야 네임은 키값이야 / 수정이잖아? 그러면 밸류에 이전값이 존재해줘야해 그래서 밸류에 ONE.TITLE 하면 너가 보낸 TBNO 값으로 값들을 입력해줘-->
  	</div>
  	<div class="twriter_content test_css">
  		<input type="text"  placeholder="작성자" name="twriter" id="testwrite" value="${one.twriter}">
  	</div>
  	<div class="date_content test_css">
  		날짜칸 
  	</div>

  </div>
  </form:form>
   <button  class="btn_success">완료 </button>
   
</body>
<script type="text/javascript">
   
     
     $(document).on('click','.btn_success' , function(){
    	  $('#frm_newtest').submit();
    	  
     });
   </script>
</html>