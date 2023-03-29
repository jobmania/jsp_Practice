package servlet;

import review.Review;
import review.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "reviewWriteServlet", value = {"/review/write", "/review/write/*"})
public class ReviewWriteServlet extends HttpServlet {

    ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        //pathVariable null 오류 검출
        try {
            if (pathInfo == null) {   // 새로 작성
                String boardId = request.getParameter("board_id");
                String boardTarget = request.getParameter("board_target");

                request.setAttribute("board_id", boardId);
                request.setAttribute("board_target", boardTarget);
                request.getRequestDispatcher("/WEB-INF/views/review-write.jsp").forward(request, response);
            } else {  // 글 수정 /35

                String reviewId = pathInfo.substring(1);
                Review findReview = reviewService.getReview(reviewId);

                // 사용자 요청과  글 검증 로직 수행
                String findEmail = findReview.getEmail();
                String username = (String) request.getSession().getAttribute("username");
                if (findEmail.equals(username)) {
                    request.setAttribute("review", findReview);
                    request.getRequestDispatcher("/WEB-INF/views/review-update.jsp").forward(request, response);
                } else {  // 사용자가 다른사용자 게시글을 수정요청할때
                    request.setAttribute("fail", " 작성자만 수정할 수 있습니다.");
                    request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
                }
            }

        } catch (RuntimeException e) {
            request.setAttribute("fail", "올바른 경로를 입력하세요");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String subject = request.getParameter("subject"); // 제목
        String stars = request.getParameter("stars"); // 별점
        String content = request.getParameter("content"); // 리뷰내용

        if(subject.length() > 15) {
            request.setAttribute("fail", "입력된 문자열의 길이가 15를 초과했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }


        if (pathInfo == null) {// 새로 작성
            String username = (String) request.getSession().getAttribute("username");
            String boardId = request.getParameter("board_id"); // 게시글 아이디
            String boardTarget = request.getParameter("board_target"); // 게시판 항목


            boolean checkWriting = reviewService.writeReview(username, subject, boardId, boardTarget, stars, content);

            if (checkWriting) {
                // 성공시
                response.sendRedirect("/review");
            } else {
                //실패시

                request.setAttribute("fail", "제목 또는 내용이 비었습니다.");
                request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
            }

        } else { // 글 수정
            String reviewId = pathInfo.substring(1);

            boolean checkUpdating = reviewService.updateReview(reviewId, subject, stars, content);

            if (checkUpdating) {
                //성공시
                response.sendRedirect("/review");
            } else {
                request.setAttribute("fail", "제목 또는 내용이 비었습니다.");
                request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
            }

        }


    }


}
