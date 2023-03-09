package dao;

import database.DBConnectionUtil;
import model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class EmployeeDATOImpl implements EmployeeDAO {


    Connection connection = null;
    ResultSet resultSet = null;  // SELECT문 결과...
    Statement statement = null; // SQL문 객체 .
    PreparedStatement preparedStatement = null; // SQL문 객체(?를 변수처럼 넣을수 있따.)

    @Override
    public List<Employee> getAll() {
        List<Employee> list = new ArrayList<Employee>();
        Employee employee = null;

        try {
            String sql = "SELECT * FROM emp";
            connection = DBConnectionUtil.openConnection(); // DB연결객체
            statement = connection.createStatement(); // SQL문 실행객체
            resultSet = statement.executeQuery(sql); // SQL실행 결과를 rs에 저장.

            while (resultSet.next()) {
                employee = new Employee();
                employee.setId(resultSet.getInt("id"));
                employee.setName(resultSet.getString("name"));
                employee.setDob(resultSet.getString("department"));
                employee.setDepartment(resultSet.getString("dob"));
                list.add(employee);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Employee get(int id) {
        Employee employee = new Employee();

        try {
            String sql = "SELECT * FROM emp WHERE id=" + id;
            connection = DBConnectionUtil.openConnection(); // DB연결객체
            statement = connection.createStatement(); // SQL문 실행객체
            resultSet = statement.executeQuery(sql); // SQL실행 결과를 rs에 저장.

            if (resultSet.next()) {
                employee.setId(resultSet.getInt("id"));
                employee.setName(resultSet.getString("name"));
                employee.setDob(resultSet.getString("department"));
                employee.setDepartment(resultSet.getString("dob"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employee;
    }

    @Override
    public boolean save(Employee e) {
        boolean flag = false;

        try {
//            String sql = "INSERT INTO emp VALUES("
//                    +e.getName()+","+e.getDob()+","+e.getDepartment()+")";

            String sql = "INSERT INTO emp(name,dob,department) VALUES (?,?,?)";

            connection = DBConnectionUtil.openConnection(); // DB연결객체
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, e.getName());
            preparedStatement.setString(2, e.getDob());
            preparedStatement.setString(3, e.getDepartment());
            preparedStatement.executeUpdate();  // 저장 수정 삭제!!
            flag = true;

        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean delete(int id) {
        boolean flag = false;

        try {
//            String sql = "DELETE FROM EMP WHERE ID=?"+id;

            String sql = "DELETE FROM emp WHERE ID=?";

            connection = DBConnectionUtil.openConnection(); // DB연결객체
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();  // 저장 수정 삭제!!
            flag = true;

        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean update(Employee employee) {
        boolean flag = false;

        try {

            String sql = "UPDATE emp SET name =? department=? dob=? WHERE id=?";
            connection = DBConnectionUtil.openConnection(); // DB연결객체
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDepartment());
            preparedStatement.setString(3, employee.getDob());
            preparedStatement.setInt(4, employee.getId());
            preparedStatement.executeUpdate();  // 저장 수정 삭제!!
            flag = true;

        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        return flag;
    }
}
