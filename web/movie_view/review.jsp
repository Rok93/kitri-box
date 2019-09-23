<%@page import="movie.ReviewVO"%>
<%@page import="movie.ReviewDAO"%>
<%@page import="movie.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="jquery-3.2.1.min.js"></script>
	<script>
		$(document).ready(function(){
		<% 
			ArrayList<ReviewVO> list = (ArrayList<ReviewVO>)request.getAttribute("reviewList");
		%>
		});	
	</script>
	
	<style>
.container {
	width: 1131px;
	margin: 0px;
}

h1, h2, h3, h4, h5, h6 {
	margin-top: 0;
	margin-bottom: 0;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

table {
	border: 0;
	padding: 0;
	margin: 0;
}

table caption {
	display: none;
}

a {
	display: inline-block;
	text-decoration: none;
	vertical-align: middle;
}

textarea, .inp, a:link, a:visited, a:hover, a:active {
	color: #555555;
}

.bbsList .checkbox {
	-ms-transform: scale(1.5); /* IE */
	-moz-transform: scale(1.5); /* FF */
	-webkit-transform: scale(1.5); /* Safari and Chrome */
	-o-transform: scale(1.5); /* Opera */
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fff),
		color-stop(1, #fff));
	background: -moz-linear-gradient(center top, #fff 5%, #fff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff',
		endColorstr='#fff');
	background-color: #fff;
	text-indent: 0;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #000000;
	font-size: 10px;
	width: 10px;
	height: 10px;
	line-height: 12px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px #ffffff;
}

.bbsList .checkbox_checked {
	-ms-transform: scale(1.5);
	-moz-transform: scale(1.5);
	-webkit-transform: scale(1.5);
	-o-transform: scale(1.5);
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fff),
		color-stop(1, #fff));
	background: -moz-linear-gradient(center top, #fff 5%, #fff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff',
		endColorstr='#fff');
	background-color: #fff;
	text-indent: 0;
	border: 1px solid #ffaa89;
	display: inline-block;
	color: #ea4d10;
	font-size: 10px;
	width: 10px;
	height: 10px;
	line-height: 10px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px #ffffff;
}

.btn .txt_black {
	color: #5d5d5d;
	font-size: 12px;
	vertical-align: middle;
}

.btn {
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ededed
		), color-stop(1, #dfdfdf));
	background: -moz-linear-gradient(center top, #ededed 5%, #dfdfdf 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed',
		endColorstr='#dfdfdf');
	background-color: #ededed;
	-webkit-border-top-left-radius: 3px;
	-moz-border-radius-topleft: 3px;
	border-top-left-radius: 3px;
	-webkit-border-top-right-radius: 3px;
	-moz-border-radius-topright: 3px;
	border-top-right-radius: 3px;
	-webkit-border-bottom-right-radius: 3px;
	-moz-border-radius-bottomright: 3px;
	border-bottom-right-radius: 3px;
	-webkit-border-bottom-left-radius: 3px;
	-moz-border-radius-bottomleft: 3px;
	border-bottom-left-radius: 3px;
	text-indent: 0;
	border: 1px solid #dcdcdc;
	display: inline-block;
	color: #000000;
	padding: 5px 10px;
	margin-bottom: 8px;
	font-size: 13px;
	width: 70px;
	height: 25px;
	line-height: 25px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px #ffffff;
}

.btn:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #dfdfdf
		), color-stop(1, #ededed));
	background: -moz-linear-gradient(center top, #dfdfdf 5%, #ededed 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf',
		endColorstr='#ededed');
	background-color: #dfdfdf;
}

.btn:active {
	position: relative;
	top: 1px;
}

.viewbtn {
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	/* background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fff8f5), color-stop(1, #fff8f5) ); */
	background: -moz-linear-gradient(center top, #fff8f5 5%, #fff8f5 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff8f5',
		endColorstr='#fff8f5');
	background-color: #EDEDED;
	-webkit-border-top-left-radius: 3px;
	-moz-border-radius-topleft: 3px;
	border-top-left-radius: 3px;
	-webkit-border-top-right-radius: 3px;
	-moz-border-radius-topright: 3px;
	border-top-right-radius: 3px;
	-webkit-border-bottom-right-radius: 3px;
	-moz-border-radius-bottomright: 3px;
	border-bottom-right-radius: 3px;
	-webkit-border-bottom-left-radius: 3px;
	-moz-border-radius-bottomleft: 3px;
	border-bottom-left-radius: 3px;
	text-indent: 0;
	border: 1px solid #ccc;
	display: inline-block;
	color: #ea6310;
	font-family: arial;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 30px;
	line-height: 30px;
	width: 60px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px #ffffff;
	padding: 0 10px;
}

.viewbtn:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fff8f5
		), color-stop(1, #fff8f5));
	background: -moz-linear-gradient(center top, white 5%, white 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff8f5',
		endColorstr='#fff8f5');
	background-color: #fff8f5;
}

.viewbtn:active {
	position: relative;
	top: 1px;
}

table.type02 {
	margin-top: -100px;
	border-collapse: separate;
	border-spacing: 0;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	margin: 20px 10px;
}

table.type02 th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
	text-align: center;
}

table.type02 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	text-align: center;
}

#page {
	display: inline;
}
</style>

</head>
<body>

<jsp:include page="nav.jsp"/>

<div class="container managergrounp" id="container"  name="container" >
    <h3>영화 리뷰 </h3>
    <hr>
    <div class="right">
	<a style="width: 100px" class="viewbtn" href="reviewInsert.jsp">
	<span class="txt_org">리뷰작성</span>
	</a>
    </div>

    <table class="type02">
        <thead class="head">
        <tr>
            <th class="number">번호</th>
            <th class="title">제목</th>
            <th class="userid">작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>조회</th>
        </tr>
        </thead>
        <tbody class="body">
        <%for(int i = 0; i< list.size(); i++){%>
        <tr>
            <td class=""><%=list.get(i).getReviewid() %></td>
            <td class=""><%=list.get(i).getTitle() %></td>
            <td class=""><%=list.get(i).getUserid() %></td>
            <td class=""><%=list.get(i).getWritedate() %></td>
            <td class="txt_org"><%=list.get(i).getViewcount() %></td>
            <form action="<%= application.getContextPath() %>/movie_view/ReviewWriteServlet">
            <%
               out.println("<input type='hidden' value='" + list.get(i).getReviewid() + "' name='reviewid'>");
            %>
            <td class=""><span class="txt_org"><input type="submit" value="조회"></span></td></form>
        </tr>
		<%} %>
        </tbody>
    </table>
    <br><br><hr>
	<%
	int total = Integer.parseInt(String.valueOf(request.getAttribute("count")));
	int totalPage = total / 3;
	if(total % 3 != 0){
		totalPage++;
	}
	for(int i = 1; i <= totalPage; i++){
		%> 
		<form action="<%= application.getContextPath() %>/movie_view/ReviewServlet" id="page">
			<input type="submit" value="<%= i %>">
			<input type="hidden" value="<%= (i-1) * 3 + 1 %>" name="start">
			<input type="hidden" value="<%= request.getAttribute("movieid")%>" name="movieid">
			<input type="hidden" value="<%= request.getAttribute("count")%>" name="count">
		</form>
		<%
	}
	%>
</div>
</body>
</html>