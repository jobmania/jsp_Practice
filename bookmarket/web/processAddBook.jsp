<%@ page import="dto.Book" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean>


<%-- Created by IntelliJ IDEA. User: admin Date: 2023-03-06 Time: 오후 1:54 To change this template
use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<%

    request.setCharacterEncoding("UTF-8");

    String realFolder = "C:\\upload"; // 웹 어플리케이션상의 절대 경로
    String encType = "utf-8"; // 인코딩 타입
    int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기5MB
    // DefaultFileRenmaePolicy 동일한 이름이 있을시 +1~
    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

    // request -> multiPartRequest로 수정.
    String bookId = multi.getParameter("bookId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String author = multi.getParameter("author");
    String publisher = multi.getParameter("publisher");
    String releaseDate = multi.getParameter("releaseDate");
    String totalPages = multi.getParameter("totalPages");
    String description = multi.getParameter("description");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");


    Enumeration files = multi.getFileNames(); //폼 요소 중 file 속성을 가진 파라미터 이름을 Enumeration 객체로 반환합니다.
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);//실제 서버상에 업로드 된 파일 이름을 String 객체로 반환


    Integer price;
    if(unitPrice.isEmpty()) price = 0;
    else price = Integer.valueOf(unitPrice);


    long stock;
    if (unitsInStock.isEmpty()) stock = 0;
    else stock = Long.valueOf(unitsInStock);

    long pages;
    //도서총페이지수 없으면 0 있으면 정수변환(Long타입)
    if (totalPages.isEmpty()) pages = 0;
    else pages = Long.valueOf(totalPages);



    Book newBook = new Book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setUnitPrice(price);
    newBook.setAuthor(author);
    newBook.setPublisher(publisher);
    newBook.setReleaseDate(releaseDate);
    newBook.setTotalPages(pages);
    newBook.setDescription(description);
    newBook.setCategory(category);
    newBook.setUnitsInStock(stock);
    newBook.setCondition(condition);
    newBook.setFilename(fileName);

    bookDAO.addBook(newBook);

    response.sendRedirect("books.jsp");
%>
