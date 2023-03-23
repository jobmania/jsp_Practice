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
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
    />
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>


</head>
<body>
<%@ include file="../common/navigation.jspf"%>
<h1> 음식 검색 정보 </h1>
<a class="btn btn-primary" href="/home"> 홈으로 </a>
<a class="btn btn-primary" href="/diner?page=1"> 음식 리스트로 돌아가기 </a>
<img src="/images/homeimg.jpg" alt="식당 이미지"><br>
<div class="container" style="width:70%">

    <%--   검색창   --%>
    <form id="searchBar" action="/diner/search" method="get">
        <span class="btn_img itx_wrp">
            <label for="search_keyword">검색</label>
            <input type="text" name="search_keyword" id="search_keyword" class="bd_srch_btm_itx srch_itx" value="">
        </span>
        <span class="btn_img select">
            <select id="search_target" name="search_target">
            <option value="name">이름</option>
            <option value="address">주소</option>
            <option value="dish">요리</option>
            </select>
        </span>
        <span>
       <input type="hidden" name="page" value="1"> <%-- 페이지 1 값 보내기 --%>
        </span>
        <button type="submit" class="ico_16px search">Search</button>
    </form>

    <%--    ajax 검색창 --%>


    <%-- 테이블 --%>
    <table class="table table-striped" , id="dinerTable">
        <br>
        <caption></caption>
        <thead>
        <tr>
            <th>id</th>
            <th>음식점 이름</th>
            <th>주소</th>
            <th>음식점 전화번호</th>
            <th>메인 요리</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty diners}">
            <tr>
                <td colspan="5">No data available</td>
            </tr>
        </c:if>

        <c:forEach items="${diners}" var="diner">

            <tr>
                <td>${diner.id} </td>
                <td>${diner.name}</td>
                <td>${diner.address}</td>
                <td>${diner.phone_num}</td>
                <td>${diner.dish}</td>
                <td><a class="btn btn-primary" href="/map?address=${diner.address}">상세 보기</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <!-- 페이징 처리 -->

    <div>
        <% double totalPages = (int) request.getAttribute("totalPages");
            String search_keyword = (String) request.getAttribute("searchKeyword");
            String search_target = (String) request.getAttribute("searchTarget");%>
        <% for (int i = 0; i < totalPages; i++) {%>
        <a class="btn btn-primary" href="/diner/search?page=<%= i+1 %>&search_keyword=<%=search_keyword%>&search_target=<%=search_target%>">
            <%= i+1 %> </a>
        <% } %>
    </div>


</div>


</body>
</html>
