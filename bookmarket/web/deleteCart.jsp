
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  session.removeAttribute("cartlist");
  response.sendRedirect("cart.jsp");
%>