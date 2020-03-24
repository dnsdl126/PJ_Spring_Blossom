<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp"%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/66fbac40f5.js" crossorigin="anonymous"></script>
<style type="text/css">

.content {
width: 1400px;
background-color: white;
position: relative;
margin-top: 150px;
margin: auto;

}
.sub_title {
	text-align: center;
}
.sub_title_table {
color: black;
font-size: 12px;
line-height: 140%;
border-bottom: 1px solid #ddd;
border-top: 1px solid #ddd;
}
.sub_title_table_content{
font-size: 12px;
line-height: 140%;	
font-size: 12px;
}

.title{
text-align: center;
font-size: 20px;
}	

.board_content{
text-align: center;
display: flex;
justify-content: space-between;
font-size: 18px;
padding: 10px;
color: black;

}
.board_contet_list {
display: flex;
justify-content: flex-start;
align-items: center;
}

.contnt_css {
cursor: pointer;
line-height: 39px;
width: 121px;
height: 40px;
	
}
.contnt_css:hover {
	
color: #9EE6CF;   

}



 /* 게시판 테이블 */
.table_css{
width: 100%;
color: #444;
font-size: 12px;
line-height: 140%;
text-align:center;


}



table.table_css {
border:0px;
text-align: left;
line-height: 1.5;
    
}

table.table_css thead {

background: white;
   
	
}

table.table_css th {
width: 150px;
padding: 10px;
font-weight: bold;
vertical-align: top;
border:0;



}

table.table_css tr{
text-align: center;
border-top: solid 1px #9EE6CF;
border-bottom: solid 1px #9EE6CF;
font-size: 16px;
    background: #9EE6CF;
    color: white;

}

table.table_css tbody td {
border: 0px;
height: 55px;
font-size: 15px;
}

table.table_css tbody tr{
 text-align: center;
border-top: solid 1px #9EE6CF;
border-bottom: solid 1px #9EE6CF;
background: white;
color: black;
	}

/* 검색창 */

.board_search {
padding: 10px;
display: flex;
justify-content: center;
}
.board_search_cnt{
 font-size: 15px;
 padding: 10px;
 text-align: right;
 
}

.search_key{
margin: 0;
width: 72px;
height: 28px;
padding: 2px;

}
.search {
height: 28px;
padding: 3px;
width: 243px;
border: 1px solid #ddd;
color: #444;
outline: none;	
}

.board_search button{
display: inline-block;
border: 1px solid #ddd;
line-height: 27px;
height: 29px;
padding: 0px 12px;
vertical-align: middle;
cursor: pointer;

}
.return{
display: inline-block;
border: 1px solid #ddd;
line-height: 27px;
height: 29px;
padding: 0px 12px;
vertical-align: middle;
font-size: 13px;
}
.return:hover{
color: white;
background: #9EE6CF;
outline: none;
}

.board_search button:hover {
color: white;
background: #9EE6CF;
outline: none;
}

.subject {
 cursor: pointer;
}
.file_icon {
   
   font-size: 12px;

}


/*페이지 이동 */
/* Pagination links */

.pagination {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}



.pagination a {
color: black;
float: left;
padding: 8px 16px;
text-decoration: none;
transition: background-color .3s;
}

/* Style the active/current link */
.pagination a.active {

}

/* Add a grey background color on mouse-over */
.pagination a:hover:not(.active) {color:   #3D87C1; }



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


.twincle_eff {
	animation-name: twinkle;
	animation-duration: 1.2s;
	animation-iteration-count: infinite; 
}
@keyframes twinkle {
	0%{ opacity: 0; }
	100%{ opacity: 1; }
}

.new_color{
border: 1px solid tomato;
color: tomato;
padding: 3px 5px;
margin-left: 7px;
font-weight: bold;
font-size: 12px;
}

#check_color{
background-color:#9EE6CF;
color:white;

}


