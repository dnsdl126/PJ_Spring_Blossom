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
	<div>1번 방식 겟으로 보내기</div>
	<a href = "${path}/sample/view?user=배뚱&pass=1234">GET으로 보내세요</a>  <!-- //?를 통해서 전송하는거를 쿼리스트링
	                                                                              쿼리스트링 은 변수 추가시 &로 표시후 추가  -->
	            <!-- ${path} : $이엘 태그 include.jsp 에 경로 설정을 해둠  -->
	                                                                              
	
	<br><br>
	<div>2번 방식 포스트 방식으로 보내기</div>
	<form action="${path}/sample/view" method="POST">
		<input type="text" name="user">
		<input type="password" name="pass">
		<button type="submit">POST로 보내세요~</button>
		 <!-- SamoleController 에서 Postmapping /view를 받을 때 데이터(user, pass)를 한번에 받도록  
		       SampleDTO 로 넘길꺼기 때문에 SampleDTO 에 있는 변수명과 일치해야 한다 .-->
	</form>
	
	
	<a href="${path}/sample/sync?name=배뚱아">동기방식</a>
	
	
	<button type="button" id="ajax_btn">비동기방식(AJAX)</button>
	
	<br>
	<div><span>동기: ${addr}</span></div>
	<div><span>비동기:<span id="ajax_txt"></span></span></div>	
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
			type : 'POST',
			url : '${path}/sample/ajax',
			data : {
				name : '뚱깐징어' //json 방식 
			},  //위에 값을 가지고, 컨트롤러에 다녀오셔서, 성공인지 실패인지 확인후에 아래 실행
			
			success : function(data) { // 위에 data 와 success: function(data)의 데이터 는  같은 data가 아니다 
				                       // function(data) 의 data는 SampleController 에서 return name 으로 담긴 data
				                       // return으로 데이터가 담긴 경우에 success 가 출력 가능 
				                       
				console.log(data);
				$('#ajax_txt').text(data); // text(data) 는 #ajax_txt 를 text형식으로 출력하라  
			},
			error : function() {
				alert('System ERROR :( ');
			}
		});
	});
</script>
</html>