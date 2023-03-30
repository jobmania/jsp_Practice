<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-30
  Time: 오전 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cafe</title>
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
  </style>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>

<div class="container" style="width:70%">
  <h1> 카페 추천 정보 </h1>
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
    <input type="hidden" name="board_id" value="${cafe.id}">
    <input type="hidden" name="board_target" value="cafe">
    <button type="submit"  class="btn btn-primary"> 리뷰작성하기 </button>
  </form>

  <table class="table table-striped">
    <thead>
    <tr>
      <th>카페 이름 </th>
      <th> 주소 </th>
      <th> 카페 전화번호</th>

    </tr>
    </thead>
    <tbody>

    <tr>
      <td>${cafe.name}</td>
      <td>${cafe.address}</td>
      <td>${cafe.phone_num}</td>

    </tr>

    </tbody>
  </table>

  <%@ include file="../common/footer.jspf"%>
</div>

</body>
</html>
