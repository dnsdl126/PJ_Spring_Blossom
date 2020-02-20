<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "include/include.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>
	<a href = "${path}/sample/view?user=배뚱%pass=1234">GET으로 보내세요</a>
	
	<form action="${path}/sample/view" method="POST">
		<input type="text" name="user">
		<input type="password" name="pass">
		<button type="submit">POST로 보내세요~</button>
	</form>
	
	
	<img src="${path}/resources/img/mogonwhaf.png" style="withe: 500px; height: 500px;">	
	<a href="${path}/sample/sync?name=배뚱아">동기방식</a>
	<button type="button" id="ajax_btn">비동기방식(AJAX)</button>
	
	<br>
	<div><span>동기: ${name}</span></div>
	<div><span>비동기:<span class="ajax_txt"></span></span></div>	
</body>
<script type="text/javascript">

	$('#ajax_btn').on('click', function(){
	// type: GET or POST
	// URL: 서버단 목적지 (RequestMapping 으로 받는 요청)
	//contentType: 서버단으로 전송하는 데이터 타입 
	// dataType: 서버단에서 view단으로 전송하는 데이터 타입
	// success: AJAX 성공했을때 작업 (data: AJAX 서버단 Return 값)
	//aJAX는 인덱스 페이지로 갔다가 다시 돌아온다  돌아오지 않을 경우 ERROR 
	// error : AJAX실패했을때 작업 
	// Json = {Key:value, Key:value, Key:value}
	

	$.ajax({
		type: 'post',
		url: '${path}/sample/ajax?name=뚱깐징어',		
		/*data : {name: '뚱깐징어'},*/
		
		success: function(data) {
			console.log(data);
			$('.ajax_txt').text(data);
			
		},
		error: function() {
			alert('System ERROR :(');
		}			
	 });
	});
</script>
</html>