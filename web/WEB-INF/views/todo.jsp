
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-03
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<H1>Welcome ${name} 님</H1>
  <div>
    Your Todos are

    <ol>
      <c:forEach items="${todos}" var="todo">
        <li>${todo.name} <a href="delete-todo?todo=${todo.name}" style="background-color: lightcoral"> 삭제 </a>  </li>
      </c:forEach>
    </ol>

    <p>${error}</p>
    <form method="POST" action="/todo.do">
      New Todo : <input name="todo" type="text" /> <input name="add" type="submit" />
    </form>

  </div>

</body>
</html>
