<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> 반갑습니다. <%= request.getAttribute("email")%> 님 로그인 완료 </h1>
<h1> 동일한 내용입니다 . ${email} 님 로그인 완료</h1>

</body>
</html>
