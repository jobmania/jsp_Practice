<%-- Created by IntelliJ IDEA. User: admin Date: 2023-03-06 Time: 오후 1:54 To change this template
use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<html>
<link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
        crossorigin="anonymous"
/>
<head>
    <title>$Title$</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<%!
    String greeting = "도서 웹 쇼핑 몰!";
    String tagline = "Welcome to Book Market!";
%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3"><%=greeting%>
        </h1>
    </div>
</div>
<div class="container">
    <div class="text-center">
        <h3><%=tagline%>
        </h3>
    </div>
</div>
</body>

<%@ include file="footer.jsp" %>


</html>
