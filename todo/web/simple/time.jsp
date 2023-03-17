<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-02-27
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1> 현재 날짜 </h1>
<%-- 화면에 표시하는 한줄 자바코드 태그, 한줄은 바로 출력됨.   --%>
    <%= new Date() %>
    Date today = new Date();


<%-- 여러줄 자바코드--%>
<%
  // 여러줄 자바코드 ( 출력시 out객체로 출력)
  int x = 10;
  int y = 20 ;
  out.print(x+y);
%>
</body>
</html>
