
<%@page import="movie.BookVO"%>
<%@page import="movie.MovieVO"%>

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

        $(document).ready(function() {
            <%
            // 정보 받아오기
            String movieid = (String) request.getAttribute("movieid");
            String time = (String) request.getAttribute("time");
            BookVO vo = (BookVO) request.getAttribute("book");
            application.setAttribute("book", vo);
            String movietitle = (String) request.getAttribute("movietitle");
            %>
            $(":submit").on("click", function(e) {
                if ($("input:checked").length != <%=vo.getPerson()%>)
                {
                    alert("인원이 맞지 않습니다.");
                    e.preventDefault();
                }
            });

            //var countchecked = $("input:checked").length;
            $(":checkbox").on("click", function() {
                var countchecked = $("input:checked").length;
                $("#a").html(countchecked);
                if (countchecked > <%=vo.getPerson()%>) {
                    alert("인원초과!");
                    $("input").prop("checked", false);
                    $("#a").html(0);
                }
            });

            <%// 예매된 좌석 비활성화
            String[] arrSeat = (String[]) request.getAttribute("seat");
            for (int i = 0; i < arrSeat.length; i++) {
               System.out.print(arrSeat[i]+ " ");
            %>
            $("#<%=arrSeat[i]%>").attr("disabled", "disabled");
            $("#<%=arrSeat[i]%>").addClass("css-label-red");
            $("#<%=arrSeat[i]%>").removeClass("css-label");
            $("#<%=arrSeat[i]%>").next().addClass("css-label-red"); //라벨
            $("#<%=arrSeat[i]%>").next().removeClass("css-label"); //라벨
            <%
            }
            %>
        });


    </script>

    <style type="text/css">
        .inform {
            width: 380px;
            margin: 4em auto;
            padding: 3em 2em 2em 2em;
            background: #fafafa;
            border: 1px solid #ebebeb;
            box-shadow: rgba(0, 0, 0, 0.14902) 0px 1px 1px 0px,
            rgba(0, 0, 0, 0.09804) 0px 1px 2px 0px;
            font-size: medium;
            color: #636363;
        }

        h3 {
            text-align: center
        }

        .checkbox.custom {
            float: left;
            margin: 0;
            padding: 0;
            display: block;
            width: 100%;
            margin-bottom: 20px;
        }

        input[type=checkbox].css-checkbox {
            position: absolute;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            height: 1px;
            width: 1px;
            margin: -1px;
            padding: 0px;
            border: 0;
        }

        input[type=checkbox].css-checkbox+label.css-label-green,
        input[type=checkbox].css-checkbox+label.css-label-red,
        input[type=checkbox].css-checkbox+label.css-label-yellow,
        input[type=checkbox].css-checkbox+label.css-label,
        input[type=checkbox].css-checkbox+label.css-label-purple {
            height: 65px;
            width: 65px;
            display: inline-block;
            line-height: 68px;
            background-repeat: no-repeat;
            background-position: 0 0;
            font-size: 25px;
            vertical-align: middle;
            cursor: pointer;
            opacity: 1;
        }

        input[type=checkbox].css-checkbox+label.css-label-green:hover,
        input[type=checkbox].css-checkbox+label.css-label-yellow:hover,
        input[type=checkbox].css-checkbox+label.css-label:hover,
        input[type=checkbox].css-checkbox+label.css-label-purple:hover
        {
            opacity: 0.5;
        }

        input[type=checkbox].css-checkbox:checked+label.css-label-green,
        input[type=checkbox].css-checkbox:checked+label.css-label-yellow,
        input[type=checkbox].css-checkbox:checked+label.css-label,
        input[type=checkbox].css-checkbox:checked+label.css-label-purple
        {
            background-position: 0 -66px;
        }

        .css-label-green {
            background-image: url(http://codeopus.net/file/blog/check1.png);
        }

        .css-label-red {
            background-image: url(http://codeopus.net/file/blog/check2.png);
        }

        .css-label-yellow {
            background-image: url(http://codeopus.net/file/blog/check3.png);
        }

        .css-label {
            background-image: url(http://codeopus.net/file/blog/check4.png);
        }

        .css-label-purple {
            background-image: url(http://codeopus.net/file/blog/check5.png);
        }

        #seatdiv {
            text-align: center;
        }

        .button {
            border: solid 1px #A4A4A4;
            background-color: #A4A4A4;
            color: white;
            margin: 5px;
            padding: 5px;
            display: inline;
            font-size: large;
        }

        #a{
            color: black;
        }
    </style>
</head>
<body>

<jsp:include page="nav.jsp" />


<div class="inform">
    <h3>예매정보</h3>
    <br>
    <%
        double payment = Double.parseDouble((String) (request.getAttribute("payment")));
        out.println("<strong>영화제목: </strong>" + movietitle + "<br><br>");
        out.println("<strong>상영일시: </strong>" + vo.getTime() + "<br><br>");
        out.println("<strong>관람인원: </strong>" + vo.getPerson() + "명<br><br>");
        out.println("<strong>결제금액: </strong>" + Math.round(payment) + "<br><br>");
    %>

</div>

<div id=seatdiv>
    <h3>좌석 선택</h3>
    <h2>Screen</h2>
    <form action="<%=application.getContextPath()%>/movie_view/BookResultServlet" method="post">

        <input type="checkbox" class = "css-checkbox" value=A1 name="seat" id="A1">
        <label class="css-label" for="A1">A1</label>
        <input type="checkbox" class = "css-checkbox" value=A2 name="seat" id="A2">
        <label class="css-label" for="A2">A2</label>
        <input type="checkbox" class = "css-checkbox" value=A3 name="seat" id="A3">
        <label class="css-label" for="A3">A3</label>
        <input type="checkbox" class = "css-checkbox" value=A4 name="seat" id="A4">
        <label class="css-label" for="A4">A4</label>
        <input type="checkbox" class = "css-checkbox" value=A5 name="seat" id="A5">
        <label class="css-label" for="A5">A5</label>
        <input type="checkbox" class = "css-checkbox" value=A6 name="seat" id="A6">
        <label class="css-label" for="A6">A6</label>
        <input type="checkbox" class = "css-checkbox" value=A7 name="seat" id="A7">
        <label class="css-label" for="A7">A7</label>
        <br>
        <input type="checkbox" class = "css-checkbox" value=B1 name="seat" id="B1">
        <label class="css-label" for="B1">B1</label>
        <input type="checkbox" class = "css-checkbox" value=B2 name="seat" id="B2">
        <label class="css-label" for="B2">B2</label>
        <input type="checkbox" class = "css-checkbox" value=B3 name="seat" id="B3">
        <label class="css-label" for="B3">B3</label>
        <input type="checkbox" class = "css-checkbox" value=B4 name="seat" id="B4">
        <label class="css-label" for="B4">B4</label>
        <input type="checkbox" class = "css-checkbox" value=B5 name="seat" id="B5">
        <label class="css-label" for="B5">B5</label>
        <input type="checkbox" class = "css-checkbox" value=B6 name="seat" id="B6">
        <label class="css-label" for="B6">B6</label>
        <input type="checkbox" class = "css-checkbox" value=B7 name="seat" id="B7">
        <label class="css-label" for="B7">B7</label>
        <br>
        <input type="checkbox" class = "css-checkbox" value=C1 name="seat" id="C1">
        <label class="css-label" for="C1">C1</label>
        <input type="checkbox" class = "css-checkbox" value=C2 name="seat" id="C2">
        <label class="css-label" for="C2">C2</label>
        <input type="checkbox" class = "css-checkbox" value=C3 name="seat" id="C3">
        <label class="css-label" for="C3">C3</label>
        <input type="checkbox" class = "css-checkbox" value=C4 name="seat" id="C4">
        <label class="css-label" for="C4">C4</label>
        <input type="checkbox" class = "css-checkbox" value=C5 name="seat" id="C5">
        <label class="css-label" for="C5">C5</label>
        <input type="checkbox" class = "css-checkbox" value=C6 name="seat" id="C6">
        <label class="css-label" for="C6">C6</label>
        <input type="checkbox" class = "css-checkbox" value=C7 name="seat" id="C7">
        <label class="css-label" for="C7">C7</label>
        <br>
        <input type="checkbox" class = "css-checkbox" value=D1 name="seat" id="D1">
        <label class="css-label" for="D1">D1</label>
        <input type="checkbox" class = "css-checkbox" value=D2 name="seat" id="D2">
        <label class="css-label" for="D2">D2</label>
        <input type="checkbox" class = "css-checkbox" value=D3 name="seat" id="D3">
        <label class="css-label" for="D3">D3</label>
        <input type="checkbox" class = "css-checkbox" value=D4 name="seat" id="D4">
        <label class="css-label" for="D4">D4</label>
        <input type="checkbox" class = "css-checkbox" value=D5 name="seat" id="D5">
        <label class="css-label" for="D5">D5</label>
        <input type="checkbox" class = "css-checkbox" value=D6 name="seat" id="D6">
        <label class="css-label" for="D6">D6</label>
        <input type="checkbox" class = "css-checkbox" value=D7 name="seat" id="D7">
        <label class="css-label" for="D7">D7</label>

        <br>
        <br>
        <h3>
            인원: <a id="a"> 0 </a> / <%=vo.getPerson()%>
        </h3>
        <input class="button" type="submit" value="결제하기" id="forward">
    </form>
</div>
</body>
</html>