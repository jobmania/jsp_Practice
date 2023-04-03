package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "libraryServlet", value = "/library")
public class LibraryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("totalPages",0);
        request.setAttribute("halls", null);
        request.setAttribute("sendPageNum",1); // 현재 페이지

        request.getRequestDispatcher("/WEB-INF/views/library.jsp").forward(request,response);
    }


}
