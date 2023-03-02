<%@ page import="beans.User" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오전 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--객체 생성  : jsp 빈으로 user 객체를 만든 것과 같음.--%>
<%-- <jsp:useBean id="빈 이름" class="자바빈 파일의 패키지.클래스명" scope="유효범위"(page, 해당 페이지만default ) /> --%>
<jsp:useBean id="user" class="beans.User" scope="request"></jsp:useBean>
<%  User user2 = new User();  %>
<%--<jsp:setProperty name="빈 이름" property="필드명" value="값" />--%>
<!-- user객체에 값을 setEmail()메소드 사용과 같음 , id와 name 동일해야함.. -->
<jsp:setProperty property="email" name="user" value="abc@abc.com"/>
<jsp:setProperty property="password" name="user" value="abcdefg12!@"/>

<p> 유저 객체의 email = <%= user.getEmail() %> </p>
<p> 유저 객체의 password = <%= user.getPassword()%>  </p>

<%--forward 는 같은 request로 처리되며 페이지 이동 --%>
<%--<jsp:forward page="getBean.jsp"></jsp:forward>--%>

<%-- redirect 즉 새로운 요청, scope=Request에서는  getBean에서는 null--%>
<% response.sendRedirect("getBean.jsp"); %>

</body>
</html>
