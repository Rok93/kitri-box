package movie;

import java.util.*;
import java.sql.*;

public class UserDAO {

	public int login(String userid, String pw) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pt;
		int result = 0;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
			String sql = "select pw from  movie_user where userid=?";
			pt = conn.prepareStatement(sql);
			pt.setString(1, userid);
			rs = pt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).contentEquals(pw)) {
					return 1; // login successful
				} else {
					return 0; // login unsuccessful
				}
			}
			return -1; // NO id;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // db error
	}

	public void signin(UserVO vo) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pt;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
			String sql = "insert into movie_user values (?, ?, ?, ? ,?, 0)";
			pt = conn.prepareStatement(sql);
			pt.setString(1, vo.getUserid());
			pt.setString(2, vo.getPw());
			pt.setString(3, vo.getEmail());
			pt.setString(4, vo.getPhone());
			pt.setInt(5, vo.getAge());
			rs = pt.executeQuery();
			if (rs.next()) {
				System.out.println("Insertion complete");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// db error
	}

	public UserVO getUserInfo(String userid) throws Exception {
		UserVO vo = new UserVO();

		Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		String sql = "select * from movie_user where userid=?";
		con.prepareStatement(sql);
		PreparedStatement pt = con.prepareStatement(sql);
		pt.setString(1, userid);
		ResultSet rs = pt.executeQuery();
		if (rs.next() == true) {
			vo.setUserid((rs.getString("userid")));
			vo.setPw(((rs.getString("userid"))));
			vo.setEmail((rs.getString("email")));
			vo.setPhone((rs.getString("phone")));
			vo.setAge((Integer.parseInt(rs.getString("age"))));
			vo.setPaynum(((Integer.parseInt(rs.getString("paynum")))));
		}
		return vo;
	}

	public int getUserPaynum(String userid) throws Exception {
		int paynum = 0;

		Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		String sql = "select paynum from movie_user where userid=?";

		con.prepareStatement(sql);
		PreparedStatement pt = con.prepareStatement(sql);
		pt.setString(1, userid);

		ResultSet rs = pt.executeQuery();
		if (rs.next() == true) {
			paynum = rs.getInt("paynum");
		}
		return paynum;
	}

	public void updateUser(UserVO vo) throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");

		String sql = "update MOVIE_USER set pw=?, email=?, phone=?,age=? where userid=?";

		PreparedStatement pt = con.prepareStatement(sql);
		pt.setString(1, vo.getPw());
		pt.setString(2, vo.getEmail());
		pt.setString(3, vo.getPhone());
		pt.setInt(4, vo.getAge());
		pt.setString(5, vo.getUserid());

		pt.executeQuery();

	}

	public int getAge(String userid) throws Exception {

		int age = 0;

		Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		String sql = "select age from movie_user where userid=?";

		con.prepareStatement(sql);
		PreparedStatement pt = con.prepareStatement(sql);
		pt.setString(1, userid);

		ResultSet rs = pt.executeQuery();
		if (rs.next() == true) {
			age = rs.getInt("age");
		}

		return age;
	}

}