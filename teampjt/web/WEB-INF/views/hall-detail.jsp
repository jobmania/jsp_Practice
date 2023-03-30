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
    <title>Diner</title>
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
        .map img {
            width: 100%; /* 이미지의 가로 너비를 100%로 설정합니다. */
            height: 500px; /* 이미지의 세로 높이를 200px로 설정합니다. */
            object-fit: contain; /* 이미지를 가득 채우도록 설정합니다. */
        }


        #subject{
            position: center;
            text-align: center;
        }

        .container{
            position: relative;
            width: 80%;
        }

        footer {
            width: 100%;
            height: 90px;
            bottom: 0px;
            position: relative;
            border-top: 1px solid #c4c4c4;
            padding-top: 15px;
            color: #808080;
            font-size: 11px;

        }

        footer a {
            display: inline-block;
            margin: 0 20px 10px 20px;
            color: #808080; font-size: 11px;
        }

        footer a:visited {
            color: #808080;
        }

        footer p {
            margin-top: 0; margin-bottom: 0;
        }

        footer p span {
            display: inline-block;
            margin-left: 20px;
        }

        #information {
            font-size: small;
        }
    </style>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>

<div class="container" style="width:70%">
    <h1 > 공연 추천 정보 </h1>
    <div class="wrapper">
        <div class="map">
            <h3> 위치 정보 </h3>
            <img src="data:image/png;base64,${mapImage}" alt="지도 이미지" onerror="this.onerror=null;this.src='/images/placeholder.png';">
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
        <input type="hidden" name="board_id" value="${hall.id}">
        <input type="hidden" name="board_target" value="hall">
        <button type="submit"  class="btn btn-primary"> 리뷰작성하기 </button>
    </form>

    <table class="table table-striped" id="information">
        <thead>
        <tr>
            <th> 공연 이름 </th>
            <th> 주소 </th>
            <th> 종류 </th>
            <th> 개관일 </th>
            <th> 폐관일 </th>
            <th> 가격 </th>
            <th> 전화번호 </th>
            <th> 주소 </th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <td>${hall.name}</td>
            <td>${hall.address}</td>
            <td>${hall.type}</td>
            <td>${hall.openDate}</td>
            <td>${hall.closeDate}</td>
            <td>${hall.price}</td>
            <td>${hall.phoneNum}</td>
            <td>${hall.homepage}</td>
        </tr>

        </tbody>
    </table>

    <%@ include file="../common/footer.jspf"%>
</div>

</body>

</html>
