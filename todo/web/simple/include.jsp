<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-02-28
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 파일 가져 오기 </title>
</head>
<body>
<!-- 정적 include : 미리 컴파일해둠 , 어쩌다 한번 바꾸는 파일 -->
<%@ include file="../copyright.txt" %>
<br>
<br>
<%--동적 include : 페이지를 요청할때마다 새로고침 , 자주 수정하는 파일 --%>
<jsp:include page="../update.txt" />
<h1> 구구단!</h1>
<jsp:include page="gugudan.jsp" />

</body>
</html>
