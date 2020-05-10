<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 게시판</title>
<style type="text/css">
		.test_Wrp {
			display: flex;
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
	 <div class="test_Wrp" style="margin-top: 300px;">
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
	  <c:forEach items="${list}" var ="list">
  <div class="test_Wrp_content">
  	<div class="tno_content test_css">
  		${list.tbno}
  	</div>

  	<div class="title_content test_css">
  		${list.title}
  	</div>
  	<div class="twriter_content test_css">
  		${list.twriter}
  	</div>
  	<div class="date_content test_css">
  		${list.tdate}
  	</div>
	<button type="button" id="update" data-src ="${list.tbno}">수정</button>
	 
  </div>
  
  </c:forEach>
  
   <a href="${path}/test/newwrite"> 글쓰자 </a>
</body>
<script type="text/javascript">
 
$(document).on('click', '#update', function(){
	var tbno = $(this).attr('data-src');
	console.log(tbno)
	location.href='${path}/test/update?tbno='+tbno;
	
});
 
</script>
</html>