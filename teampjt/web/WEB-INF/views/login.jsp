
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <title> Login </title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <%@ include file="../common/style.jspf"%>
</head>


  <body>
  <%@ include file="../common/navigation.jspf"%>
<%-- 추가적으로 ajax 구현--%>

  <div class="container" style="width:50%">
    <form action="/login" method="post">
      <p>
        <font color="red">${error}</font>
        <font color="black">${ok==null?"":"회원가입완료"}</font>
      </p>

      <div class="form-floating mb-3">
        <input class="form-control" id="floatingInput" type="email" name="username"/> <br>
        <label for="floatingInput">Email address</label>
      </div>

      <div class="form-floating">
        <input class="form-control" id="floatingPassword" type="password" name="password"/>
        <label for="floatingPassword">Password</label>
      </div>

      <br>
      <input class="form-control" type="submit" value="로그인" style="width: 30%;">

    </form>
    <button type="button" class="btn btn-outline-success" onclick="location.href='/signup'">회원가입</button>
    <%@ include file="../common/footer.jspf"%>
  </div>


  </body>

</html>
