import java.sql.*;

public class Main {
    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/webshop?useSSL=false";
        String user = "root";
        String password = "test1234";
        // DB 연결 객체..
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null; // select 문 사용시 결과 주입.

        try {

            // URL , USER, PW순..
            conn = DriverManager.getConnection(
                    url,user,password);
            String sql = "SELECT * FROM emp";

            // 2. 쿼리 수행을 위한 PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);

            // 3. executeQuery: 쿼리 실행 후
            // ResultSet: DB 레코드 ResultSet에 객체에 담김
            rs = pstmt.executeQuery(sql);

            while(rs.next()){  // 결과 다음줄이 있으면 계속반복
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String dob = rs.getString("dob");
                String dep = rs.getString("department");
                System.out.println(id+ " " + name +" " + dob +" " + dep);

            }
        } catch (SQLException e) {
            e.printStackTrace();
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
