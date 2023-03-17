<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오전 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> 겟 빈 페 이  지 </h1>
<%--  scope : session 브라우저에서 공유--%>
<jsp:useBean id="user" class="beans.User" scope="request"></jsp:useBean>


<p> 유저 객체의 email = <%= user.getEmail() %> </p>
<p> 유저 객체의 password = <%= user.getPassword()%>  </p>
</body>
</html>
