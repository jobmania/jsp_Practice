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
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>Title</title>
</head>
<body>
<div class="container" style="width:80%">

    <h1> 홈화면</h1>

    ${username} hello! <br>
    <%
        if (request.getSession().getAttribute("username") == null) {
            out.write("<a href=\"login\">로그인</a>");
        } else {
            out.write("<a href=\"logout\">로그아웃</a>");
        }
    %>
    <br>
    <img src="images/homeimg.jpg" alt="지도 이미지">
    <br>
    <h2> 리스트</h2>
    <table class="table table-striped">
        <caption> 음식점 리스트 </caption>
        <thead>
        <tr>
            <th>음식점 이름 </th>
            <th> 주소(클릭 시 지도) </th>
            <th> 음식점 전화번호</th>
            <th> 메인 요리 </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${diners}" var="diner">
            <tr>
                <td>${diner.name}</td>
                <td> <a class="btn btn-primary" href="map?address=${diner.address}">${diner.address}</a> </td>
                <td>${diner.phone_num}</td>
                <td>${diner.dish}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    
</div>

</body>

<footer class="footer">

</footer>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</html>
