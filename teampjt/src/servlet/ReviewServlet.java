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
        initParams = {@WebInitParam(name="page", value = "1")}) // default 값 설정!
public class ReviewServlet extends HttpServlet {
    ReviewService reviewService = new ReviewService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String stringPage = request.getParameter("page");
        int page ;

        if(stringPage==null){
            page = Integer.parseInt(this.getInitParameter("page"));
        }else {
            page = Integer.parseInt(stringPage);
        }
        // 1페이지당 10개.
        page -= 1; // first page =  0

        int totalCount = reviewService.getCount();
        List<Review> pageReview = reviewService.getPageAllReview(page);


        request.getRequestDispatcher("/WEB-INF/views/review.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
