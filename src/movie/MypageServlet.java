package movie;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;



public class MypageServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8"); 
	
		RequestDispatcher rd = request.getRequestDispatcher("/movie_view/mypage.jsp");
	
		try {
			UserDAO dao=new UserDAO();
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("userid");
			UserVO vo=dao.getUserInfo(id);
			request.setAttribute("vo", vo);
	
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		rd.include(request, response);
		
	
	
	}

}
