<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script>
        $(document).ready(function(){
            $("#mypage").click(function(){

                $("#realmypage").submit();

            });
        });
    </script>
</head>
<body>
<%
    /* session.setAttribute("userID", "ID"); */
    String userID = null;
    if(session.getAttribute("userid") != null){
        userID = (String) session.getAttribute("userid");
    }
%>

<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expanded ="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<%= application.getContextPath() %>/movie_view/main.jsp">메인페이지</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="active"><a href="<%= application.getContextPath() %>/movie_view/MovieChartServlet">무비차트</a></li>
            <li><a href="<%= application.getContextPath() %>/movie_view/BookServlet">예매</a></li>
            <li><a href="<%= application.getContextPath() %>/movie_view/ReviewServlet">리뷰</a></li>
        </ul>
        <%
            if (userID == null ) {
        %>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">접속하기<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="login.jsp">로그인</a></li>
                    <li><a href="signin.jsp">회원가입</a></li>
                </ul>
            </li>
        </ul>
        <% }else{ %>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">나의정보<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <form id="realmypage" action="<%= application.getContextPath() %>/movie_view/mypage" method="post">
                        <input type="submit" value="마이페이지" hidden="true">
                    </form>
                    <li id="mypage"><a>마이페이지</a></li>
                    <li><a href="<%= application.getContextPath() %>/movie_view/logout.jsp">로그아웃</a></li>
                </ul>
            </li>
        </ul>
        <% } %>
    </div>
</nav>
</body>
</html>