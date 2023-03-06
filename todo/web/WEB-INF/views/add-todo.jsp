<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-06
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>


<div class="container">
  새로 할일 작성하기: <p style="color: crimson">${error}</p>
  <form method="POST" action="add-todo.do">
    <fieldset class="form-group">
      <label>할일 설명</label> <input name="todo" type="text"
                                  class="form-control" /> <BR />
    </fieldset>
    <fieldset class="form-group">
      <label>종 류</label> <input name="category" type="text"
                                class="form-control" /> <BR />
    </fieldset>
    <input name="add" type="submit" class="btn btn-success" value="추가하기" />
  </form>
</div>

<%@ include file="../common/footer.jspf"%>
