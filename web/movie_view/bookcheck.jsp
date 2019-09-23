<%@page import="java.util.ArrayList" %>
<%@ page import="movie.BookInfoVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="jquery-3.2.1.min.js"></script>
<script>
    $(document).ready(function(){
        $(".cancle").submit(function(){
            var check_submit=confirm("예매를 취소하시겠습니까?");
            return check_submit;
        });
    });
</script>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        h3 {
            text-align: center;
            border: 1px solid #ccc;
            background: #eee;
        }
        table.type02 {
            border-collapse: separate;
            border-spacing: 0;
            text-align: left;
            line-height: 1.5;
            border-top: 1px solid #ccc;
            border-left: 1px solid #ccc;
            margin : 20px 10px;
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
    </style>
</head>
<body>
<jsp:include page="nav.jsp" />
<h2>예매내역</h2>

<%
    ArrayList<BookInfoVO> list = (ArrayList<BookInfoVO>) session.getAttribute("list");

    out.println("<table class='type02'><tr><th scope='row'>영화제목</th>" +
            "<th scope='row'>좌석수</th>" +
            "<th scope='row'>날짜</th>" +
            "<th scope='row'>좌석번호</th>" +
            "<th scope='row'>예매취소</th>" +
            "</tr>");
    for (int i = 0; i < list.size(); i++) {

        out.println("<tr><td>");
        out.println(list.get(i).getTitle()); //영화제목
        out.println("</td><td>");
        out.println(list.get(i).getPeople()); //좌석수
        out.println("</td><td>");
        out.println(list.get(i).getTime()); //영화시간
        out.println("</td><td>");
        out.println(list.get(i).getSeat()); //좌석번호
        out.println("</td><td>");

%>
<form
        action="<%=application.getContextPath()%>/movie_view/DeleteServlet"
        method="post" class="cancle">
    <%
        out.println("<input type='submit' value='취소'>");
        out.println("<input type='hidden' name='bookid' value='" + list.get(i).getBookid() + "'>");
        out.println("</td></tr>");
    %>
</form>
<%
    }
%>
</body>
</html>