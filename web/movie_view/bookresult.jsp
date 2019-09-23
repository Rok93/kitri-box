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
		$("input").on("click", function(){
			location.href="/movie_view/main.jsp";
		})
	});
</script>
</head>
<body>
<jsp:include page="nav.jsp"/>
	<%= request.getAttribute("result")%>
	<input type="button" value="확인">
</body>
</html>