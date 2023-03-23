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

@WebServlet(name = "dinerServlet", value = "/diner", initParams = {@WebInitParam(name="page", value = "1")}) // default 값 설정!
public class DinerServlet extends HttpServlet {
    DinerService dinerService = new DinerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String stringPage = request.getParameter("page");
        int page = 0;

        if(stringPage==null){
            page = Integer.parseInt(this.getInitParameter("page"));
        }else {
            page = Integer.parseInt(stringPage);
        }


        // 1페이지당 10개.
        page -= 1; // first page =  0

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


        // 총 페이지 갯수 !
        int totalPages = (int) Math.ceil((double) totalCount / 10);

        request.setAttribute("totalPages",totalPages);
        request.setAttribute("diners", pageDiners);
        request.getRequestDispatcher("/WEB-INF/views/diner.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
