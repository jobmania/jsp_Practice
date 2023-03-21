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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>
<h1> 음식 추천 정보 </h1>
<a class="btn btn-primary" href="home"> 홈으로 </a>
<img src="images/homeimg.jpg" alt="식당 이미지"><br>
<div class="container" style="width:70%">
  <form action="/diner" method="post">
     <span class="btn_img itx_wrp">
    <label for="bd_srch_btm_itx_">검색</label>
     <input type="text" name="search_keyword" id="bd_srch_btm_itx_" class="bd_srch_btm_itx srch_itx" value="">
  </span>

    <span class="btn_img select">	<select name="search_target">
    <option value="name">이름</option>
    <option value="address">주소</option>
    <option value="dish">요리</option>
  </select>	</span>


    <button type="submit" class="ico_16px search">Search</button>
  </form>





  <table class="table table-striped">


    <br>
    <caption> 음식점 리스트 </caption>
    <thead>
    <tr>
      <th>음식점 이름 </th>
      <th> 주소 </th>
      <th> 음식점 전화번호</th>
      <th> 메인 요리 </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${diners}" var="diner">
      <tr>
        <td>${diner.name}</td>
        <td>${diner.address}</td>
        <td>${diner.phone_num}</td>
        <td>${diner.dish}</td>
        <td> <a class="btn btn-primary" href="map?address=${diner.address}">상세 보기</a> </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>


</div>

</body>

</html>
