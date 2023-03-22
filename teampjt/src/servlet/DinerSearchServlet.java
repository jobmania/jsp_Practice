package servlet;

import diner.Diner;
import diner.DinerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "dinerSearchServlet", value = "/diner/search")
public class DinerSearchServlet extends HttpServlet {

    DinerService dinerService = new DinerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchKeyword = request.getParameter("search_keyword");
        String searchTarget = request.getParameter("search_target");
        // 1페이지당 10개.
        int page = Integer.parseInt(request.getParameter("page"));
        page -= 1; // first page =  0

        int totalSearchCount = dinerService.getSearchCount(searchKeyword,searchTarget);
        List<Diner> diners = dinerService.getSpecificDiners(searchKeyword, searchTarget,page);


/**
 *   Gson gson = new Gson();
 *         String jsonData = gson.toJson(diners);
 *         request.setAttribute("data",jsonData);
 * */

// 총 페이지 갯수

        int totalPages = (int) Math.ceil((double) totalSearchCount / 10);

        request.setAttribute("searchKeyword", searchKeyword);
        request.setAttribute("searchTarget", searchTarget);
        request.setAttribute("totalPages",totalPages);
        request.setAttribute("diners", diners);

        request.getRequestDispatcher("/WEB-INF/views/search-diner.jsp").forward(request,response);
    }
}
