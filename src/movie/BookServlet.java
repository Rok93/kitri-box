package movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BookServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		// 로그인 되어있는지 확인
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		if (session.getAttribute("userid") == null) {
			// 로그인 X
			out.println("<script> alert('로그인이 필요합니다'); history.back();</script>");
		} else {
			// 로그인 O
			// 영화 타이틀 가져오기
			BookDAO bdao = new BookDAO();
			ArrayList<MovieVO> list = bdao.getMovieTitleList();
			request.setAttribute("list", list);
			
			rd = request.getRequestDispatcher("/movie_view/book.jsp");
			rd.include(request, response);
		}

	}

}
