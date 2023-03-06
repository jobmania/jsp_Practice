

<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-03
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  그래 어서오고 ${name}  <%= request.getSession().getAttribute("name")%><br>

  나는 <%= request.getAttribute("name")%> !!


  <p> 당신의 할일 : </p>
  <ol>
    <c:forEach var="todo" items="${todos}" >
      <li>  ${todo.name} </li>
        <p> ${name}</p>
        <p> ${todo}</p>
    </c:forEach>
  </ol>

  ${todos}
</body>
</html>
