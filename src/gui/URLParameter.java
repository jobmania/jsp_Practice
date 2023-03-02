package gui;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/url")  //  value = "/hi"  ==  urlPatterns = "/hi"
public class URLParameter extends HttpServlet {


    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println(" 서블릿 시작 start !! ");
    }


    @Override
    public void destroy() {
        super.destroy();
        System.out.println("서블릿 종료!! close~ ");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String user = req.getParameter("user");
        String id = req.getParameter("id");
        System.out.println("유저와 아이디" + user +"yayaya " +  id);
        super.doGet(req, resp);
    }
}
