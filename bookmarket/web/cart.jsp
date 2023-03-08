<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.Book" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>장바구니</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<%
    String cartId = session.getId();  // 세션의 고유 id
%>
<body>
<%@ include file="menu.jsp"%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">장바구니</h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <table width="100%">
            <tr>
                <td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>"
                                    class="btn btn-danger">삭제하기</a></td>
            </tr>
        </table>
    </div>
    <div style="padding-top: 50px">
        <table class="table table-hover">
            <tr>
                <th>도서</th>
                <th>가격</th>
                <th>수량</th>
                <th>소계</th>
                <th>삭제</th>
                <th>주문</th>
            </tr>
            <%
                int sum = 0;
                ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
                if (cartList == null)
                    cartList = new ArrayList<Book>();

                for (int i = 0; i < cartList.size(); i++) { // 도서 리스트 하나씩 출력하기
                    Book book = cartList.get(i);
                    int total = book.getUnitPrice() * book.getQuantity();
                    sum = sum + total;
            %>
            <tr>
                <td><%=book.getBookId()%> - <%=book.getName()%></td>
                <td><%=book.getUnitPrice()%></td>
                <td><%=book.getQuantity()%></td>
                <td><%=total%></td>
                <td><a href="./removeCart.jsp?id=<%=book.getBookId()%>"
                       class="badge badge-danger">삭제</a></td>
                <td><a href="https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=<%=book.getName()%>&x=0&y=0"
                       class="badge badge-success">주문</a></td>
            </tr>
            <%
                }
            %>
            <tr>
                <th></th>
                <th></th>
                <th>총액</th>
                <th><%=sum%></th>
                <th></th>
            </tr>
        </table>
        <a href="./books.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
    </div>
    <hr>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>