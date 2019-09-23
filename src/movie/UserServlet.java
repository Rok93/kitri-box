package movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/user")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       
       response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    
    RequestDispatcher rd = request.getRequestDispatcher("/movie_view/main.jsp");

      UserVO vo= new UserVO();
      vo.setUserid(request.getParameter("userid"));
     
      vo.setPw(request.getParameter("pw"));
      vo.setEmail(request.getParameter("email"));
      vo.setPhone(request.getParameter("phone"));
      vo.setAge(Integer.parseInt(request.getParameter("age")));
      

      UserDAO dao = new UserDAO();
    try {
       dao.signin(vo);
       rd.include(request, response);
    } catch (Exception e) {
             e.printStackTrace();
    }
    }



}