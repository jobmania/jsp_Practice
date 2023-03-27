package servlet;

import review.Review;
import review.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "reviewServlet", value = "/review",
        initParams = {@WebInitParam(name="page", value = "1"),
                      @WebInitParam(name = "sort", value = "reg_date")}) // default 값 설정!
public class ReviewServlet extends HttpServlet {
    ReviewService reviewService = new ReviewService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        int page = getPage(request);

        String sort = getSort(request);

        System.out.println(page);
        System.out.println(sort);

        int totalCount = reviewService.getCount();
        List<Review> pageReview = reviewService.getPageAllReview(page, sort);

        System.out.println(totalCount);
        System.out.println(pageReview.size());


        // 페이지 버튼
        int totalPages = (int) Math.ceil((double) totalCount / 10);
        request.setAttribute("totalPages",totalPages);
        request.setAttribute("pageReview", pageReview);
        request.setAttribute("sendPageNum", page + 1);
        request.setAttribute("sort",sort);
        request.getRequestDispatcher("/WEB-INF/views/review.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
        page -= 1; // first page =  0
        return page;
    }

    private String getSort(HttpServletRequest request) {
        String sort = request.getParameter("sort");
        if (sort==null){
            sort = this.getInitParameter("sort");
        }
        return sort;
    }
}
