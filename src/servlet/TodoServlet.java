package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/todo.do")
public class TodoServlet extends HttpServlet {
    private TodoService todoService = new TodoService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.setAttribute("todos", todoService.getTodos());
        request.getRequestDispatcher("/WEB-INF/views/todo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String todo = req.getParameter("todo");
        if(todo.isBlank()){
            req.setAttribute("error", "할일을 입력해주세요!!");
        } else if (todoService.sameTodo(todo)) {
            req.setAttribute("error", "동일한 작업이 있습니다!!");
        } else {
            todoService.addTodo(todo);
        }
        req.setAttribute("todos", todoService.getTodos());
        req.getRequestDispatcher("/WEB-INF/views/todo.jsp").forward(req, resp);
    }
}
