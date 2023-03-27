<%@ page import="review.Review" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-27
  Time: 오후 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">리뷰 보기</h2><p></p>

            <div class="table table-responsive">
                <table class="table table-striped">

                    <tr>
                        <td>제목</td>
                        <td> ${review.subject}</td>
                    </tr>

                    <tr>
                        <td>작성자</td>
                        <td> ${review.email}</td>

                    </tr>

                    <tr>
                        <td>별점</td>
                        <td> ${review.stars}</td>

                    </tr>


                    <tr>
                        <td>글내용</td>
                        <td> ${review.contents}</td>

                    </tr>
                    <tr>
                        <td colspan="2"  class="text-center">




                            <input type="button"  class="btn btn-primary" onclick="location.href='/review'" value="리뷰 글보기">
                            <% String loginUsername = (String) request.getSession().getAttribute("username");
                                Review review = (Review) request.getAttribute("review");
                                String writtenUsername = review.getEmail();
                               if(loginUsername != null && loginUsername.equals(writtenUsername)){
                                  %>
                        <a class="btn btn-primary" href="/review/write/<%=review.getId()%>">리뷰 수정하기</a>
                            <form method="post" action="/delete/<%=review.getId()%>">
                                <button type="submit" class="btn btn-primary">리뷰 삭제하기</button>
                            </form>
                        <% } %>


                        </td>
                    </tr>

                </table>


            </div>

    </div>
</div>

</body>
</html>
