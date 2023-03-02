<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%-- 폼 태그 안에 입력창에 데이터 입력후 submit버튼 클릭시 폼태그의 서버주소로 http 메소드 방식으로 전송됨--%>
<%--에러메시지 --%>

<%= request.getAttribute("errorMessage") %>
<div style="background-color: crimson">${errorMessage}</div>

<form action="/Controller" method="post">
    이메일 : <input type="email" name="email"> <br>
    패스워드 : <input type="password" name="password"> <br>
    <input type="submit" value="전송">


</form>

</body>
</html>
