<%@ page import="dto.Book" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean>


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
    <title> 도서정보 </title>
</head>
<body>

<%@ include file="menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">도서 정보</h1>
    </div>
</div>

<%
    String id = request.getParameter("id");
    Book book = bookDAO.getBookById(id);
%>

<div class="container">
    <h4><b>[<%=book.getCategory()%>]<%=book.getName()%>
    </b></h4>
    <p><%=book.getDescription()%>
    <p><b>도서코드 : </b><span class="badge badge-danger"> <%=book.getBookId()%></span>
    <p><b>저자</b> : <%=book.getAuthor()%>
    <p><b>출판사</b> : <%=book.getPublisher()%>
    <p><b>출판일</b> : <%=book.getReleaseDate()%>
    <p><b>총 페이지수</b> : <%=book.getTotalPages()%>
    <p><b>재고수</b> : <%=book.getUnitsInStock()%>
    <h4><%=book.getUnitPrice()%>원</h4>
    <p><a href="#" class="btn btn-info">도서주문 &raquo;</a>
        <a href="books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
    <hr>
</div>


</body>
<%@ include file="footer.jsp" %>
</html>
