<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-02-28
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% for (int i = 0; i < 5; i++) { %>
  <p>이 태그는 <%=i%>!! </p>
<%           }%>
<%
    String id = request.getParameter("id");
    if(id.isEmpty()){
        out.println("유저 아이디 파라미터값 없다");
    }else {
        out.println("유저 아이디 파라미터값 "+id);
    }

%>

<% for(int i=0; i<5; i++) { %>
<p>이 태그는  5번 반복 됩니다.</p>
<% } %>
<br>


</body>
</html>
