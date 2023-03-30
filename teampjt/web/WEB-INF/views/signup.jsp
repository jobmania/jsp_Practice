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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <%@ include file="../common/style.jspf"%>
</head>
<body>
<%@ include file="../common/navigation.jspf"%>

<%-- 추가적으로 ajax 구현 --%>

<div class="container" style="width:50%">
    <h1 id="subject"> 회원가입 </h1>
    <form action="signup" method="post">
        <p>
            <font color="red">${error}</font>
        </p>

        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="username">
            <label for="floatingInput">이메일 형식으로 입력하세요</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password"  name="password">
            <label for="floatingPassword">비밀번호 </label>
        </div>
        <br>
        <div class="form-floating">
            <input type="password" class="form-control" id="checkpassword" placeholder="Password" name="checkpassword">
            <label for="checkpassword">비밀번호 확인</label>
        </div>


<%--        Email: <input class="form-control" type="email" name="username"/> <br>--%>
<%--        Password:<input class="form-control" type="password" name="password"/>--%>
<%--        CheckPassword:<input class="form-control" type="password" name="checkpassword"/>--%>

        <br>

        <input class="form-control" type="submit" value="회원가입 신청" style="width: 30%;">
    </form>
    <%@ include file="../common/footer.jspf"%>
</div>
</body>


</html>
