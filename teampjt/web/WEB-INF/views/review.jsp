<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-23
  Time: 오전 11:54
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
<h1> 전체 리뷰!  </h1>
<a class="btn btn-primary" href="/home"> 홈으로 </a>
<img src="/images/spring.png" alt=" 이미지"><br>
<div class="container" style="width:70%">

  <%--   검색창   --%>
  <form id="searchBar" action="/review/search" method="get">
        <span class="btn_img itx_wrp">
            <label for="search_keyword">검색</label>
            <input type="text" name="search_keyword" id="search_keyword" class="bd_srch_btm_itx srch_itx" value="">
        </span>
    <span class="btn_img select">
            <select id="search_target" name="search_target">
            <option value="name">제목</option>
            <option value="contents">내용</option>
            <option value="all">제목+내용</option>
            </select>
        </span>
    <span>
 <input type="hidden" name="page" value="1"> <%-- 페이지 1 값 보내기 --%>
        </span>
    <button type="submit" class="ico_16px search">Search</button>
  </form>

${fail}


  <%-- 테이블 --%>
  <table class="table table-striped" , id="dinerTable">
    <br>
    <caption></caption>
    <thead>
    <tr>
      <th>번호</th>
      <th>게시글 제목</th>
      <th>종류</th>
      <th>평점</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${empty diners}">
      <tr>
        <td colspan="5">No data available</td>
      </tr>
    </c:if>

    <c:forEach items="${diners}" var="diner" varStatus="status">

      <tr>
        <td>${(sendPageNum - 1) * 10 + status.index + 1}</td>
        <td>${diner.name}</td>
        <td>${diner.address}</td>
        <td>${diner.phone_num}</td>
        <td><a class="btn btn-primary" href="map?address=${diner.address}">상세 보기</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

<%--  <!-- 페이징 처리 -->--%>
<%--  <div>--%>
<%--    <% double totalPages = (int) request.getAttribute("totalPages"); %>--%>
<%--    <% for (int i = 0; i < totalPages; i++) {%>--%>
<%--    <a class="btn btn-primary" href="/diner?page=<%= i+1 %>">--%>
<%--      <%= i+1 %> </a>--%>
<%--    <% } %>--%>
<%--  </div>--%>


</div>

리뷰 글 확인
<input type="button"  class="btn btn-primary" onclick="location.href='/review/write'" value="리뷰작성">

</body>
</html>