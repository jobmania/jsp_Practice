<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.Book" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />

<%  //하나의 상품
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("books.jsp");
        return; // id x or id ="" 도서목록으로...
    }

    Book book = bookDAO.getBookById(id);
    if (book == null) {
        response.sendRedirect("./exceptionNoBookId.jsp");
    }

/*	ArrayList<Book> goodsList = bookDAO.getAllBooks();
	Book goods = new Book();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getBookId().equals(id)) {
			break;
		}
	}*/

    ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartlist");
    if (list == null) {
        list = new ArrayList<Book>();
        session.setAttribute("cartlist", list);
    }

    boolean isInCart = false;  // 장바구니에 상품이 있는지 없는지 판별..
    Book cartBook = null;
    for (Book value : list) {
        cartBook = value;
        if (cartBook.getBookId().equals(id)) {
            isInCart = true;
            int newQuantity = cartBook.getQuantity() + 1;
            cartBook.setQuantity(newQuantity);
        }
    }

    if (!isInCart) {
        book.setQuantity(1);
        list.add(book);
    }

    response.sendRedirect("book.jsp?id=" + id);
%>