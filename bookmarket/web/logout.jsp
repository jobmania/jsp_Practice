<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-07
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  session.invalidate();
  response.sendRedirect("./login.jsp?error=1");
%>