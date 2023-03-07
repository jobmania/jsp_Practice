<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-07
  Time: 오전 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>도서 등록</title>
    <link
            rel="stylesheet"
            href="resources/css/bootstrap.min.css"
    />
    <script src="./resources/js/validation.js"></script>
</head>
<body>
<%@ include file="menu.jsp"%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-4">도서 등록</h1>
    </div>
</div>

<div class="container">

    <div class="text-right">
        <a href="./logout.jsp" class="btn btn-sm btn-success pull-right">로그아웃</a>
    </div>

    <form name="newBook" action="./processAddBook.jsp"
          class="form-horizontal" method="post" enctype="multipart/form-data">
        <div class="form-group row">
            <label class="col-sm-2">도서코드</label>
            <div class="col-sm-3">
                <input type="text" id="bookId" name="bookId" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">도서명</label>
            <div class="col-sm-3">
                <input type="text" id="name" name="name" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">가격</label>
            <div class="col-sm-3">
                <input type="text" id="unitPrice" name="unitPrice"
                       class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">저자</label>
            <div class="col-sm-3">
                <input type="text" name="author" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">출판사</label>
            <div class="col-sm-3">
                <input type="text" name="publisher" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">출판일</label>
            <div class="col-sm-3">
                <input type="text" name="releaseDate" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">총페이지 수</label>
            <div class="col-sm-3">
                <input type="text" name="totalPages" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">상세정보</label>
            <div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
                              class="form-control" placeholder="100자 이상 적어주세요"></textarea>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">분류</label>
            <div class="col-sm-3">
                <input type="text" name="category" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">재고수</label>
            <div class="col-sm-3">
                <input type="text" id="unitsInStock" name="unitsInStock"
                       class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2">상태</label>
            <div class="col-sm-5">
                <input type="radio" name="condition" value="New">신규도서
                <input type="radio" name="condition" value="Old">중고도서
                <input type="radio" name="condition" value="EBook">E-Book
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">이미지</label>
            <div class="col-sm-5">
                <input type="file" name="bookImage" class="form-control">
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10 ">
                <input type="button" onclick="CheckAddBook()" class="btn btn-primary" value="등록">
            </div>
        </div>

    </form>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>