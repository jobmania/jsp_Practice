package User;

import connectdb.ConnectionDB;

import java.sql.*;
import java.time.LocalDate;

public class UserService {

    ConnectionDB dbConnect = new ConnectionDB();

    public String saveUser(String email, String password, String checkPassword) {

        /** 유효성검사
         * 이메일(ID) 및 PW 공백 및 형식 검사
         * 1. 이메일 빈배열 및 공백 검사
         * 2. 비밀번호 공백 및 4자이상
        * */
        if(email.isEmpty()||email.isBlank()){
            return "이메일을 제대로 입력하세요.";
        }else if(password.isEmpty()||password.isBlank()){
            return "비밀번호를 제대로 입력하세요.";
        }else if (!password.equals(checkPassword)) {
            return "비밀번호를 똑같이 입력하세요";
        }else if (!email.matches("[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$")){
            return "id는 이메일 형식으로 작성!";
        }else if (password.length() < 4) {
            return "패스워드는 4자 이상";
        } else if (password.matches("\\w*\\s+\\w*")) {
            return "패스워드에 스페이스가 포함되면 안됩니다.";
        }



       // DB 연결단
        try {
            Connection con = dbConnect.getCon();


            String sql = "SELECT * FROM USER WHERE email= ?";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,email);
            rs = pstmt.executeQuery();

            if(rs.next()){
                dbConnect.closeAll(rs, pstmt, con);
                return "중복된 이름";
            }else {
                String insertSql = "INSERT INTO USER(email,password, createTime) VALUES (?,?,?)";
                PreparedStatement pstmt2 = null;

                pstmt2 = con.prepareStatement(insertSql);
                pstmt2.setString(1,email);
                pstmt2.setString(2,password);
                pstmt2.setDate(3, Date.valueOf(LocalDate.now()));
                pstmt2.executeUpdate();
                dbConnect.closeAll(rs, pstmt2, con);
                return "ok";
            }
        } catch (SQLException e) {
            return "에러 발생";
        }
    }


    public boolean isUserValid(String email, String password) {

        try {
            Connection con = dbConnect.getCon();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM USER WHERE email= ? AND password=?";

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,email);
            pstmt.setString(2,password);
            rs = pstmt.executeQuery();

            if(!rs.next()){
                return false;
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return true;
    }
}
