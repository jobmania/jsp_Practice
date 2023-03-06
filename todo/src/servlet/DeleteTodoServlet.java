package servlet;

import service.TodoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-todo.do")
public class DeleteTodoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TodoService todoService = new TodoService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        todoService.deleteTodo(req.getParameter("todo"),req.getParameter("category"));
        resp.sendRedirect("/list-todo.do");


    }
}
