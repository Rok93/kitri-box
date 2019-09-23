package movie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        RequestDispatcher rd = request.getRequestDispatcher("/movie_view/main.jsp");
        PrintWriter out = response.getWriter();

        String userid = request.getParameter("userid");
        String pw = request.getParameter("pw");


        UserDAO dao=new UserDAO();
        int result = dao.login(userid, pw);
        System.out.println(result);
        try {
            if(result==1) {
                HttpSession session = request.getSession();
                session.setAttribute("userid", userid);
                int age = dao.getAge(userid);
                session.setAttribute("age" , age);
                out.println("<script>alert('로그인 되었습니다'); location.href = 'main.jsp';</script>");
                out.println(userid + "Welcome");
                rd.include(request, response);
            }
            else if(result == 0) {
                out.println("<script>alert('비밀번호를 확인하세요'); history.back();</script>");
            }
            else if(result == -1) {
                out.println("<script>alert('아이디가 존재하지 않습니다'); history.back();</script>");
            }
            else {
                out.println("<script>alert('데이터베이스 오류 발생'); history.back();</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}