<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-02-28
  Time: 오전 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> 긴 자바 코드 태그 out.print(출력값) </h1>
<%
  for (int i = 0; i < 50; i++) {
      /* br 태그 : html 창에서  한칸 띄우기 */
      out.print("<br>JSP & 서블릿: " + i);
  }

%>

</body>
</html>
