package movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		RequestDispatcher rd = request.getRequestDispatcher("/movie_view/BookCheckServlet");
		try {
			BookDAO dao = new BookDAO();

			int bookid = Integer.parseInt(request.getParameter("bookid"));
	
			System.out.println(bookid);

			dao.delete(bookid);

		} catch (Exception e) {

			e.printStackTrace();
		}
		rd.include(request, response);
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/movie_view/bookcheck.jsp");

		/*
		 * try { BookDAO dao = new BookDAO();
		 * 
		 * int bookid = Integer.parseInt(request.getParameter("bookid"));
		 * System.out.println(bookid);
		 * 
		 * dao.delete(bookid);
		 * 
		 * } catch (Exception e) {
		 * 
		 * e.printStackTrace(); } rd.include(request, response);
		 */
	}
}
