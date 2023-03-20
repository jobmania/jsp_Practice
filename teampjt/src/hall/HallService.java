package hall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connectdb.ConnectionDB;

public class HallService {

    ConnectionDB dbConnect = new ConnectionDB();

    public List<Hall> getHalls() {
        List<Hall> halls = new ArrayList<>();

        try {
            Connection con = dbConnect.getCon();
            String sql = "SELECT * FROM hall";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()){
            	Integer hallID = rs.getInt("id");
                String city = rs.getString("city");
                String country = rs.getString("country");
                String address = rs.getString("address");
                String hallName = rs.getString("hallname");
                String openDate = rs.getString("openDate");
                String num = rs.getString("num");
                Hall hall =new Hall(hallID, city,country,address,hallName,openDate,num);
                halls.add(hall);
            }
            dbConnect.closeAll(rs, pstmt, con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return halls;
    }

}
