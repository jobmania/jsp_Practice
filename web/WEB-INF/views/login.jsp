<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-03
  Time: 오전 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- WEB-INF폴더는 외부에서 접근이 불가하다 . 내부에서만 접근가능.--%>
엄준식 is alive !!!
<br>
 <form action="/login.do" method="post">
     이름 : <input type="text" name="name"> <br>
     비번 : <input type="password" name="pw"> <br>
            <input type="submit" value="입력 버튼!">
 </form>
<p style="background-color: crimson" > ${error}</p>
</body>
</html>
