package diner;

import connectdb.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DinerService {

    ConnectionDB dbConnect = new ConnectionDB();

    public int getCount(){ // 총 갯수 가져오기
        int count = 0;

        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT COUNT(*) FROM DINER";
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

    public int getSearchCount(String searchKeyword, String searchTarget) {
        int count = 0;

        try {
            Connection con = dbConnect.getCon();
            String sql = "";

            if(searchTarget.equals("name")){
                sql = "SELECT COUNT(*) FROM DINER WHERE NAME LIKE ? ";
            } else if (searchTarget.equals("address")) {
                sql = "SELECT COUNT(*) FROM DINER WHERE ADDRESS LIKE ?";
            } else if (searchTarget.equals("dish")) {
                sql = "SELECT COUNT(*) FROM DINER WHERE DISH LIKE ?";
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

    public List<Diner> getDiners() { // 다 들고오기
        List<Diner> diners = new ArrayList<>();

        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT * FROM DINER";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            writeDinerList(diners, con, pstmt);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return diners;
    }


    public List<Diner> getPageDiners(int page) {
        List<Diner> diners = new ArrayList<>();

        try {
            Connection con = dbConnect.getCon();
            //LIMIT 0,10; 0부터 10개까지
            String sql = "SELECT * FROM DINER LIMIT ?,10";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,page*10);

            writeDinerList(diners, con, pstmt);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return diners;
    }


    public Diner getOneDiner(String zipcode){
        Diner diner = new Diner();
        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT * FROM DINER WHERE ADDRESS= ?";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,zipcode);
            rs = pstmt.executeQuery();

            while (rs.next()){
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone_num = rs.getString("phone_num");
                String dish = rs.getString("dish");
               diner.setName(name);
               diner.setAddress(address);
               diner.setPhone_num(phone_num);
               diner.setDish(dish);
            }
            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return diner;
    }

    public List<Diner> getSpecificDiners(String searchKeyword, String searchTarget, int page) {
        List<Diner> diners = new ArrayList<>();


        try {
            Connection con = dbConnect.getCon();
            String sql = "";

            if(searchTarget.equals("name")){
                sql = "SELECT * FROM DINER WHERE NAME LIKE ? LIMIT ?,10";
            } else if (searchTarget.equals("address")) {
                sql = "SELECT * FROM DINER WHERE ADDRESS LIKE ? LIMIT ?,10";
            } else if (searchTarget.equals("dish")) {
                sql = "SELECT * FROM DINER WHERE DISH LIKE ? LIMIT ?,10";
            }


            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+searchKeyword+"%");
            pstmt.setInt(2,page*10);


            writeDinerList(diners, con, pstmt);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return diners;

    }



    private void writeDinerList(List<Diner> diners, Connection con, PreparedStatement pstmt) throws SQLException {
        ResultSet rs;
        rs = pstmt.executeQuery();

        while (rs.next()){
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String address = rs.getString("address");
            String phone_num = rs.getString("phone_num");
            String dish = rs.getString("dish");
            Diner diner =new Diner(id, name,address,phone_num,dish);
            diners.add(diner);
        }
        dbConnect.closeAll(rs, pstmt, con);
    }
}
