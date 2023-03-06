package beans;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/scope")
public class Scope extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////    리퀘스트, 세션 , application 객체 사용법
//        req.setAttribute("test", "hello");  // 저장
//        String test = (String) req.getAttribute("test"); // 가져오기
////        parameter 가져오기. , 저장 x
//        String parameter = req.getParameter("이름");
//
////        세션
//        HttpSession session = req.getSession();
//        session.setAttribute("test","session");
//        String test1 = (String) session.getAttribute("test");
//
////        application
//        ServletContext context = getServletContext();
//        context.setAttribute("test","hello");
//        String test2 = (String) context.getAttribute("test");

        PrintWriter out = resp.getWriter();
        out.println("<html>");
        Cookie[] cookies = req.getCookies();
        if(cookies ==null){
            out.println("No cookies founded <br/>");
        }else {
            for (Cookie cookie : cookies) {
                String name = cookie.getName();
                String value = cookie.getValue();
                out.println(name + " = " + value + "<br/>");
            }
        }


        Cookie cookie = new Cookie("user", "UM");
        cookie.setMaxAge(300);
        // 브라우저에 쿠키 추가
        resp.addCookie(cookie);


        out.println("saved cookie, set complete <br/>");

        out.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
