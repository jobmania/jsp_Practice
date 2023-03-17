<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-17
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>Title</title>
</head>
<body>
<h1> 음식 추천 정보 </h1>
<a class="btn btn-primary" href="home"> 홈으로 </a>
<div class="container" style="width:70%">

  <table class="table table-striped">
    <img src="images/homeimg.jpg" alt="지도 이미지">
    ${findAddress.x}
    ${findAddress.y}
    <img src="https://naveropenapi.apigw.ntruss.com/map-static/v2/raster-cors?w=300&h=300&center=${findAddress.x},${findAddress.y}&level=16&X-NCP-APIGW-API-KEY-ID={ywu2wqjm9z}">
    <br>
    <caption> 음식점 리스트 </caption>
    <thead>
    <tr>
      <th>음식점 이름 </th>
      <th> 주소(클릭 시 지도) </th>
      <th> 음식점 전화번호</th>
      <th> 메인 요리 </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${diners}" var="diner">
      <tr>
        <td>${diner.name}</td>
        <td> <a class="btn btn-primary" href="map?address=${diner.address}">${diner.address}</a> </td>
        <td>${diner.phone_num}</td>
        <td>${diner.dish}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>


</div>

</body>


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</html>
