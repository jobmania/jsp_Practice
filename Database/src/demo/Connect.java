package demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/conn")
public class Connect extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();

        // DB 연결 객체..
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null; // select 문 사용시 결과 주입.

        try {
            // URL , USER, PW순..
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/world?useSSL=false", "root", "test1234");
            String sql = "SELECT * FROM city";

            // 2. 쿼리 수행을 위한 PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);

            // 3. executeQuery: 쿼리 실행 후
            // ResultSet: DB 레코드 ResultSet에 객체에 담김
            rs = pstmt.executeQuery(sql);
            out.println("DB CONNECT ! 연결! !");
            while(rs.next()){  // 결과 다음줄이 있으면 계속반복
                int id = rs.getInt("ID");
                String name = rs.getString("Name");
                String countryCode = rs.getString("CountryCode");
                out.println(id+" " + name + " " + countryCode);

            }
        } catch (SQLException e) {
            out.println("DB DISCONNECT 연결 x ");
            return;
        }



        try {
            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
