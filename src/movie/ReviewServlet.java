package movie;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8"); 
		
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		
		ReviewDAO dao = new ReviewDAO();
		String movieid = request.getParameter("movieid");
		String count = request.getParameter("count");
		String start = request.getParameter("start");
		int nCount = 0;
		if(count != null) {
			nCount = Integer.parseInt(count);
		}
		
		// ReviewInsertServlet.java 에서 넘어온건지 확인
		if(request.getAttribute("all") != null && (Boolean)request.getAttribute("all")) {
			movieid = null;
		}
	
		// 초기 화면
		if(count == null && start == null) {
			try {
				nCount = dao.getReviewCount(movieid);
				request.setAttribute("count", nCount);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				list = dao.getReview(movieid, 1, 3);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			int start2 = Integer.parseInt(start);
			int end = start2 + 2;	
			try {
				list = dao.getReview(movieid, start2, end);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		request.setAttribute("movieid", movieid);
		request.setAttribute("count", nCount);	
		request.setAttribute("reviewList", list);

		RequestDispatcher rd = request.getRequestDispatcher("/movie_view/review.jsp");
		rd.include(request, response);
	}
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
