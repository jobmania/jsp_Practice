<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean>


<%-- Created by IntelliJ IDEA. User: admin Date: 2023-03-06 Time: 오후 1:54 To change this template
use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<html>
<link
        rel="stylesheet"
        href="resources/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
        crossorigin="anonymous"
/>
<head>
    <title> 도서목록 </title>
</head>
<body>

<%@ include file="menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">도서 목록</h1>
    </div>
</div>

<%
    ArrayList<Book> listOfBooks = bookDAO.getListOfBooks();
%>

<div class="container">
    <%
        for (int i = 0; i < listOfBooks.size(); i++) {
            Book book = listOfBooks.get(i);
    %>
    <div class="row">
        <div class="col-md-3"  align="center">
            <img src="/upload/<%=book.getFilename()%>" style="width:50%">
        </div>
        <div class="col-md-7">
            <p><h5><b>[<%=book.getCategory()%>] <%=book.getName()%></b></h5>
            <p style="padding-top: 20px"><%=book.getDescription().substring(0, 100)%>...
            <p><%=book.getAuthor()%> | <%=book.getPublisher()%> | <%=book.getUnitPrice()%>원
        </div>
        <div class="col-md-2" style="padding-top: 70px">
            <a href="book.jsp?id=<%=book.getBookId()%>"
               class="btn btn-secondary" role="button">상세정보 &raquo;</a>
        </div>
    </div>
    <%
        }
    %>

</div>


</body>
<%@ include file="footer.jsp" %>
</html>
