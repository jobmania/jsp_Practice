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


        /// (String이 공백 체크 됨 )
        if (subject.isBlank() || content.isBlank()) {
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

    public boolean updateReview(String reviewId, String subject, String stars, String content) {

        /// 널 체크 (String이 빈배열로 넘어올시 ""처리 됨 )
        if (subject.isBlank() || content.isBlank()) {
            return false;
        }

        try {
            Connection con = dbConnect.getCon();
            String sql = "UPDATE user_review SET subject = ?, review = ?, stars =? WHERE id = " + reviewId;

            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, subject);
            pstmt.setString(2, content);
            pstmt.setInt(3, Integer.parseInt(stars));
            pstmt.executeUpdate();

            dbConnect.closeAll(null, pstmt, con);

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

    public List<Review> getPageAllReview(int page, String sort) {
        List<Review> reviewList = new ArrayList<>();

        try {
            Connection con = dbConnect.getCon();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            //LIMIT 0,10; 0부터 10개까지
            //https://blog.outsider.ne.kr/266



            String sql = "SELECT user_review.*, user.email, " +
                    " CASE " +
                    " WHEN user_review.table_name = 'diner' THEN diner.name " +
                    " WHEN user_review.table_name = 'cafe' THEN cafe.name " +
                    " WHEN user_review.table_name = 'hall' THEN hall.name " +
                    " WHEN user_review.table_name = 'gym' THEN gym.name " +
                    " WHEN user_review.table_name = 'library' THEN library.name " +
                    " END AS name " +
                    " FROM user_review " +
                    " INNER JOIN user ON user_review.user_id = user.id " +
                    " LEFT JOIN diner ON user_review.table_id = diner.id AND user_review.table_name = 'diner' " +
                    " LEFT JOIN cafe ON user_review.table_id = cafe.id AND user_review.table_name = 'cafe' " +
                    " LEFT JOIN hall ON user_review.table_id = hall.id AND user_review.table_name = 'hall' " +
                    " LEFT JOIN gym ON user_review.table_id = gym.id AND user_review.table_name = 'gym' " +
                    " LEFT JOIN library ON user_review.table_id = library.id AND user_review.table_name = 'library' " +
                    " ORDER BY " + sort + " DESC LIMIT ?,10;";


            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, page * 10);


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
                String targetName = rs.getString("name");

                Review review = new Review(review_id, user_id, email, board_id, board_target
                        , targetName, subject, contents, stars, reg_date, mod_date);

                reviewList.add(review);
            }


            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return reviewList;

    }

    public List<Review> getReviewsAboutTarget(int id,String tableName) {
        List<Review> reviewList = new ArrayList<>();
        try {
            Connection con = dbConnect.getCon();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM user_review WHERE table_id = ? AND table_name = ? " +
                    " ORDER BY reg_date DESC LIMIT 0, 5";

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, tableName);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                int review_id = rs.getInt("id");
                int user_id = rs.getInt("user_id");
                int board_id = rs.getInt("table_id");
                String email = "";  // 필요없는정보 임의로 처리
                Date reg_date = rs.getDate("reg_date");
                Date mod_date = rs.getDate("mod_date");
                String subject = rs.getString("subject");
                String contents = rs.getString("review"); // 리뷰내용
                int stars = rs.getInt("stars");
                String board_target = rs.getString("table_name");
                String targetName = "";  // 필요없는정보 임의로 처리

                Review review = new Review(review_id, user_id, email, board_id, board_target
                        , targetName, subject, contents, stars, reg_date, mod_date);

                reviewList.add(review);
            }


            dbConnect.closeAll(rs, pstmt, con);
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return reviewList;
    }

    public Review getReview(String reviewId) {

        Review review = new Review();

        try {
            Connection con = dbConnect.getCon();

            String sql = "SELECT user_review.*, user.email, " +
                    " CASE " +
                    " WHEN user_review.table_name = 'diner' THEN diner.name " +
                    " WHEN user_review.table_name = 'cafe' THEN cafe.name " +
                    " WHEN user_review.table_name = 'hall' THEN hall.name " +
                    " WHEN user_review.table_name = 'gym' THEN gym.name " +
                    " WHEN user_review.table_name = 'library' THEN library.name " +
                    " END AS name " +
                    " FROM user_review " +
                    " INNER JOIN user ON user_review.user_id = user.id " +
                    " LEFT JOIN diner ON user_review.table_id = diner.id AND user_review.table_name = 'diner' " +
                    " LEFT JOIN cafe ON user_review.table_id = cafe.id AND user_review.table_name = 'cafe' " +
                    " LEFT JOIN hall ON user_review.table_id = hall.id AND user_review.table_name = 'hall' " +
                    " LEFT JOIN gym ON user_review.table_id = gym.id AND user_review.table_name = 'gym' " +
                    " LEFT JOIN library ON user_review.table_id = library.id AND user_review.table_name = 'library'" +
                    "  WHERE user_review.ID = " + reviewId;


            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

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
                String targetName = rs.getString("name");

                review.update(review_id, user_id, email, board_id, board_target,
                        targetName, subject, contents, stars, reg_date, mod_date);
            }


            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return review;
    }

    public void deleteReview(String reviewId) {

        try {
            Connection con = dbConnect.getCon();
            String sql = "DELETE FROM user_review WHERE id = " + reviewId;
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.executeUpdate();

            dbConnect.closeAll(null, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
