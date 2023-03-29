<%@ page import="review.Review" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-27
  Time: 오후 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


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
                        <td>업체 이름</td>
                        <td> ${review.targetName}</td>
                    </tr>

                    <tr>
                        <td>작성자</td>
                        <td> ${review.email}</td>
                    </tr>


                    <tr>
                        <td>작성한 시각</td>
                        <td> ${review.reg_date}</td>
                    </tr>


                    <tr>
                        <td>수정한 시각</td>
                        <td> ${review.mod_date}</td>
                    </tr>

                    <tr>
                        <td>별점</td>
                        <td>
                            <c:forEach begin="1" end="${review.stars}">
                                ⭐
                            </c:forEach>
                        </td>

                    </tr>


                    <tr>
                        <td>글내용</td>
                        <td> ${review.contents}</td>

                    </tr>
                    <tr>
                        <td colspan="2"  class="text-center">



                    <a class="btn btn-primary" href="/review">리뷰 글보기</a>
                    <% String loginUsername = (String) request.getSession().getAttribute("username");
                        Review review = (Review) request.getAttribute("review");
                        String writtenUsername = review.getEmail();
                   if(loginUsername != null && loginUsername.equals(writtenUsername)){
                          %>
                    <a class="btn btn-primary" href="/review/write/<%=review.getId()%>" >리뷰 수정하기</a>
                    <form method="post" action="/delete/<%=review.getId()%>" class="d-inline-block">
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
