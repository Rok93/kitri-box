package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MovieDAO {

//   public int updateScore(int score)  평점 업데이트 할 때 쓰기 !!

   public ArrayList<MovieVO> getMovieChart() throws Exception{
      ArrayList<MovieVO> list = new ArrayList<MovieVO>();

      String poster;
      String title;
      int audience_number;
      String startdate;
      String star;
      String genre;
      int movieid;
      int score;

      Class.forName("oracle.jdbc.driver.OracleDriver");// 외부에 있는 다른라이브러리 등록
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
      String sql = "select POSTER, title, AUDIENCE_NUMBER, STARTDATE, STAR, GENRE, MOVIEID, SCORE  from MOVIE order by audience_number desc";

      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery(sql);

      while (rs.next()) {
         poster = rs.getString("poster");
         title = rs.getString("title");
         audience_number = rs.getInt("audience_number");
         startdate = rs.getString("startdate").split(" ")[0];
         star = rs.getString("star");
         genre = rs.getString("genre");
         movieid = rs.getInt("movieid");
         score = rs.getInt("score");

         MovieVO vo = new MovieVO();

         vo.setPoster(poster);
         vo.setTitle(title);
         vo.setAudience_num(audience_number);
         vo.setStartdate(startdate);
         vo.setStar(star);
         vo.setGenre(genre);
         vo.setMovieid(movieid);
         vo.setScore(score);
         list.add(vo);
      }

      return list;
   }
}