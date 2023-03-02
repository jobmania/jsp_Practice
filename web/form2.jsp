<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<!-- action 주소는 domain 주소 포트번호 뒤부터 입력 -->
<form action="formHandler.jsp" method="get">

    <%--   placeholder 속성은 입력 필드에 사용자가 적절한 값을 입력할 수 있도록 도와주는 짧은 도움말을 명시--%>
    <input type="text" name="user" placeholder="user"><br>
    <input type="text" name="email" placeholder="email">
    <input type="password" name="password" placeholder="password"><br>
    <input type="submit" value="전송">
</form>
</body>
</html>
