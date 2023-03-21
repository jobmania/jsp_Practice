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

    public List<Diner> getDiners() {
        List<Diner> diners = new ArrayList<>();

        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT * FROM DINER";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()){
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone_num = rs.getString("phone_num");
                String dish = rs.getString("dish");
                Diner diner =new Diner(name,address,phone_num,dish);
                diners.add(diner);
            }
            dbConnect.closeAll(rs, pstmt, con);
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

}
