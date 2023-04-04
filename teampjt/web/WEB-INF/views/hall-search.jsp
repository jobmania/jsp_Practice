<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-22
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <title>Diner</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <%@ include file="../common/style.jspf"%>
    <script>
        function handleCheckShowing() {
            const checkbox = document.getElementById('flexCheckDefault');
            if (checkbox.checked) {
                checkbox.value = true;
            } else {
                checkbox.value = false;
            }
        }
    </script>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>


<div class="container" style="width:70%">
    <h1> 공연 게시판 </h1>
    <div class="d-flex justify-content-end">
        <a class="btn btn-primary" href="/hall?page=1">공연장 리스트로 돌아가기</a>
    </div>


    <%--   검색창   --%>
    <form id="searchBar" action="/hall/search" method="get">
        <span class="btn_img itx_wrp">
            <label for="search_keyword">검색</label>
            <input type="text" name="search_keyword" id="search_keyword" class="bd_srch_btm_itx srch_itx" value="${searchKeyword}">
        </span>
        <span class="btn_img select">
            <select id="search_target" name="search_target">
            <option value="name">이름</option>
            <option value="address">주소</option>
            </select>
        </span>
        <button type="submit" class="ico_16px search">Search</button>
        <span>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" name="checkShowing"  onchange="handleCheckShowing()">
              <label class="form-check-label" for="flexCheckDefault">
               상영중인 공연만 보기
          </label>
            </div>
        </span>

        <span>
         <input type="hidden" name="page" value="1"> <%-- 페이지 1 값 보내기 --%>
        </span>

    </form>


    <%-- 테이블 --%>
    <table class="table table-striped" , id="dinerTable">
        <br>
        <caption></caption>
        <thead>
        <tr>
            <th>번호</th>
            <th>공연장 이름</th>
            <th>주소</th>
            <th>개장일</th>
            <th>폐관일</th>
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
                <td>${hall.openDate}</td>
                <td>${hall.closeDate}</td>
                <td><a class="btn btn-primary" href="/map?address=${hall.address}&id=${hall.id}&board=hall">상세 보기</a>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <!-- 페이징 처리 -->
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <%  int totalPages = (int) request.getAttribute("totalPages");
                    int currentPage = (int) request.getAttribute("sendPageNum");
                    String search_keyword = (String) request.getAttribute("searchKeyword");
                    String search_target = (String) request.getAttribute("searchTarget");
                    boolean checkShowing = (boolean) request.getAttribute("checkShowing");
                    int startPage = currentPage - 2; // 시작되는 버튼이 표시될 페이지
                    int endPage = currentPage + 2; // 끝나는 버튼이 표시될 페이지
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
                <li class="page-item"><a class="page-link" href="/hall/search?page=<%= currentPage-1 %>&search_keyword=<%=search_keyword%>&search_target=<%=search_target%>&checkShowing=<%=checkShowing%>">previous</a></li>
                <% } %>

                <% for (int i = startPage; i <= endPage; i++) {
                    if(i<1){
                        continue;
                    }

                    if (i == currentPage) { %>
                <li class="page-item active"><a class="page-link" href="/hall/search?page=<%= i %>&search_keyword=<%=search_keyword%>&search_target=<%=search_target%>&checkShowing=<%=checkShowing%>"><%= i %></a></li>
                <% } else { %>
                <li class="page-item"><a class="page-link" href="/hall/search?page=<%= i %>&search_keyword=<%=search_keyword%>&search_target=<%=search_target%>&checkShowing=<%=checkShowing%>"><%= i %></a></li>
                <% } %>
                <% } %>


                <% if (currentPage != totalPages && totalPages!=0 ) { %>
                <li class="page-item"><a class="page-link" href="/hall/search?page=<%= currentPage+1 %>&search_keyword=<%=search_keyword%>&search_target=<%=search_target%>&checkShowing=<%=checkShowing%>">next</a></li>
                <% } %>
            </ul>
        </nav>










<%--    <div>--%>
<%--        <% double totalPages = (int) request.getAttribute("totalPages");--%>
<%--            String search_keyword = (String) request.getAttribute("searchKeyword");--%>
<%--            String search_target = (String) request.getAttribute("searchTarget");%>--%>
<%--        <% for (int i = 0; i < totalPages; i++) {%>--%>
<%--        <a class="btn btn-primary" href="/diner/search?page=<%= i+1 %>&search_keyword=<%=search_keyword%>&search_target=<%=search_target%>">--%>
<%--            <%= i+1 %> </a>--%>
<%--        <% } %>--%>
<%--    </div>--%>

    <%@ include file="../common/footer.jspf"%>
</div>


</body>
</html>
