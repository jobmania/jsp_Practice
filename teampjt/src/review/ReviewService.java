package review;

import connectdb.ConnectionDB;
import diner.Diner;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewService {
    ConnectionDB dbConnect = new ConnectionDB();


    // 리뷰 작성
    public boolean writeReview(String username, String subject, String boardId, String boardTarget, String stars, String content) {
        String userSql;
        String writeSql;
        int userId = 0;


        /// 널 체크 (String이 빈배열로 넘어올시 ""처리 됨 )
        if (subject.isEmpty() || content.isEmpty()) {
            return false;
        }


        try {
            Connection con = dbConnect.getCon();
            userSql = "SELECT * FROM USER WHERE EMAIL = ?";

            PreparedStatement pstmt = null;
            ResultSet rs = null;

            // 유저 id 값 찾아오기
            pstmt = con.prepareStatement(userSql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                userId = rs.getInt("id");
            }


            // 항목에 맞는 review 주입.
            writeSql = "INSERT INTO user_review (user_id, table_id, subject, review, stars, table_name) VALUES(?,?,?,?,?,?)";
            PreparedStatement writePstmt = con.prepareStatement(writeSql);

            writePstmt.setInt(1, userId);
            writePstmt.setInt(2, Integer.parseInt(boardId));
            writePstmt.setString(3, subject);
            writePstmt.setString(4, content);
            writePstmt.setInt(5, Integer.parseInt(stars));
            writePstmt.setString(6, boardTarget);

            writePstmt.executeUpdate();
            writePstmt.close();


            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }

        return true;
    }

    // 전체 갯수
    public int getCount() {
        int count = 0;
        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT COUNT(*) FROM USER_REVIEW";

            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;

    }

    public List<Review> getPageAllReview(int page,String sort) {
        List<Review> reviewList = new ArrayList<>();

        try {
            Connection con = dbConnect.getCon();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            //LIMIT 0,10; 0부터 10개까지
            //https://blog.outsider.ne.kr/266


            String sql = "SELECT *, user.email AS email FROM USER_REVIEW INNER JOIN user " +
                    "ON user_review.user_id = user.id ORDER BY "+sort+" DESC LIMIT ?,10 ";


            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, page * 10);
//            pstmt.setString(2, sort);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                int review_id = rs.getInt("id");
                int user_id = rs.getInt("user_id");
                int board_id = rs.getInt("table_id");
                String email = rs.getString("email");
                Date reg_date = rs.getDate("reg_date");
                Date mod_date = rs.getDate("mod_date");
                String subject = rs.getString("subject");
                String contents = rs.getString("review"); // 리뷰내용
                int stars = rs.getInt("stars");
                String board_target = rs.getString("table_name");

                Review review = new Review(review_id,user_id, email, board_id,board_target
                ,subject,contents,stars, reg_date, mod_date);

                reviewList.add(review);
            }


            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return reviewList;

    }
}
