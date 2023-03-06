package controller;

import beans.User2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//      웹페이지 응답값 출력  -> post 방식이 더 적절해 보인다.
        PrintWriter out = resp.getWriter();

        String user = req.getParameter("user");
        System.out.println(user);

        out.println("<html>");
        out.println("user get : "+user);
        out.println("</html>");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User2 user2 = new User2(email, password);

        if(user2.validate()){
            // 합격페이지(jsp)로
            req.setAttribute("email",email);
            req.getRequestDispatcher("welcome.jsp").forward(req,resp);
        }else {
            // 다시 입력 (jsp)로 이동, 에러메세지를 리퀘스트 객체에 넣어 전달..
            req.setAttribute("errorMessage",user2.getMessage());
            req.getRequestDispatcher("form1.jsp").forward(req,resp);
        }

    }
}
