
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  int n = Integer.parseInt(request.getParameter("val"));
  int total = 0;
  for(int i = 1; i<=n; i++){
    total =total+ i;
  }
  out.println(total);
%>