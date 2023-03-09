package database;

import java.sql.*;

public class DBConnectionUtil {

    private static String url = "jdbc:mysql://localhost:3306/webshop?useSSL=false";
    private static String user = "root";
    private static String password = "test1234";
    // DB 연결 객체..
    private static Connection conn = null;

    public static Connection openConnection() {

        if (conn != null) {
            return conn;
        } else {
            try {
                conn = DriverManager.getConnection(url, user, password);
                System.out.println("연결성공");
            } catch (SQLException e) {
                System.out.println("연결에러");
                e.printStackTrace();
            }
        }

        return conn;
    }


}

