package movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BookResultServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		BookDAO bdao = new BookDAO();
		
		ServletContext application = getServletContext();
		BookVO vo = (BookVO)application.getAttribute("book");

		// 선택한 좌석 vo.setSeat
		String [] arrSeat = request.getParameterValues("seat");
		String seat = "";
		
		for(int i = 0; i < arrSeat.length; i++){
			seat += (arrSeat[i] + " ");
		}
		
		vo.setSeat(seat);
		
		
		String result = bdao.insertBook(vo);
		request.setAttribute("result", result);
		RequestDispatcher rd = request.getRequestDispatcher("/movie_view/bookresult.jsp");
        rd.include(request, response);
	}
	
}
