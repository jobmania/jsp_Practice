<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-02-28
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2> 구구단    </h2>
<%
  for (int i = 2; i <= 9; i++) {
    for (int j = 1; j <= 9; j++) {
      out.println( i + " *"+ j +" = " + i*j + " ");
    }%>
<br>
<%    } %>




</body>
</html>
