package servlet;

import User.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "signUpServlet", value = "/signup")
public class SignUpServlet extends HttpServlet {

    UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checkPassword = request.getParameter("checkpassword");
        String check = userService.saveUser(username, password, checkPassword);

        if(check.equals("ok")){ // 회원 가입 성공시
            request.setAttribute("ok",check);
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
        }else {
            request.setAttribute("error",check);
            request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request,response);
        }


    }
}
