<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="user" class="beans.User"></jsp:useBean>
<jsp:setProperty name="user" property="*"></jsp:setProperty>


    <p> 유저 : <%= user.getUser()%></p>
    <p> 이메일 : <%= user.getEmail()%></p>
    <p> 비밀번호 : <%= user.getPassword()%></p>


</body>
</html>
