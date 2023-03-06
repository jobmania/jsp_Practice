<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<jsp:useBean id="user1" class="beans.User" scope="page"></jsp:useBean>
<%--value 값이 없을 경우 파라미터로 입력을 받는다. --%>
<jsp:setProperty property="*" name="user1"/>

<%-- http://localhost:8080/beanParam.jsp?email=xaxa&password=power123 --%>
이메일 : <%=user1.getEmail() %>
패스워드 : <%=user1.getPassword() %>




</body>
</html>
