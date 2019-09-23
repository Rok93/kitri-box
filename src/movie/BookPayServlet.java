package movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BookPayServlet extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      response.setContentType("text/html;charset=utf-8");
      request.setCharacterEncoding("utf-8");
      
      // 영화 정보 불러오기
      BookVO vo = new BookVO();

      String time = request.getParameter("movie_date") + " " + request.getParameter("time");
      String userid = request.getParameter("userid");
      int movieid = Integer.parseInt(request.getParameter("movie").split(",")[0]);
      int person = Integer.parseInt(request.getParameter("person"));
      
      String movietitle = request.getParameter("movie").split(",")[1];

      vo.setUserid(userid);
      vo.setMovieid(movieid);
      vo.setTime(time);
      vo.setPerson(person);

      request.setAttribute("movietitle", movietitle);
      request.setAttribute("book", vo);
      // 영화 정보 불러오기 끝
      
      // 할인 처리
      UserDAO udao = new UserDAO();
      int paynum = 0;
      try {
         paynum = udao.getUserPaynum(userid);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      double payment = 0;

      if (paynum > 2) {
         payment = 10000 * person * 0.95;
      } else if (paynum > 4) {
         payment = 10000 * person * 0.90;
      } else if (paynum > 6) {
         payment = 10000 * person * 0.85;
      } else if (paynum > 8) {
         payment = 10000 * person * 0.80;
      } else {
         payment = 10000 * person;
      } 
      
      request.setAttribute("payment", Double.toString(payment));
      // 할인 처리 끝
      
      // 좌석 확인
      BookDAO bdao = new BookDAO();
      String [] arrSeat = null;
      try {
         arrSeat = bdao.getSeat(movieid, time);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      request.setAttribute("seat", arrSeat);
      // 좌석 확인 끝
      
      RequestDispatcher rd = request.getRequestDispatcher("/movie_view/bookpay.jsp");
      rd.include(request, response);
   }

}