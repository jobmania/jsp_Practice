package dao;

import database.DBConnectionUtil;
import model.Employee;
import model.Login;

import java.sql.*;

public class LoginDAOImpl implements LoginDAO{

    Connection connection = null;
    ResultSet resultSet = null;  // SELECT문 결과...
    PreparedStatement preparedStatement = null; // SQL문 객체(?를 변수처럼 넣을수 있따.)
    @Override
    public String loginCheck(Login loginBean) {

        try {
            String sql = "SELECT * FROM login WHERE email= ? AND password= ?";
            connection = DBConnectionUtil.openConnection(); // DB연결객체
            preparedStatement = connection.prepareStatement(sql); // SQL문 실행객체
            preparedStatement.setString(1,loginBean.getEmail());
            preparedStatement.setString(2,loginBean.getPassword());
//            preparedStatement.executeUpdate();  // 저장 수정 삭제!!

            resultSet = preparedStatement.executeQuery(); // SQL실행 결과를 rs에 저장.

            if(resultSet.next()) return "true"; // db에 등록된 email 및 pw 존재.
            else return "false";

        } catch (SQLException e) {
            e.printStackTrace();
        }



        return "error";
    }
}
