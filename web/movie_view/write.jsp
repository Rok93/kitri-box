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
<script>
	$(document).ready(function(){
	<% 
		ReviewVO vo = (ReviewVO)session.getAttribute("contents"); 
	%>
	});
</script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="jquery-3.2.1.min.js"></script>

<style>
.container {
    width: 1131px;
    margin: 0px;
}

h1, h2, h3, h4, h5, h6 {
    margin-top: 0;
    margin-bottom: 0;
}

.inform {
	width: 380px;
	margin: 4em auto;
	padding: 3em 2em 2em 2em;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
	font-size: medium;
	color: #636363;
	
}

</style>
</head>
<body>

<jsp:include page="nav.jsp"/>


    <h3>영화 리뷰</h3>
    <hr>
		<div class="inform">

			<strong>제목: </strong><%= vo.getTitle()%><br><br>
			<hr>
			<strong>내용: </strong><%= vo.getContents()%><br><br>

	</div>



</body>
</html>