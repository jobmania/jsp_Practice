
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  int n = Integer.parseInt(request.getParameter("val"));


  for(int i = 1; i<=9; i++){
      out.println("<p> "+ i*n+ "</p>");
  }
%>