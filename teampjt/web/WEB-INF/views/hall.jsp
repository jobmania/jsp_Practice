<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-16
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <title>Hall</title>
    <%@ include file="../common/style.jspf"%>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>
<div class="container" style="width:80%">


    <h1> 공연 게시판 </h1>
    <%-- 테이블 --%>
    <table class="table table-striped" , id="dinerTable">
        <br>
        <caption></caption>
        <thead>
        <tr>
            <th>번호</th>
            <th>공연장 이름</th>
            <th>주소</th>
            <th>전화번호</th>

        </tr>
        </thead>
        <tbody>
        <c:if test="${empty halls}">
            <tr>
                <td colspan="5">No data available</td>
            </tr>
        </c:if>

        <c:forEach items="${halls}" var="hall" varStatus="status">

            <tr>
                <td>${(sendPageNum - 1) * 10 + status.index + 1}</td>
                <td>${hall.name}</td>
                <td>${hall.address}</td>
                <td>${hall.phone_num}</td>
                <td><a class="btn btn-primary" href="/map?address=${hall.address}&id=${hall.id}&board=hall">상세 보기</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 페이징 처리 -->
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <%  int totalPages = (int) request.getAttribute("totalPages");
                int currentPage = (int) request.getAttribute("sendPageNum");
                int startPage = currentPage - 4; // 시작되는 버튼이 표시될 페이지
                int endPage = currentPage + 5; // 끝나는 버튼이 표시될 페이지
                // 1,2,3,4 경우
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

            <li class="page-item"><a class="page-link" href="/hall?page=<%= currentPage-1 %>">previous</a></li>
            <% } %>

            <% for (int i = startPage; i <= endPage; i++) {
                if(i<1){
                    continue;
                }
                if (i == currentPage) { %>
            <li class="page-item active"><a class="page-link" href="/hall?page=<%= i %>"><%= i %></a></li>
            <% } else { %>
            <li class="page-item"><a class="page-link" href="/hall?page=<%= i %>"><%= i %></a></li>
            <% } %>
            <% } %>


            <% if (currentPage != totalPages && totalPages!=0 ) { %>
            <li class="page-item"><a class="page-link" href="/hall?page=<%= currentPage+1 %>">next</a></li>
            <% } %>
        </ul>
    </nav>

    <%@ include file="../common/footer.jspf"%>
</div>

</body>
</html>
