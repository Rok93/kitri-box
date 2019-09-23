package movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewInsertServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		ReviewVO vo = new ReviewVO();

		int movieid = Integer.parseInt(request.getParameter("movieid"));
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		System.out.println(userid);
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");

		System.out.println(movieid);

		vo.setMovieid(movieid);
		vo.setUserid(userid);
		vo.setTitle(title);
		vo.setContents(contents);

		ReviewDAO dao = new ReviewDAO();

		try {
			dao.insertReview(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("all", true);
		// 리뷰 작성 시 전체 조회하기 위해 movieid = null
		RequestDispatcher rd = request.getRequestDispatcher("/movie_view/ReviewServlet");

		rd.include(request, response);

	}

}
