<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-02-28
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
  String user = request.getParameter("user");
  String id = request.getParameter("id");

  out.println("유저 이름 파라미터 값 : "+user + "<br>");
  out.println("유저 아이디 파라미터값 : "+id);

%>

</body>
</html>
