
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jspf"%>
<%@ include file="../common/navigation.jspf"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div class="container" style="width:50%">
    <form action="login.do" method="post">
        <p>
            <font color="red">${error}</font>
        </p>
        Name: <input class="form-control" type="text" name="name"/> <br>
        Password:<input class="form-control" type="password" name="pw"/>
        <input class="form-control" type="submit" value="로그인">
    </form>
</div>

<%@ include file="../common/footer.jspf"%>