</style>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/> 
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
 	<div class="content">
		<div class="sub_title">
			<h1>자유게시판</h1>
		</div>
		<div class="sub_title_table">
			<div class="title">
				<h1 style="margin-top: 44px">
					FAQ
				</h1>
			</div>
			<div class="board_content">
				<div class="board_contet_list">
					<a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" id ="sort_new" class="content_01 contnt_css">최신순</a>
					<a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" id ="sort_cnt" class="content_01 contnt_css">조회순</a>
					<a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" id ="sort_reply" class="content_01 contnt_css">댓글순</a>
					<a href="${path}/board/list?sort_option=good&keyword=${map.keyword}" id ="sort_good" class="content_01 contnt_css">추천순</a>
				</div>
				
				<div class="board_search">
					<p>				
					<form action="${path}/board/list" method="GET">
						<input type="text" name="keyword" class="search" placeholder="검색하세요" value="${map.keyword}">
						<button type="submit" >search</button>
						<a href="${path}/board/list" class=return>return</a>
					</form>	
					</p>
				</div>
			</div>
			<!-- 검색결과 알림 출력 -->
			<c:if test="${!empty map.keyword }">
				<div class = "board_search_cnt">
					<span style='color:tomato '>"${map.keyword}"</span> 검색결과 <span style='color:tomato'><strong>"${map.count}"</strong></span>건 검색되었습니다.
				</div>
			</c:if>
		</div>
		<div class="boardList">
			<table border="1"  class="table_css" style=" border-collapse: collapse">
			  <thead class="thead">			   
					<tr style="">
						<th scope="co1" style="width: 184px">no</th>	
						<th scope="co1" style="width: 508px">subject</th>
						<th scope="co1" style="width: 220px">writer</th>
						<th scope="co1" style="width: 113px">date</th>
						<th scope="co1" style="width: 87px">coment</th>
						<th scope="co1" style="width: 87px">like</th>
						<th scope="co1" style="width: 124px">file</th>
					</tr>
			   </thead>	
			   <c:forEach items="${map.list}" var="list"> 
			      
			   	  <fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
				   <tbody class="table_body">
				   	 <tr>
				   	 	<td>${list.bno}</td>
				   	 	<td><a href="${path}/board/view/${list.bno}" class="subject">${list.title}</a>
					   	 	  <c:if test="${today == regdate}">
					   	 	  	<span class="new_color twincle_eff">N</span>
					   	 	  </c:if>	
				   	 	</td>			   	 	
				   	 	<td>${list.writer}</td>
				   	 	<td>
				   	 	<c:choose>
					   	 	<c:when test="${today == regdate}" >
					   	 		<fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>
					   	 	</c:when>
					   	 	<c:otherwise>
					   	 		<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd"/>
					   	 	</c:otherwise>
					   	 	
				   	 	</c:choose>
				   	 	</td>
				   	 	<td>${list.replycnt}</td>
				   	 	<td>${list.goodcnt}</td>
				   	 	<td><i class="far fa-folder"></i></td>
				   	 </tr>
			   	 				
			   </tbody>	
			   </c:forEach>			   	
			</table>
		</div>
		
			<div class="pagination">
				<c:if test="${map.pager.curBlock > 1}">
				     <a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_left" style="background: white">&laquo;</a>
					 <a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">1</a>
					 <span>...</span>
				</c:if>
				
			
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					  <a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="no_color" id="check_color">${num}</a>
					</c:when>
					<c:otherwise>
					  <a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a>
					</c:otherwise>			  
				</c:choose>	
				</c:forEach>	
				
				
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<span>...</span>
					<a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">${map.pager.totPage}</a>
					<a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}"  class="page_right" style="background: white">&raquo;</a>
				</c:if>  
			</div>
		
		
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


$(function(){
	var sort_option = '${map.sort_option}';
	
		
	if(sort_option == 'new') {
		$('#sort_new').css('color','#9EE6CF');
	 } else if (sort_option == 'cnt'){
		 $('#sort_cnt').css('color','#9EE6CF');
	 } else if (sort_option == 'reply'){
		 $('#sort_reply').css('color','#9EE6CF');
	 }else if (sort_option == 'good'){
		 $('#sort_good').css('color','#9EE6CF');
	 }
	 
	
	
});

	
 
 
</script>
</html>