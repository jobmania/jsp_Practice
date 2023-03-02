<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-02-28
  Time: 오전 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    int x = 7;
%>
<br>
<%= x  %>

<%! // 전역
  int number = 100;
  String str = " 자바 서버 페이지";
  private String getInfo(){
      return "리턴";
  }
%>

<%= getInfo()%>
<br>
<%= number%>
<br>
<%= str %>
</body>
</html>
