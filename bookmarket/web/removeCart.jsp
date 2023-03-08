<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.Book" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />

<%
  String id = request.getParameter("id");
  if (id == null || id.trim().equals("")) {
    response.sendRedirect("books.jsp");
    return;
  }

  Book book = bookDAO.getBookById(id);
  if (book == null) {
    response.sendRedirect("./exceptoinNoBookId.jsp");
  }

  ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
  Book removeBook = null;
  for (int i = 0; i < cartList.size(); i++) {
    removeBook = cartList.get(i);
    if (removeBook.getBookId().equals(id)) {
      cartList.remove(removeBook);
    }
  }

  response.sendRedirect("cart.jsp");
%>