package hall;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import cafe.Cafe;
import connectdb.ConnectionDB;
import diner.Diner;

public class HallService {

    ConnectionDB dbConnect = new ConnectionDB();


    public int getCount() {
        int count = 0;

        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT COUNT(*) FROM HALL";
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


    public int getSearchCount(String searchKeyword, String searchTarget, boolean checkShowing) {
        int count = 0;

        try {
            Connection con = dbConnect.getCon();
            String sql = "";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            if(checkShowing){
                switch (searchTarget) {
                    case "name":
                        sql =   "SELECT COUNT(*) " +
                                " FROM ( SELECT OPENDATE, CLOSEDATE, now() FROM HALL " +
                                "        WHERE NAME LIKE ?) AS subquery" +
                                " WHERE NOW() BETWEEN OPENDATE AND CLOSEDATE ";
                        break;
                    case "address":
                        sql =   "SELECT COUNT(*) " +
                                " FROM ( SELECT OPENDATE, CLOSEDATE, now() FROM HALL " +
                                "        WHERE ADDRESS LIKE ?) AS subquery" +
                                " WHERE NOW() BETWEEN OPENDATE AND CLOSEDATE ";
                        break;
                }
            }else {
                switch (searchTarget) {
                    case "name":
                        sql = "SELECT COUNT(*) FROM HALL WHERE NAME LIKE ? ";
                        break;
                    case "address":
                        sql = "SELECT COUNT(*) FROM HALL WHERE ADDRESS LIKE ?";
                        break;
                }
            }


            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + searchKeyword + "%");

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





    public List<Hall> getPageHalls(int page) {
        List<Hall> halls = new ArrayList<>();

        try {
            Connection con = dbConnect.getCon();
            //LIMIT 0,10; 0부터 10개까지
            String sql = "SELECT * FROM HALL LIMIT ?,10";
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

                String region = rs.getString("region");
                String type = rs.getString("type");
                Date openDate = rs.getDate("openDate");
                Date closeDate = rs.getDate("closeDate");

                String price = rs.getString("price");
                String homepage = rs.getString("homepage");

                Hall hall = new Hall(id,region,type,name,openDate,closeDate,price,address,phone_num,homepage);
                halls.add(hall);
            }

            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return halls;
    }

    public Hall getOneHall(String zipcode) {
        Hall hall = new Hall();
        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT * FROM Hall WHERE ADDRESS= ?";
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

                String region = rs.getString("region");
                String type = rs.getString("type");
                Date openDate = rs.getDate("openDate");
                Date closeDate = rs.getDate("closeDate");

                String price = rs.getString("price");
                String homepage = rs.getString("homepage");

                hall.setId(id);
                hall.setName(name);
                hall.setAddress(address);
                hall.setPhoneNum(phone_num);

                hall.setRegion(region);
                hall.setType(type);
                hall.setOpenDate(openDate);
                hall.setCloseDate(closeDate);
                hall.setPrice(price);
                hall.setHomepage(homepage);
            }
            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return hall;
    }

    public List<Hall> getSpecificHalls(String searchKeyword, String searchTarget, int page, boolean checkShowing) {
        List<Hall> halls = new ArrayList<>();

        try {
            Connection con = dbConnect.getCon();
            String sql = "";
            PreparedStatement pstmt = null;
            ResultSet rs = null;



            if(checkShowing){
                switch (searchTarget) {
                    case "name":
                        sql =   "SELECT * " +
                                " FROM ( SELECT *, now() FROM HALL " +
                                "        WHERE NAME LIKE ?) AS subquery" +
                                " WHERE NOW() BETWEEN OPENDATE AND CLOSEDATE " +
                                " LIMIT ?,10";
                        break;
                    case "address":
                        sql =   "SELECT * " +
                                " FROM ( SELECT *, now() FROM HALL " +
                                "        WHERE ADDRESS LIKE ?) AS subquery" +
                                " WHERE NOW() BETWEEN OPENDATE AND CLOSEDATE " +
                                " LIMIT ?,10";
                        break;
                }
            }else {
                switch (searchTarget) {
                    case "name":
                        sql = "SELECT * FROM HALL WHERE NAME LIKE ? LIMIT ?,10";
                        break;
                    case "address":
                        sql = "SELECT * FROM HALL WHERE ADDRESS LIKE ? LIMIT ?,10";
                        break;
                }
            }


            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+searchKeyword+"%");
            pstmt.setInt(2,page*10);
            rs = pstmt.executeQuery();

            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone_num = rs.getString("phone_num");

                String region = rs.getString("region");
                String type = rs.getString("type");
                Date openDate = rs.getDate("openDate");
                Date closeDate = rs.getDate("closeDate");

                String price = rs.getString("price");
                String homepage = rs.getString("homepage");

                Hall hall = new Hall(id,region,type,name,openDate,closeDate,price,address,phone_num,homepage);
                halls.add(hall);
            }

            dbConnect.closeAll(rs, pstmt, con);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return halls;
    }
}
