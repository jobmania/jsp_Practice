package controller;

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
        String user = req.getParameter("user");
        System.out.println(user);

//      웹페이지 응답값 출력
        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("user Post " + user);
        out.println("</html>");

    }
}
