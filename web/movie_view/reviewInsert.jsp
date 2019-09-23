<%@page import="movie.BookDAO"%>
<%@page import="movie.MovieDAO"%>
<%@page import="movie.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		  $("#return").click(function(){
		      
			   location.href="/servlettest/movie_view/main.jsp"
			   
			   });
		<%  
			BookDAO dao=new BookDAO();
			ArrayList<MovieVO> list =dao.getMovieTitleList();
	
			
			%>
	});
</script>
<style type="text/css">
form {
	width: 380px;
	margin: 4em auto;
	padding: 3em 2em 2em 2em;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
}


input {
	font-size: 18px;
	padding: 10px 10px 10px 5px;
	-webkit-appearance: none;
	display: block;
	background: #fafafa;
	color: #636363;
	width: 100%;
	border: none;
	border-radius: 0;
	border-bottom: 1px solid #757575;
}

.button {
border: solid 1px #A4A4A4;
background-color: #A4A4A4;
color: white;
}
.button:hover {
	cursor: pointer;
	
}
textarea{
width:320px;
height: 150px;
}
</style>
</head>
<body>
<jsp:include page="nav.jsp"/>
	<form action="<%= application.getContextPath() %>/movie_view/ReviewInsertServlet" method="post" >
<h3 >리뷰작성</h3><br>
	
	 <select class="book" size="1" name="movieid" required="required">
            <% 
            for(int i = 0 ; i < list.size(); i++){
               
               out.println("<option name='movieid' value= "+ list.get(i).getMovieid()+" >" + list.get(i).getTitle() + "</option>");            
         
            }
            %>
            </select> 
            <br>
	
		제목: <input type="text" name="title" required="required"><br>
		내용:<br> <textarea name="contents" required="required"></textarea><br>
		
		<input class="button" style="margin-bottom: 10px" type="submit" value="글쓰기">
		<input id="return" class="button" type="button" value="돌아가기">
	</form>
</body>
</html>