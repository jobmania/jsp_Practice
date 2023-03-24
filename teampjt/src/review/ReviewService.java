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

    private Map<String, String> reviewMap = new HashMap<>();

    public ReviewService(){
        reviewMap.put("diner", "diner_user");
        reviewMap.put("cafe", "cafe_user");
        reviewMap.put("gym", "gym_user");
        reviewMap.put("hall", "hall_user");
        reviewMap.put("library", "library_user");
        reviewMap.put("machine", "machine_user");
    }

    List<String> reviewNameList = new ArrayList<>();

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
        if(subject.isEmpty()||content.isEmpty()){
            return false;
        }


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
            writeSql = "INSERT INTO " + tableName + " (user_id," + columnName +", subject, review, stars) VALUES(?,?,?,?,?)";
            PreparedStatement writePstmt = con.prepareStatement(writeSql);

            writePstmt.setInt(1,userId);
            writePstmt.setInt(2,Integer.parseInt(boardId));
            writePstmt.setString(3,subject);
            writePstmt.setString(4,content);
            writePstmt.setInt(5,Integer.parseInt(stars));

            writePstmt.executeUpdate();
            writePstmt.close();


            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }

        return true;
   }

    public int getCount() {
        int count = 0;
        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT COUNT(*) FROM DINER_USER";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();


            while (rs.next()){
                count =  rs.getInt(1);
            }

            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;

    }

    public List<Review> getPageAllReview(int page) {
        List<Review> reviewList = new ArrayList<>();


        try {
            Connection con = dbConnect.getCon();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            //LIMIT 0,10; 0부터 10개까지
            //https://blog.outsider.ne.kr/266
            for (int i = 0; i < reviewMap.size(); i++) {
                String sql = "SELECT * FROM ? LIMIT ?,10 ORDER BY ?";



                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,page*10);
                pstmt.setString(2,"reg_date");

                rs = pstmt.executeQuery();
                while (rs.next()){

                    int user_id = rs.getInt("user_id");
                    int board_id = rs.getInt(3);
                    String address = rs.getString("address");
                    String phone_num = rs.getString("phone_num");
                    String dish = rs.getString("dish");
                    Diner diner =new Diner(id, name,address,phone_num,dish);
                    reviewList.add(diner);

            }



            }
            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return reviewList;

    }
}
