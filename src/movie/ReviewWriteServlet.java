package movie;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/ReviewServlet")
public class ReviewWriteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8"); 
		
		ReviewVO vo = new ReviewVO();
		ReviewDAO dao = new ReviewDAO();
		int reviewid = Integer.parseInt(request.getParameter("reviewid"));
		System.out.println(reviewid);
		try {
			HttpSession session=request.getSession();
			vo = dao.getContents(reviewid);
			session.setAttribute("contents", vo);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/movie_view/write.jsp");
		rd.include(request, response);
	}

}
