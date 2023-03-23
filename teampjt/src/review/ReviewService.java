package review;

import connectdb.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewService {
    ConnectionDB dbConnect = new ConnectionDB();
    private Map<String, Review> reviewMap = new HashMap<>();

   public ReviewService(){
       reviewMap.put("diner", new DinerReview());
       reviewMap.put("hall", new HallReview());
       reviewMap.put("cafe", new CafeReview());
       reviewMap.put("gym", new GymReview());
       reviewMap.put("library", new LibraryReview());
       reviewMap.put("machine", new MachineReview());
   }


    // 전체 리뷰글 불러오기
    public List<Review> getAllReviews(){

        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT * FROM DINER";
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return null;
    }


    public boolean writeReview(String username, String subject, String boardId, String boardTarget, String stars, String content) {
        String userSql = "";
        String writeSql ="";
        int id = 0;

        try {
            Connection con = dbConnect.getCon();
            userSql = "SELECT * FROM USER WHERE EMAIL = ?";
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            // 유저 id 값 찾아오기
            pstmt = con.prepareStatement(userSql);
            pstmt.setString(1,username);
            rs = pstmt.executeQuery();
            while (rs.next()){
                id = rs.getInt("id");
            }

            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return true;
   }
}
