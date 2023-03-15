package User;

import connectdb.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginService {

    ConnectionDB dbConnect = new ConnectionDB();
    PreparedStatement pstmt = null;
    ResultSet rs = null;


    public String getUser(){
        Connection con = dbConnect.getCon();

        dbConnect.closeAll(rs,pstmt,con);
        return "ok";
    }




}
