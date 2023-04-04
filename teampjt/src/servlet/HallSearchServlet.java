package servlet;

import cafe.Cafe;
import cafe.CafeService;
import hall.Hall;
import hall.HallService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "hallSearchServlet", value = "/hall/search")
public class HallSearchServlet extends HttpServlet {

    HallService hallService = new HallService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchKeyword = request.getParameter("search_keyword");
        String searchTarget = request.getParameter("search_target");
        boolean checkShowing = Boolean.parseBoolean(request.getParameter("checkShowing"));
        // 1페이지당 10개.
        int page = Integer.parseInt(request.getParameter("page"));
        page -= 1; // first page =  0

        int totalSearchCount = hallService.getSearchCount(searchKeyword,searchTarget, checkShowing);
        List<Hall> halls = hallService.getSpecificHalls(searchKeyword, searchTarget,page,checkShowing);


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
        request.setAttribute("checkShowing",checkShowing);
        request.setAttribute("sendPageNum",page+1);
        request.setAttribute("halls", halls);

        request.getRequestDispatcher("/WEB-INF/views/hall-search.jsp").forward(request,response);
    }
}
