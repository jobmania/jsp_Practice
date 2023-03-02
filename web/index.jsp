<%@ page import="java.util.Date" %>
<%@ page import="gui.TextOut" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-02-27
  Time: 오전 10:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title> 기본페이지 </title>
  </head>
  <body>
  <h1>  기본페이지 </h1>
  <h1><%= new Date()%> </h1>
  <br>
  <br>1번
  <%= new TextOut().getInfo()%>
  <br>2번
  <%
    TextOut output = new TextOut();
    out.print(output.getInfo());
  %>
  </body>
</html>
