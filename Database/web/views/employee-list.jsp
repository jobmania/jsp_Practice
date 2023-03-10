
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
    <title>Employee Directory</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://cdn.datatables.net/v/dt/dt-1.13.3/datatables.min.css" rel="stylesheet"/>

</head>
<body>
<%
    String email = (String) session.getAttribute("email");
    if(email == null){
        response.sendRedirect("index.jsp");
    }
%>

<div class = "container">

    <h1>Employee Directory</h1>
    <hr/>

    <p>${note}</p>

    <p>
<%--        <button class = "btn btn-primary" onclick="window.location.href = '/views/employee-form.jsp'">직원 추가</button>--%>
        <a class="btn btn-primary" href="views/employee-form.jsp">직원 추가</a>
    </p>

    <table id="datatable" class = "table table-striped table-bordered" >
        <thead>
        <tr class = "thead-dark">
            <th>Name</th>
            <th>Date of birth</th>
            <th>Department</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${list}" var="employee">
            <tr>
                <td>${employee.name}</td>
                <td>${employee.dob}</td>
                <td>${employee.department}</td>
                <td>
                    <a href = "${pageContext.request.contextPath}/EmployeeController?action=EDIT&id=${employee.id}">Edit</a>
                    <a href = "${pageContext.request.contextPath}/EmployeeController?action=DELETE&id=${employee.id}">Delete</a>
                </td>
            </tr>

        </c:forEach>
        </tbody>

    </table>
    <a class="btn btn-danger" href="/logout.jsp"> 로그 아웃 </a>
</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%--데이터 테이블 사용 --%>
<script src="https://cdn.datatables.net/v/dt/dt-1.13.3/datatables.min.js"></script>
<script>
    $(document).ready(function(){
        $("#datatable").DataTable({
            'language': {
                'lengthMenu': '표시할 줄수 선택    _MENU_',
                'search': '검색',
                'paginate': { 'previous': '이전', 'next': '다음' },
                "info": "페이지 _PAGE_ / _PAGES_",
                'infoEmpty': '데이터가 없습니다.',
                "infoFiltered": "(전체 페이지 _MAX_ 에서 검색)",
                'thousands': ','
            },
            'lengthMenu': [5, 10, 25],
            'pageLength': 5,
            'ordering': false,
            'stateSave': true
        });
    })

</script>
</html>