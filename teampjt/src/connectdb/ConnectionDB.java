package connectdb;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConnectionDB {


    public Connection getCon(){

        Connection conn;

        try{
            //외부에서 데이터를 읽어들어야 하기에
            Context initctx =new InitialContext();
            //톰켓 서버에 정보를 담아놓은 곳으로 이동
            Context envctx =(Context) initctx.lookup("java:comp/env");
            //데이터 소스 객체를 선언
            DataSource ds =(DataSource) envctx.lookup("jdbc/pool");
            //데이터 소스를 기준으로 커넥션을 연결해주시오
            conn = ds.getConnection();
            //연결 커넥션 리턴
            return conn;

        }catch(Exception e){
            e.printStackTrace();
        }

        return null; //에러일 경우 null 리턴
    }


    public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn){
        try{
            //자원 반납
            if(rs!=null) rs.close();
            if(pstmt!=null) pstmt.close();
            if(conn!=null) conn.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }


}
