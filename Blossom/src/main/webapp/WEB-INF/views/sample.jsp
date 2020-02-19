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
</body>
</html>