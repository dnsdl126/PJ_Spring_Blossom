<%@ include file = "../include/header.jsp"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
</head>
<body>
<div class="text_test" style="margin-top: 150px;">테스트 </div>
	<script type="text/javascript" src="${path}/resources/smarteaditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<textarea class="text_box board_content_wrap_list_box"  id="board_textbox_area" name="board_textbox_name"> 
	</textarea>	
</body>

<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "board_textbox_area",
		 sSkinURI: "${path}/resources/smarteaditor/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
		});
	</script>
</html>