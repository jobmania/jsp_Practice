package review;

import connectdb.ConnectionDB;

import java.sql.*;
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

    // 리뷰 작성
    public boolean writeReview(String username, String subject, String boardId, String boardTarget, String stars, String content) {
        String userSql;
        String writeSql;
        int userId = 0;


        /// 널 체크
        if(subject==null||content==null){
            return false;
        }


        Review review = reviewMap.get(boardTarget);


        try {
            Connection con = dbConnect.getCon();
            userSql = "SELECT * FROM USER WHERE EMAIL = ?" ;

            PreparedStatement pstmt = null;
            ResultSet rs = null;

            // 유저 id 값 찾아오기
            pstmt = con.prepareStatement(userSql);
            pstmt.setString(1,username);
            rs = pstmt.executeQuery();
            while (rs.next()){
                userId = rs.getInt("id");
            }





            String tableName = boardTarget + "_user";
            String columnName = boardTarget + "_id";
            // 항목에 맞는 review 주입.
//        INSERT INTO `webservice`.`diner_user` (`user_id`, `diner_id`, `subject`, `review`, `stars`) VALUES ('7', '9', '제목', '내용', '4');
            writeSql = "INSERT INTO " + tableName + " (user_id," + columnName +", subject, review, stars) VALUES(?,?,?,?,?)";
            PreparedStatement writePstmt = con.prepareStatement(writeSql);

            writePstmt.setInt(1,userId);
            writePstmt.setInt(2,Integer.parseInt(boardId));
            writePstmt.setString(3,subject);
            writePstmt.setString(4,content);
            writePstmt.setInt(5,Integer.parseInt(stars));

            writePstmt.executeUpdate();
            writePstmt.close();

            System.out.println(writeSql);


            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }

        return true;
   }
}
