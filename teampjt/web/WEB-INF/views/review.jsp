<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-23
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

  <title>Title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>
<h1> 전체 리뷰!  </h1>
<a class="btn btn-primary" href="/home"> 홈으로 </a>



<div class="container" style="width:70%">


  <%--   sort창   --%>
  <form id="searchBar" action="/review" method="get">

    <span class="btn_img select">
            <select id="sort_target" name="sort">
            <option value="reg_date">최신순</option>
            <option value="stars">별점순</option>
            </select>
    </span>
    <button type="submit" class="ico_16px search">Search</button>
  </form>

  <%-- 테이블 --%>
  <table class="table table-striped" , id="dinerTable">
    <br>
    <caption></caption>
    <thead>
    <tr>
      <th>번호</th>
      <th>게시글 제목</th>
      <th>업체이름</th>
      <th>종류</th>
      <th>등록날짜</th>
      <th>평점</th>
      <th>작성자</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${empty pageReview}">
      <tr>
        <td colspan="5">No data available</td>
      </tr>
    </c:if>

    <c:forEach items="${pageReview}" var="review" varStatus="status">

      <tr>
        <td>${(sendPageNum - 1) * 10 + status.index + 1}</td>
        <td>${review.subject}</td>
        <td><a href="/${review.tableName}/search?search_keyword=${review.targetName}&search_target=name&page=1">${review.targetName}</a></td>
        <td>${review.tableName}</td>
        <td>${review.reg_date}</td>
        <td>
          <c:forEach begin="1" end="${review.stars}">
            ⭐
          </c:forEach>
        </td>
        <td>${review.email  }</td>
        <td><a class="btn btn-primary" href="/review/${review.id}">상세 보기</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <!-- 페이징 처리 -->
  <div>
    <% double totalPages = (int) request.getAttribute("totalPages"); %>
    <% for (int i = 0; i < totalPages; i++) {%>
    <a class="btn btn-primary" href="/review?page=<%= i+1 %>&sort=${sort}">
      <%= i+1 %> </a>
    <% } %>
  </div>


</div>

리뷰 글 확인

</body>
</html>