package servlet;

import User.UserService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    UserService userService = new UserService();

    @Override // 로그인 화면으로 이동
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
    }

    @Override   /// 로그인
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 회원이 맞는지 아닌지 판단
        boolean isValidUser = userService.isUserValid(username, password);

        if(isValidUser){
            request.getSession().setAttribute("username",username);
            request.getSession().setMaxInactiveInterval(600);// 세션지속시간 600초
            response.sendRedirect("home");
        }else {
            request.setAttribute("error","Invalid Id Or Pw (아이디 or 비번 잘못!)");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
        }
    }

}
