package servlet;

import beans.Todo;
import service.TodoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "addTodoServlet", urlPatterns = "/add-todo.do")
public class AddTodoServlet extends HttpServlet {

    private TodoService todoService = new TodoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/views/add-todo.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newTodo = request.getParameter("todo");
        String category = request.getParameter("category");
        todoService.addTodo(newTodo,category);
        request.setAttribute("todos",todoService.getTodos());
        request.getRequestDispatcher("WEB-INF/views/list-todos.jsp").forward(request,response);
    }
}
