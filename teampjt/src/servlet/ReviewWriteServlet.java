package servlet;

import review.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "reviewWriteServlet", value = "/review/write")
public class ReviewWriteServlet extends HttpServlet {

    ReviewService reviewService = new ReviewService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String boardId = request.getParameter("board_id");
        String boardTarget = request.getParameter("board_target");

        request.setAttribute("board_id",boardId);
        request.setAttribute("board_target",boardTarget);
        request.getRequestDispatcher("/WEB-INF/views/review-write.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        String subject = request.getParameter("subject"); // 제목
        String boardId = request.getParameter("board_id"); // 게시글 아이디
        String boardTarget = request.getParameter("board_target"); // 게시판 항목
        String stars = request.getParameter("stars"); // 별점
        String content = request.getParameter("content"); // 리뷰내용

        boolean checkWriting = reviewService.writeReview(username, subject,boardId, boardTarget, stars, content);


    }


}
