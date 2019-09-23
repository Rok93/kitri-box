<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
            <%
            ArrayList<MovieVO> list = (ArrayList<MovieVO>)request.getAttribute("list");
            int age = (int)session.getAttribute("age");
            Date today = new Date();
            Calendar cal = Calendar.getInstance();
                   cal.setTime(today);
                   cal.add(Calendar.DATE, -1);
                   today = cal.getTime();
            int nMaxDate = 8;   // 한번에 보여 줄 최대 날짜 수
            %>

            /* 처음에 날짜 클릭 안되게 설정 */
            <%
            for(int i = 1; i <= nMaxDate; i++){
               %>
            $("#date<%=i%>").hide();
            <%
         }

         for(int i = 0; i < list.size(); i++){
         %>
            /* onClick 이벤트 부여 */
            $("#movie<%=i%>").on("click", function(){
                <%
                   int age_limit = list.get(i).getAge_limit();

                   // 영화제목 선택시 기존 날짜 클릭 해제, 날짜 전체 hide
                   for(int j = 1; j <= nMaxDate; j++){
                      %>
                $("#date<%=j%>").prop("selected",false);
                $("#date<%=j%>").hide();
                <%
             }

             if( age < age_limit){
             %>
                alert("해당 영화는 " + <%=list.get(i).getAge_limit()%> + "세 이상 시청가능합니다");
                $(this).prop("selected",false);
                <%
                }
                else {
                   // 날짜 포맷 변경
                     String time = list.get(i).getStartdate();
                   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                      Date date = sdf.parse(time);

                   sdf = new SimpleDateFormat("MM월 dd일");
                   time = sdf.format(date);

                   for(int j = 1; j <= list.get(i).getDuring(); j++){
                      // 오늘 날짜와 상영 날짜 비교해 오늘보다 이전 날짜면 출력 X
                      if(date.compareTo(today) != -1){
                         String movie_date = sdf.format(date);
                         %>
                $("#date<%=j%>").show();
                $("#date<%=j%>").html("<%=movie_date%>");
                <%
             }
                   // 1일 늘리기
                   cal = Calendar.getInstance();
                   cal.setTime(date);
                   cal.add(Calendar.DATE, 1);
                   date = cal.getTime();
          }
       }
    %>
            });
            <%
            }
            %>
        });
    </script>
    <style>
        table.type02 {
            border-collapse: separate;
            border-spacing: 0;
            text-align: left;
            line-height: 1.5;
            border-top: 1px solid #ccc;
            border-left: 1px solid #ccc;
            margin: 20px 10px;
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

        #book {
            border: solid 1px #A4A4A4;
            background-color: #A4A4A4;
            color: white;
            width: 200px;
            height: 50px;
            font-size: large;
        }

        #book:hover {
            cursor: pointer;
        }

        div.book {
            text-align: center;
            margin-left: -400px;
        }

        select.book {
            border: solid 1px white;
            width: 100%;
            text-align: center;
        }

        .book {
            cursor: pointer;
        }
    </style>


</head>
<body>
<jsp:include page="nav.jsp"/>
<form action="<%= application.getContextPath() %>/movie_view/BookPayServlet" method="post">
    <table class="type02">
        <tr>
            <th>
                영화제목
            </th>
            <th>
                날짜
            </th>
            <th>
                시간
            </th>
            <th>
                인원
            </th>
        </tr>
        <tr>
            <td>

                <select class="book" size="5" name="movie" required="required">
                    <%
                        for(int i = 0 ; i < list.size(); i++){
                            String value = list.get(i).getMovieid()+","+list.get(i).getTitle();
                            out.println("<option id='movie"+i+"' value='" + value +"'>" + list.get(i).getTitle() + "</option>");
                        }
                    %>
                </select>
            </td>
            <% out.println("<input type='hidden' name='userid' value ='" + session.getAttribute("userid") + "'>");%>
            <td>
            <span id = "date">
            <select class="book" name="movie_date" size="5" required="required">
               <%
                   for(int i = 1; i <= nMaxDate; i++){
                       out.println("<option id='date" + i + "'> </opdtion>");
                   }
               %>
            </select>
            </span>
            </td>
            <td>
                <select class="book" name="time" size ="5" required="required">
                    <option> 오후 1시</option>
                    <option> 오후 3시</option>
                    <option> 오후 5시</option>
                    <option> 오후 7시</option>
                    <option> 오후 9시</option>
                </select>
            </td>
            <td>
                <select class="book"  size="4" name="person" required="required">
                    <option> 1</option>
                    <option> 2</option>
                    <option> 3</option>
                    <option> 4</option>
                </select>
            </td>
        </tr>
    </table>
    <div class="book">
        <input class="button" type="submit" value="예매" id="book">
    </div>
</form>
</body>
</html>