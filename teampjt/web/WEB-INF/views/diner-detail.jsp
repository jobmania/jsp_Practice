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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <style>
        .wrapper {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }
        .map, .reviews {
            flex-basis: 50%;
            padding: 10px;
        }
    </style>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>
<h1> 음식 추천 정보 </h1>
<a class="btn btn-primary" href="home"> 홈으로 </a>
<div class="container" style="width:70%">

    <div class="wrapper">
        <div class="map">
            <h3> 위치 정보 </h3>
            <img src="data:image/png;base64,${mapImage}" alt="지도 이미지">
        </div>

        <div class="reviews">


            <h3> 최근 리뷰 </h3>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>리뷰 제목</th>
                    <th>리뷰 별점</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty reviews}">
                    <tr>
                        <td colspan="5">No data available</td>
                    </tr>
                </c:if>

                <c:forEach items="${reviews}" var="review" varStatus="status">
                    <tr>
                        <td>${review.subject}</td>
                        <td><c:forEach begin="1" end="${review.stars}">
                            ⭐
                        </c:forEach></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>




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
