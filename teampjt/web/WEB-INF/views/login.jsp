
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>로그인 페이지</title>
  </head>
  <body>


  <div class="container" style="width:50%">
    <form action="login" method="post">
      <p>
        <font color="red">${error}</font>
        <font color="red">${ok}</font>
      </p>
      Name: <input class="form-control" type="email" name="username"/> <br>
      Password:<input class="form-control" type="password" name="password"/>
      <input class="form-control" type="submit" value="로그인">
    </form>
  </div>
  <a href="signup">회원가입</a>

  </body>
</html>
