<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-16
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> 홈화면</h1>
<h2> 리스트</h2>

${username} hello!
<%
    if (request.getSession().getAttribute("username")==null) {
        out.write("<a href=\"login\">로그인</a>");
    }else {
        out.write("<a href=\"logout\">로그아웃</a>");
    }
%>

</body>
</html>
