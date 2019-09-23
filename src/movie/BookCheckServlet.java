package movie;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BookCheckServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8"); 


		try {
			BookDAO dao=new BookDAO();
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("userid");

			//ArrayList<String> list= dao.getBookInfo(id);
			ArrayList<BookInfoVO> list = dao.getBookInfo(id); //BookInfo 타입으로 변환

			session.setAttribute("list",list);
		
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/movie_view/bookcheck.jsp");
		rd.include(request, response);

	}

}
