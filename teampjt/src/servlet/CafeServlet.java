package servlet;

import cafe.Cafe;
import cafe.CafeService;
import diner.Diner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "cafeServlet", value = "/cafe",
        initParams = {@WebInitParam(name="page", value = "1")})
public class CafeServlet extends HttpServlet {
    CafeService cafeService = new CafeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int page = getPage(request);

        int totalCount = cafeService.getCount();
        List<Cafe> pageCafes = cafeService.getPageCafes(page);


        // 총 페이지 갯수 ! -> 15페이지
        int totalPages = (int) Math.ceil((double) totalCount / 10);
        System.out.println(pageCafes.size());
        System.out.println(totalCount);
        System.out.println(totalPages);

        request.setAttribute("totalPages",totalPages);
        request.setAttribute("cafes", pageCafes);
        request.setAttribute("sendPageNum",page+1); // 현재 페이지


        request.getRequestDispatcher("/WEB-INF/views/cafe.jsp").forward(request,response);
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
}
