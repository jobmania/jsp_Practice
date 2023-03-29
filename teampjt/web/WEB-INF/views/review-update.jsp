<%@ page import="review.Review" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-23
  Time: 오전 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


  <title>Title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>
<%
  Review review = (Review) request.getAttribute("review");

%>

<div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-8">
    <h2 class="text-center">리뷰글 수정하기</h2><p></p>
    <form action="/review/write/<%=review.getId()%>" method="post">
      <div class="table table-responsive">
        <table class="table table-striped">

          <tr>
            <td>제목</td>
            <td><input type="text"  class="form-control" name="subject" value="<%=review.getSubject()%>" placeholder="여기에 적으세요." autofocus> </td>
          </tr>


          <tr>
            <td>별점</td>
            <td><span class="btn_img select">
                <select id="stars" name="stars" >
                <option value="1">⭐</option>
                <option value="2">⭐⭐</option>
                <option value="3">⭐⭐⭐</option>
                <option value="4">⭐⭐⭐⭐</option>
                <option value="5">⭐⭐⭐⭐⭐</option>
                </select>
            </span></td>
          </tr>


          <tr>
            <td>글내용</td>
            <td><textarea rows="10" cols="50" name="content" class="form-control"><%=review.getContents()%></textarea></td>
          </tr>
          <tr>
            <td colspan="2"  class="text-center">



              <input type="submit" value="리뷰수정완료" class="btn btn-success">
              <input type="reset" value="리뷰초기화" class="btn btn-warning">
              <input type="button"  class="btn btn-primary" onclick="location.href='/review'" value="리뷰 글보기">
            </td>
          </tr>

        </table>


      </div>
    </form>
  </div>
</div>

</body>
</html>
