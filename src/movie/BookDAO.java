package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BookDAO {
    public ArrayList<MovieVO> getMovieTitleList() {

        Connection con = null;
        // jdbc계정 board테이블 전체 레코드 전체 컬럼 조회
        ArrayList<MovieVO> list = new ArrayList<MovieVO>();

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
            System.out.println("드라이버 로딩 완료");

            String sql = "select movieid, title, startdate, AGE_LIMIT, DURING from movie order by 1";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                MovieVO vo = new MovieVO();
                vo.setMovieid(rs.getInt("movieid"));
                vo.setTitle(rs.getString("title"));
                vo.setStartdate(rs.getString("startdate"));
                vo.setDuring(rs.getInt("during"));
                vo.setAge_limit(rs.getInt("age_limit"));
                list.add(vo);
            }
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public String insertBook(BookVO vo) {// jdbc계정 book테이블 insert(예매)
        String result = "";
        Connection con = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
            System.out.println("드라이버 로딩 완료");

            String sql = "insert into book values (seq_bookid.nextval, ?, ?, ?, ?, ?)";
            String sql2 = "update movie set audience_number=audience_number+? where movieid=?";

            String userid = vo.getUserid();
            PreparedStatement pt = con.prepareStatement(sql);
            pt.setString(1, userid);
            pt.setInt(2, vo.getMovieid());
            pt.setString(3, vo.getTime());
            pt.setInt(4, vo.getPerson());
            pt.setString(5, vo.getSeat());

            int movieid = vo.getMovieid();
            PreparedStatement pt2 = con.prepareStatement(sql2);
            pt2.setInt(1, vo.getPerson());
            pt2.setInt(2, movieid);

            int result1 = pt.executeUpdate();

            if (result1 == 0) {
                result = "예매 실패..";
            } else {
                result = "예매 완료!";
            }

            sql = "update movie_user set paynum=paynum+1 where userid=?";
            pt = con.prepareStatement(sql);
            pt.setString(1, userid);
            result1 = pt.executeUpdate();

            if (result1 == 0) {
                result = "예매 실패..";
            } else {
                result = "예매 완료!";
            }

            pt2.execute();
            con.close();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return result;
    }

    public ArrayList<BookInfoVO> getBookInfo(String userid) throws Exception {

        Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
        String sql = "select bookid, title, person, time, u.userid userid, seat" + " from book b,movie m, movie_user u"
                + " where u.userid=b.userid and m.movieid=b.movieid and u.userid=?";
        con.prepareStatement(sql);
        PreparedStatement pt = con.prepareStatement(sql);
        pt.setString(1, userid);
        ResultSet rs = pt.executeQuery();
        ArrayList<BookInfoVO> list = new ArrayList<>();

        while (rs.next() == true) {
            BookInfoVO bookInfo = new BookInfoVO();
            bookInfo.setTitle(rs.getString("title"));
            bookInfo.setPeople(rs.getInt("person"));
            bookInfo.setTime(rs.getString("time"));
            bookInfo.setId(rs.getString("userid"));
            bookInfo.setBookid(rs.getInt("bookid"));
            bookInfo.setSeat(rs.getString("seat"));
            list.add(bookInfo);
        }
        return list;
    }

    public void delete(int bookid) throws Exception {

        Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");

        BookVO vo = new BookVO();

        String sql3 = "select userid,movieid,person from book where bookid=?";
        PreparedStatement pt3 = con.prepareStatement(sql3);
        pt3.setInt(1, bookid);
        ResultSet rs = pt3.executeQuery();
        String userid = "";
        int movieid = 0;
        int person = 0;
        while (rs.next() == true) {
            movieid = rs.getInt("movieid");
            person = rs.getInt("person");
            userid = rs.getString("userid");
        }

        String sql2 = "update movie set audience_number=audience_number-? where movieid=?";
        PreparedStatement pt2 = con.prepareStatement(sql2);
        pt2.setInt(1, person);
        pt2.setInt(2, movieid);

        String sql = "delete from book where bookid=?";
        con.prepareStatement(sql);
        PreparedStatement pt = con.prepareStatement(sql);
        pt.setInt(1, bookid);

        pt.executeQuery();
        pt2.execute();

        String sql4 = "update movie_user set paynum=paynum-1 where userid=?";
        PreparedStatement pt4 = con.prepareStatement(sql4);
        pt4.setString(1, userid);
        pt4.execute();
        System.out.println("삭제완료");

        con.close();
    }

    public String[] getSeat(int movieid, String time) throws Exception{
        String [] arrSeat = null;
        String seat = "";
        Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");

        String sql = "select seat from book where movieid = ? and time = ?";
        PreparedStatement pt = con.prepareStatement(sql);
        pt.setInt(1, movieid);
        pt.setString(2, time);
        ResultSet rs = pt.executeQuery();
        while (rs.next() == true) {
            seat += rs.getString("seat");
        }

        arrSeat = seat.split(" ");
        con.close();
        return arrSeat;
    }
}