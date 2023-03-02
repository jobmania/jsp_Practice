<%@ page import="beans.Cart" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
      // get Attribute 는 저장된 객체를 꺼낼때 원래 타입으로 변환
      Cart cart = (Cart) session.getAttribute("cart");
    %>

  <h1>    장바구니 아이템 갯수 : ${cart.getTotalItems()} </h1>
<%--<%cart.getTotalItems()%> <- null 값 발생해서 error --%>
</body>
</html>
