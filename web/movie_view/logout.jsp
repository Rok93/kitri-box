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
	
});
</script>
</head>
<body>
<jsp:include page="nav.jsp"/>
	<%
		session.invalidate();
	%>
	<script>
		alert('로그아웃 되었습니다');
		location.href = 'main.jsp';
	</script>
</body>
</html>