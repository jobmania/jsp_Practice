package servlet;

import review.Review;
import review.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "reviewDeleteServlet", value = "/delete/*")
public class ReviewDeleteServlet extends HttpServlet {
    ReviewService reviewService = new ReviewService();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String reviewId = pathInfo.substring(1);

        System.out.println(reviewId);
        //pathVariable에 대한 검증 -> 사용자가 path값을 임의로 요청시 null
        try {
            // 사용자 요청과  글 검증 로직 수행
            Review findReview = reviewService.getReview(reviewId);

            String findEmail = findReview.getEmail();
            String username = (String) request.getSession().getAttribute("username");
            if (findEmail.equals(username)) { // 성공시
                reviewService.deleteReview(reviewId);
//             여기서 에러 발생
                response.sendRedirect(request.getContextPath() + "/review");

            } else {  // 사용자가 다른사용자 게시글을 수정요청할때
                request.setAttribute("fail", " 작성자만 삭제할 수 있습니다.");
                request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
            }

        }catch (RuntimeException e){
            request.setAttribute("fail", "올바른 경로를 입력하세요");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request,response);
        }

    }

}
