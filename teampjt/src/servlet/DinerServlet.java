package servlet;

import com.google.gson.Gson;
import diner.Diner;
import diner.DinerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "dinerServlet", value = "/diner",
        initParams = {@WebInitParam(name="page", value = "1")}) // default 값 설정!
public class DinerServlet extends HttpServlet {
    DinerService dinerService = new DinerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int page = getPage(request);

        int totalCount = dinerService.getCount();
        List<Diner> pageDiners = dinerService.getPageDiners(page);

        /**
         List<Diner> pageDiners = new ArrayList<>();
         List<Diner> diners = dinerService.getDiners();
         int totalPages = diners.size();

         다 가져오고 갯수 짜르기
         for (int i = (10*page) ; i < (10*page) + 10 ; i++) {
         if(i>=totalPages-1){
         break;
         }
         Diner diner = diners.get(i);
         pageDiners.add(diner);
         }

         Gson gson = new Gson();
         String jsonData = gson.toJson(diners);
         request.setAttribute("data",jsonData);
        */

        // 총 페이지 갯수 ! -> 15페이지
        int totalPages = (int) Math.ceil((double) totalCount / 10);

        request.setAttribute("totalPages",totalPages);
        request.setAttribute("diners", pageDiners);
        request.setAttribute("sendPageNum",page+1); // 현재 페이지
        request.getRequestDispatcher("/WEB-INF/views/diner.jsp").forward(request,response);

    }

    private int getPage(HttpServletRequest request) {
        String stringPage = request.getParameter("page");
        int page ;

        if(stringPage==null){
            page = Integer.parseInt(this.getInitParameter("page"));
        }else {
            page = Integer.parseInt(stringPage);
        }


        // 1페이지당 10개.
        page -= 1; // first page =
        return page;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
