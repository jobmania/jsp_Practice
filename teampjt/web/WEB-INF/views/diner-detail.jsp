<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-20
  Time: 오후 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>
<%@ include file="../common/navigation.jspf"%>
<h1> 음식 추천 정보 </h1>
<a class="btn btn-primary" href="home"> 홈으로 </a>
<div class="container" style="width:70%">

    <h3> 위치 정보 </h3>
    <img src="data:image/png;base64,${mapImage}" alt="지도 이미지">

    <h3> 리뷰리스트</h3>



    <form id="sendReview" action="/review/write" method="get">
        <input type="hidden" name="board_id" value="${diner.id}">
        <input type="hidden" name="board_target" value="diner">
        <button type="submit"  class="btn btn-primary"> 리뷰작성하기 </button>
    </form>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>음식점 이름 </th>
            <th> 주소 </th>
            <th> 음식점 전화번호</th>
            <th> 메인 요리 </th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <td>${diner.name}</td>
            <td>${diner.address}</td>
            <td>${diner.phone_num}</td>
            <td>${diner.dish}</td>
        </tr>

        </tbody>
    </table>


</div>

</body>

</html>