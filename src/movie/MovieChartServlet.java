package movie;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieChartServlet extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	   response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
      MovieDAO mdao = new MovieDAO();
      try {
         ArrayList<MovieVO> list = mdao.getMovieChart();
         request.setAttribute("list", list);
         
         RequestDispatcher rd = request.getRequestDispatcher("/movie_view/chart.jsp");
         rd.include(request, response);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
}