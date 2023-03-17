
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>로그인 페이지</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  </head>
  <body>


  <div class="container" style="width:50%">
    <form action="login" method="post">
      <p>
        <font color="red">${error}</font>
        <font color="black">${ok==null?"":"회원가입완료"}</font>

      </p>
      Name: <input class="form-control" type="email" name="username"/> <br>
      Password:<input class="form-control" type="password" name="password"/>
      <input class="form-control" type="submit" value="로그인">
    </form>
    <a href="signup">회원가입</a>
  </div>


  </body>

  <footer class="footer">

  </footer>

  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</html>
