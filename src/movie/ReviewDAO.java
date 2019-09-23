package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ReviewDAO {

	public int getReviewCount(String movieid) throws Exception {
		int count = 0;

		Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");

		String sql1 = "select count(*) from review";
		String sql2 = "select count(*) from review where movieid = " + movieid;

		Statement st = con.createStatement();
		ResultSet rs = null;

		if (movieid == null) {
			rs = st.executeQuery(sql1);
			System.out.println(sql1);
		} else {
			rs = st.executeQuery(sql2);
			System.out.println(sql2);
		}
		if (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}

	public ArrayList<ReviewVO> getReview(String mid, int start, int end) throws Exception {

		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();

		Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");

		String sql1 = "select * from (select rownum r, movieid, userid, title, contents, reviewid, writedate, viewcount"
				+ " from(select * from review order by writedate)) where r between " + start + " and " + end;
		String sql2 = "select * from (select rownum r, movieid, userid, title, contents, reviewid, writedate, viewcount"
				+ " from(select * from review where movieid =" + mid + " order by writedate)) where r between " + start
				+ " and " + end;

		int movieid = 0;
		String userid = "";
		String title = "";
		String contents = "";
		int reviewid = 0;
		String writedate = "";
		int viewcount = 0;

		Statement st = con.createStatement();
		ResultSet rs = null;

		if (mid == null || mid.contentEquals("null")) {
			rs = st.executeQuery(sql1);
			System.out.println(sql1);
		} else {
			System.out.println(sql2);
			rs = st.executeQuery(sql2);
		}

		while (rs.next()) {
			ReviewVO vo = new ReviewVO();

			movieid = rs.getInt("movieid");
			userid = rs.getString("userid");
			title = rs.getString("title");
			contents = rs.getString("contents");
			reviewid = rs.getInt("reviewid");
			writedate = rs.getString("writedate");
			viewcount = rs.getInt("viewcount");

			vo.setMovieid(movieid);
			vo.setUserid(userid);
			vo.setTitle(title);
			vo.setContents(contents);
			vo.setReviewid(reviewid);
			vo.setWritedate(writedate);
			vo.setViewcount(viewcount);

			list.add(vo);
		}

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getTitle());
		}

		System.out.println("list크기: " + list.size());
		return list;
	}

	public void insertReview(ReviewVO vo) throws Exception {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");

			String sql1 = "insert into review values(?,?,?,?,review_seq.nextval,sysdate,0)";
			PreparedStatement pt = con.prepareStatement(sql1);
			pt.setInt(1, vo.getMovieid());
			pt.setString(2, vo.getUserid());
			pt.setString(3, vo.getTitle());
			pt.setString(4, vo.getContents());

			pt.executeQuery();
			con.close();
			System.out.println("작성 완료되었습니다.");

		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	public ReviewVO getContents(int reviewid) throws Exception {
		ResultSet rs = null;
		ReviewVO vo = new ReviewVO();
		Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");

		String sql = "select * from review where reviewid=?";
		String sql2 = "update review set viewcount = viewcount+1 where reviewid=" + reviewid;

		Statement st = con.createStatement();
		st.executeUpdate(sql2);

		PreparedStatement pt = con.prepareStatement(sql);
		pt.setInt(1, reviewid);
		rs = pt.executeQuery();
		if (rs.next()) {
			vo.setTitle(rs.getString("title"));
			vo.setContents(rs.getString("contents"));
		}

		return vo;
	}
}
