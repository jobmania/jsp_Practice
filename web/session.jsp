<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<p> 세션 유지시간 (초)</p>
<%-- 1800 초 --%>
<p> <%= session.getMaxInactiveInterval() %></p>
</body>
</html>
