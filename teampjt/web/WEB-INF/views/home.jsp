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
<%@ include file="../common/navigation.jspf"%>
<div class="container" style="width:80%">

    <h1> 홈화면</h1>
    <h2>  ${username} hello! </h2>
<%--    <br>--%>
<%--    <%--%>
<%--        if (request.getSession().getAttribute("username") == null) {--%>
<%--            out.write("<a href=\"login\">로그인</a>");--%>
<%--        } else {--%>
<%--            out.write("<a href=\"logout\">로그아웃</a>");--%>
<%--        }--%>
<%--    %>--%>
<%--    <br>--%>
    <img src="images/homeimg.jpg" alt="지도 이미지" width="20%">

</div>

</body>

<footer class="footer">

</footer>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

</html>
