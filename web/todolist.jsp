<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-02
  Time: 오후 2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- step1 : HTML FORM 작성--%>
<form action="todolist.jsp" method="get">
    할일 추가 : <input type="text" name="theItem">
    <input type="submit" value="Submit 버튼">
</form>
<!-- Step 1.5: 입력 받은 아이템을 테스트 출력 -->
<%= request.getParameter("theItem")%>

<!-- Step 2: To do 리스트에 새 아이템 추가 -->
<%
  // 세션에 저장된 todo리스트를 items에 입력 ( ArrayList )
  List<String> items = (List<String>) session.getAttribute("myToDoList");

  // 만약에 myToDoList 가 존재하지 않는다면 새로 만들기
  if (items == null) {
    items = new ArrayList<String>();
  }

  // 만약 빈값(공백)을 받는다면?


// form 에 입력한 데이터를 리스트에 추가한다.
  String theItem = request.getParameter("theItem");
  if(theItem != null){

    if(theItem.trim().equals("비우기")){
      session.invalidate();
      response.sendRedirect("todolist.jsp");
    }else if(!theItem.isBlank() && !items.contains(theItem.trim())) {
      items.add(theItem.trim());
      session.setAttribute("myToDoList", items);
    }


  }

%>

<!-- Step 3: to do 리스트 출력하기 -->
<hr>
<b>To List Items:</b> <br/>

<ol>
  <%
    for (String temp : items) {
      out.println("<li>" + temp + "</li>");
    }
  %>
</ol>


</body>
</html>
