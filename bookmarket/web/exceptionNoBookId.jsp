
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <title>도서 아이디 오류</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h2 class="alert alert-danger">해당 도서가 존재하지 않습니다.</h2>
    </div>
</div>
<div class="container">
<%--    <p><%=request.getRequestURL()%>?<%=request.getQueryString()%>--%>
    <p><%=request.getContextPath()%>/book.jsp?<%=request.getQueryString()%>
    <p><a href="books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a>
</div>
</body>
</html>