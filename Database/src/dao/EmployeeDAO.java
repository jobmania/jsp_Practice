package dao;

import model.Employee;

import java.util.List;

public interface EmployeeDAO {
    // 직원 전체목록
    List<Employee> getAll();

    // 직원한명 가져오기(id필요)
    Employee get(int id);

    // 직원저장
    boolean save(Employee employee);

    //직원삭제
    boolean delete(int id);

    //직원 업데이트
    boolean update(Employee employee);

}
