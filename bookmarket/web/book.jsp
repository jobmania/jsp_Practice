<%@ page import="dto.Book" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean>
<%@ page errorPage="exceptionNoBookId.jsp"%>

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
    <title> 도서정보 </title>
    <script>
        function addToCart() {
            if (confirm('도서를 장바구니에 추가하시겠습니까?')) {
                document.addForm.submit();
            }
        }
    </script>
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
    <div class="row">
        <div class="col-md-4">
            <img src="/upload/<%=book.getFilename()%>" style="width: 100%"/>
        </div>
        <div class="col-md-8">
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

            <form name="addForm" action="./addCart.jsp?id=<%=book.getBookId()%>" method="post">
                <button type="button" class="btn btn-info" onclick="addToCart()">도서주문 &raquo;</button>
                <a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
                <a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
            </form>

        </div>
    </div>

    <hr>
</div>


</body>
<%@ include file="footer.jsp" %>
</html>
