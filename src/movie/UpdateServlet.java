package movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8"); 
	
		RequestDispatcher rd = request.getRequestDispatcher("/movie_view/update.jsp");
	
		try {
			UserVO vo= new UserVO();
			UserDAO dao=new UserDAO();
			HttpSession session=request.getSession();
			String id=request.getParameter("userid");
			String pw=request.getParameter("pw");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			int age=Integer.parseInt(request.getParameter("age"));
			
			vo.setUserid(id);
			vo.setPw(pw);
			vo.setEmail(email);
			vo.setPhone(phone);
			vo.setAge(age);
			
			dao.updateUser(vo);
	
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		rd.include(request, response);
	}

}
