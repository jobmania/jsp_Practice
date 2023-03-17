<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-16
  Time: 오전 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 창 </title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>
<h1> 회원가입 !! </h1>


<div class="container" style="width:50%">
    <form action="signup" method="post">
        <p>
            <font color="red">${error}</font>
        </p>
        Email: <input class="form-control" type="email" name="username"/> <br>
        Password:<input class="form-control" type="password" name="password"/>
        CheckPassword:<input class="form-control" type="password" name="checkpassword"/>

        <input class="form-control" type="submit" value="회원가입">
    </form>
</div>
</body>

<footer class="footer">

</footer>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</html>
