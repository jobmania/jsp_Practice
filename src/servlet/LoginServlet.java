package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/login.do")
public class LoginServlet extends HttpServlet {
    LoginService loginService = new LoginService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String password = req.getParameter("pw");

        boolean isValidUser = loginService.isUserValid(name, password);

        if(isValidUser){
            req.getSession().setAttribute("name",name);
            resp.sendRedirect("todo.do");
        }else {
            req.setAttribute("error","Invalid Id Or Pw 아이디 or 비번 잘못!");
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req,resp);
        }

    }
}
