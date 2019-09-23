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
            $("#return").click(function () {
                location.href = "/movie_view/main.jsp"
            })
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
            margin: 5px;
        }
        .button:hover {
            cursor: pointer;

        }
    </style>
</head>

<body>
<jsp:include page="nav.jsp"/>
<h2 style="font-weight: normal;">회원정보수정</h2><br>
<form action="/movie_view/update" method="post">
    아이디: <input type="text" value="<%=(String)session.getAttribute("userid")%>"name="userid" readonly="readonly" ><br>
    비밀번호: <input type="password" name="pw" required="required"><br>
    이메일: <input type="email" name="email" required="required"><br>
    전화번호: <input type="tel" name="phone" required="required"  pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" placeholder="OOO-OOOO-OOOO"><br>
    나이: <input type="text" name="age" required="required"><br>
    <input class="button" type="submit" value="수정하기">
    <input class="button" id="return" type="button" value="돌아가기">
</form>
</body>
</html>