<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="jquery-3.2.1.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#frame2").hide();
            $("#mypage").click(function(){
                $("#realmypage").submit();
            });
            $('[data-toggle="tooltip"]').tooltip();
            $("#frame2").hide();
            $("#frame3").hide();
            var count = 0;
            $('#next').on("click",function(){
                count++;
                if(count==1){
                    $("#frame1").hide();
                    $("#frame2").show();
                    $("#frame3").hide();
                }
                else if(count ==2){
                    $("#frame1").hide();
                    $("#frame2").hide();
                    $("#frame3").show();
                }
                else{
                    $("#frame1").show();
                    $("#frame2").hide();
                    $("#frame3").hide();
                    count=0;
                }
            });

            $('#prev').on("click",function(){
                count--;
                if(count==1){
                    $("#frame1").hide();
                    $("#frame3").show();
                    $("#frame2").hide();
                }
                else if(count ==2){
                    $("#frame1").hide();
                    $("#frame3").hide();
                    $("#frame2").show();
                }
                else{
                    $("#frame1").show();
                    $("#frame2").hide();
                    $("#frame3").hide();
                    count = 3;
                }
            });


        });
    </script>

    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 200px;
            margin: auto;
        }

        #video{
            width: 510px;
            align: center;
            margin: auto;
        }

    </style>

</head>
<body>

<%
    /* session.setAttribute("userID", "ID"); */
    String userID = null;
    if(session.getAttribute("userid") != null){
        userID = (String) session.getAttribute("userid");
    }
%>
<jsp:include page="nav.jsp"/>
<div class="container">
    <div class="row" >
        <h1>상영영화</h1>
    </div>
</div>

<div id="carousel-example-generic" data-interval="false" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active" >
            <img src="https://movie-simg.yes24.com/NYes24/MOVIE/M90/M52/M00006905255_91952.jpg"  alt="..."  >

            <div class="carousel-caption">
                <p>엑시트</p>
            </div>
        </div>

        <div class="item">
            <img src="https://img1.daumcdn.net/thumb/C155x225/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F7edca4ff46854f099d33b6a804ade7941561426442085"
                 alt="..."  >
            <div class="carousel-caption">
                <p>lion</p>
            </div>
        </div>

        <div class="item">
            <img src="http://img.sbs.co.kr/newsnet/etv/upload/2019/07/24/30000631411_700.jpg"
                 alt="..."  >
            <div class="carousel-caption">
                <p>angry</p>
            </div>
        </div>

    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" id ="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" id="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<hr>
<div class="container">
    <div class="row" >
        <h3>예고편</h3>
    </div>
</div>

<div id="video">
    <iframe id="frame1" width="500" height="360" src="https://www.youtube.com/embed/li4jOV5j7SI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe id = "frame2" width="500" height="360" src="https://www.youtube.com/embed/lfV0rOOV23U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe id = "frame3" width="640" height="360" src="https://www.youtube.com/embed/SC8uFkGlyww" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
</body>
</html>