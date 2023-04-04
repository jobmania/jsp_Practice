package cafe;

import connectdb.ConnectionDB;
import diner.Diner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CafeService {
    ConnectionDB dbConnect = new ConnectionDB();


    public int getCount(){ // 총 갯수 가져오기
        int count = 0;

        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT COUNT(*) FROM cafe";

            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()){
                count =  rs.getInt(1);
            }

            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

    public int getSearchCount(String searchKeyword, String searchTarget) {
        int count = 0;

        try {
            Connection con = dbConnect.getCon();
            String sql = "";

            if(searchTarget.equals("name")){
                sql = "SELECT COUNT(*) FROM cafe WHERE NAME LIKE ? ";
            } else if (searchTarget.equals("address")) {
                sql = "SELECT COUNT(*) FROM cafe WHERE ADDRESS LIKE ?";
            }

            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+searchKeyword+"%");
            rs = pstmt.executeQuery();

            while (rs.next()){
                count =  rs.getInt(1);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return count;
    }


    public List<Cafe> getPageCafes(int page) {
        List<Cafe> cafes = new ArrayList<>();

        try {
            Connection con = dbConnect.getCon();
            //LIMIT 0,10; 0부터 10개까지
            String sql = "SELECT * FROM CAFE LIMIT ?,10";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,page*10);

            rs = pstmt.executeQuery();

            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone_num = rs.getString("phone_num");
                Cafe cafe = new Cafe(id, name, address, phone_num);
                cafes.add(cafe);
            }
            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cafes;
    }


    public Cafe getOneCafe(String zipcode){
        Cafe cafe = new Cafe();
        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT * FROM Cafe WHERE ADDRESS= ?";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,zipcode);
            rs = pstmt.executeQuery();

            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone_num = rs.getString("phone_num");
                cafe.setId(id);
                cafe.setName(name);
                cafe.setAddress(address);
                cafe.setPhone_num(phone_num);
            }
            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cafe;
    }

    public List<Cafe> getSpecificCafes(String searchKeyword, String searchTarget, int page) {
        List<Cafe> cafes = new ArrayList<>();


        try {
            Connection con = dbConnect.getCon();
            String sql = "";

            if(searchTarget.equals("name")){
                sql = "SELECT * FROM Cafe WHERE NAME LIKE ? LIMIT ?,10";
            } else if (searchTarget.equals("address")) {
                sql = "SELECT * FROM Cafe WHERE ADDRESS LIKE ? LIMIT ?,10";
            }


            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+searchKeyword+"%");
            pstmt.setInt(2,page*10);

            rs = pstmt.executeQuery();

            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone_num = rs.getString("phone_num");
                Cafe cafe = new Cafe(id, name, address, phone_num);
                cafes.add(cafe);
            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cafes;

    }

}
