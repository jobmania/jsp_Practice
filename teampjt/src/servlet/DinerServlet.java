package servlet;

import com.google.gson.Gson;
import diner.Diner;
import diner.DinerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "dinerServlet", value = "/diner")
public class DinerServlet extends HttpServlet {
    DinerService dinerService = new DinerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1페이지당 10개.
        int page = Integer.parseInt(request.getParameter("page"));
        page -= 1; // first page =  0



        int totalCount = dinerService.getCount();
        List<Diner> pageDiners = dinerService.getPageDiners(page);

//        List<Diner> pageDiners = new ArrayList<>();
//        List<Diner> diners = dinerService.getDiners();
//        int totalPages = diners.size();

        // 다 가져오고 갯수 짜르기
//        for (int i = (10*page) ; i < (10*page) + 10 ; i++) {
//            if(i>=totalPages-1){
//                break;
//            }
//            Diner diner = diners.get(i);
//            pageDiners.add(diner);
//        }

//        Gson gson = new Gson();
//        String jsonData = gson.toJson(diners);
//        request.setAttribute("data",jsonData);

        // 총 페이지 갯수 !
        int totalPages = (int) Math.ceil((double) totalCount / 10);

        System.out.println(totalPages);
        request.setAttribute("totalPages",totalPages);
        request.setAttribute("diners", pageDiners);
        request.getRequestDispatcher("/WEB-INF/views/diner.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchKeyword = request.getParameter("search_keyword");
        String searchTarget = request.getParameter("search_target");
        // 1페이지당 10개.
        int page = Integer.parseInt(request.getParameter("page"));
        page -= 1; // first page =  0

        int totalSearchCount = dinerService.getSearchCount(searchKeyword,searchTarget);
        List<Diner> diners = dinerService.getSpecificDiners(searchKeyword, searchTarget,page);



//        Gson gson = new Gson();
//        String jsonData = gson.toJson(diners);
//        request.setAttribute("data",jsonData);
// 총 페이지 갯수

        int searchTotalPages = (int) Math.ceil((double) totalSearchCount / 10);

        request.setAttribute("searchKeyword", searchKeyword);
        request.setAttribute("searchTarget", searchTarget);
        request.setAttribute("searchTotalPages",searchTotalPages);
        request.setAttribute("diners", diners);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("/WEB-INF/views/diner.jsp").forward(request,response);

    }
}
