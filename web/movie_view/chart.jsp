<%@page import="movie.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .carousel-inner > .item > img {

            display: block;
            width: 200;
            height: auto;
        }

        .c{

            background-color: #E6E6E6 ;

        }
        tr{
            border: solid 1px #F2F2F2;
        }

        table{
            margin: auto;
        }

    </style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="jquery-3.2.1.min.js"></script>
<script>
    $(document).ready(function () {
        <%
           // 무비 차트 받아오기!
           ArrayList<MovieVO> list = (ArrayList<MovieVO>)request.getAttribute("list");
        %>
    });
</script>

</head>
<body>

<jsp:include page="nav.jsp"/>


<table summary="예매순위, 영화명, 총 관객수, 개봉일, 리뷰">
    <h1>무비차트</h1>
    <colgroup>
        <col width="115"/>
        <col width="160"/>
        <col width="90"/>
        <col width="120"/>
        <col width="120"/>
        <col width="90"/>
        <col width="90"/>
    </colgroup>
    <thead>
    <tr>
        <th class="c" scope="col">예매순위</th>
        <th class="c" scope="col">영화명</th>
        <th class="c" scope="col">총 관객수</th>
        <th class="c" scope="col">개봉일</th>
        <th class="c" scope="col">주연배우</th>
        <th class="c" scope="col">장르</th>
        <th class="c" scope="col">리뷰</th>
    </tr>

    </thead>
    <tbody>

    <%
        for(int i = 0; i < list.size(); i++){
            out.println("<tr>");
            out.println("<td>");
            out.println("<p>");
            out.println("<img alt='"+ list.get(i).getTitle() + "' src='" + list.get(i).getPoster() + "' onerror='javascript:this.src='" + list.get(i).getPoster() + "';' style='width:84px;height:120px;' />");
            out.println("</p>");
            out.println("</td>");
            out.println("<td style='text-align:left;'>");
            out.println("<p>" + list.get(i).getTitle() + "</p>");
            out.println(" </td>");
            out.println("<td ><strong>"+ list.get(i).getAudience_num() +"</strong>명</td>");
            out.println("<td><strong>" + list.get(i).getStartdate() + "</strong></td>");
            out.println("<td><strong>" + list.get(i).getStar() + "</strong></td>");
            out.println("<td><strong>" + list.get(i).getGenre() + "</strong></td>");
    %>
    <form action="<%= application.getContextPath() %>/movie_view/ReviewServlet">
        <%  System.out.println(list.get(i).getMovieid());
            out.println("<input type='hidden' value='" + list.get(i).getMovieid() + "' name='movieid'>");
            out.println("<td><input type='submit' value='리뷰'></td>");
        %>
    </form>
    <%
            out.println("</tr>");
        }
    %>
    </tbody>
</table>



</body>
</html>