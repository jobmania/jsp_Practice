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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <title>Review</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <%@ include file="../common/style.jspf"%>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>




<div class="container" style="width:70%">

  <h1> 전체 리뷰페이지  </h1>

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
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <%  int totalPages = (int) request.getAttribute("totalPages");
          int currentPage = (int) request.getAttribute("sendPageNum");
          int startPage = currentPage - 2; // 시작되는 버튼이 표시될 페이지
          int endPage = currentPage + 2; // 끝나는 버튼이 표시될 페이지

          if (startPage < 1) {
            endPage += Math.abs(startPage) + 1;
            startPage = 1;
          }

          if (endPage > totalPages) {
            startPage -= (endPage - totalPages);
            endPage = totalPages;
          }
          if (currentPage != 1) { // 첫번째 버튼이 아니라면 이전 표시추가
        %>

        <li class="page-item"><a class="page-link" href="/review?page=<%= currentPage-1 %>&sort=${sort}">previous</a></li>
        <% } %>

        <% for (int i = startPage; i <= endPage; i++) {
          if(i<1){
            continue;
          }
          if (i == currentPage) { %>
        <li class="page-item active"><a class="page-link" href="/review?page=<%= i %>&sort=${sort}"><%= i %></a></li>
        <% } else { %>
        <li class="page-item"><a class="page-link" href="/review?page=<%= i %>&sort=${sort}"><%= i %></a></li>
        <% } %>
        <% } %>


        <% if (currentPage != totalPages  && totalPages!=0 ) { %>
        <li class="page-item"><a class="page-link" href="/review?page=<%= currentPage+1 %>&sort=${sort}">next</a></li>
        <% } %>
      </ul>
    </nav>


<%--  <div>--%>
<%--    <% double totalPages = (int) request.getAttribute("totalPages"); %>--%>
<%--    <% for (int i = 0; i < totalPages; i++) {%>--%>
<%--    <a class="btn btn-primary" href="/review?page=<%= i+1 %>&sort=${sort}">--%>
<%--      <%= i+1 %> </a>--%>
<%--    <% } %>--%>
<%--  </div>--%>

  <%@ include file="../common/footer.jspf"%>
</div>

</body>
</html>