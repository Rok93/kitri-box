<%@page import="java.util.ArrayList"%>
<%@page import="movie.UserDAO"%>
<%@page import="movie.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="jquery-3.2.1.min.js"></script>
    <style type="text/css">

        #inform {
            width: 380px;
            margin:auto;
            padding: 3em 2em 2em 2em;
            background: #fafafa;
            border: 1px solid #ebebeb;
            box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
            font-size: 18px;
            padding: 10px 10px 10px 5px;
            -webkit-appearance: none;
            display: block;
            background: #fafafa;
            color: #636363;

            border-bottom: 1px solid #757575;
            text-align: center;
        }




        .button {
            border: solid 1px #A4A4A4;
            background-color: #A4A4A4;
            color: white;
            margin: 5px;
            padding: 5px;
            display: inline;
        }
        .button:hover {
            cursor: pointer;

        }
        #f{
            display: inline;}

    </style>


</head>


<body>

<jsp:include page="nav.jsp"/>

<%
    request.getAttribute("vo");
%>

<h2 style="font-weight: normal;">마이페이지</h2><br>
<div id="inform">
    아이디: ${vo.userid }<br><br>
    이메일: ${vo.email }<br><br>
    연락처: ${vo.phone }<br><br>
    나이:   ${vo.age }<br><br>


    <form  id="f" action="<%= application.getContextPath() %>/movie_view/update.jsp">
        <input class="button" type="submit" value="회원 정보 수정">
    </form>
    <form id="f" action="<%= application.getContextPath() %>/movie_view/BookCheckServlet" method="post">
        <input class="button" type="submit" value="예매내역 조회">
    </form>



</div>
<script src="jquery-3.2.1.min.js"></script>
<script>
    $(document).ready(function() {

    });
</script>
</body>
</html>