package servlet;

import dao.EmployeeDAO;
import dao.EmployeeDATOImpl;
import model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "employeeController", urlPatterns = "/EmployeeController")
public class EmployeeController extends HttpServlet {
    EmployeeDAO employeeDAO = null;

    public EmployeeController(){
        this.employeeDAO = new EmployeeDATOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if(action == null){
            action = "LIST";
        }


        switch (action){
            case "LIST":
                listEmployee(request, response);
                break;
            case "EDIT":
                getSingleEmployee(request, response);
                break;
            case "DELETE":
                deleteEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
                break;
        }


    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(employeeDAO.delete(Integer.parseInt(id))){
            request.setAttribute("note","ok");
        }
        listEmployee(request, response);
    }

    private void getSingleEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Employee e = employeeDAO.get(Integer.parseInt(id));

        request.setAttribute("employee",e);
        request.getRequestDispatcher("views/employee-list.jsp").forward(request,response);
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 직원들 리스트를 리스트에 저장
        List<Employee> list = employeeDAO.getAll();
        // 리퀘스ㅡ에 list 전달.
        request.setAttribute("list",list);
        request.getRequestDispatcher("views/employee-list.jsp").forward(request,response);
    }
}
