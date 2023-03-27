<%--
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



<%--                             본인이 쓴 글일때만 삭제 및 수정 버튼 생성.--%>
<%--                            <input type="submit" value="리뷰쓰기완료" class="btn btn-success">--%>
<%--                            <input type="reset" value="리뷰초기화" class="btn btn-warning">--%>
                            <input type="button"  class="btn btn-primary" onclick="location.href='/review'" value="리뷰 글보기">
                        </td>
                    </tr>

                </table>


            </div>

    </div>
</div>

</body>
</html>
