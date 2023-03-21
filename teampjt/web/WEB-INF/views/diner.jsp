<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-17
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <script>
        $(document).ready(function() {
            var currentPage = 1; // 초기 페이지 번호
            var recordsPerPage = 10; // 한 페이지당 출력될 데이터 수
            var sortOrder = "asc"; // 정렬 기본값은 오름차순

            // 초기 로딩 시 페이지 데이터 출력
            showTableData(currentPage, recordsPerPage, sortOrder);

            // 페이지 번호 클릭 시 해당 페이지 데이터 출력
            $("#pagination").on("click", "li.page-item", function() {
                currentPage = $(this).val();
                showTableData(currentPage, recordsPerPage, sortOrder);
            });

            // sort 기능 구현
            $("#sort").change(function() {
                sortOrder = $(this).val();
                showTableData(currentPage, recordsPerPage, sortOrder);
            });



            // showTableData 함수 정의
            function showTableData(currentPage, recordsPerPage, sortOrder) {
                $.ajax({
                    url: "diner", // 요청을 보낼 URL
                    type: "POST", // 요청 메소드
                    data: { // 요청 데이터
                        currentPage: currentPage,
                        recordsPerPage: recordsPerPage,
                        sortOrder: sortOrder,
                        searchKeyword: $("#bd_srch_btm_itx_").val(),
                        searchTarget: $("#search_target").val()
                    },
                    success: function(result) { // 요청 성공 시 실행될 콜백 함수
                        $("#dinerTable tbody").html(result);
                        updatePagination(currentPage, recordsPerPage, sortOrder);
                    }
                });
            }

            // updatePagination 함수 정의
            function updatePagination(currentPage, recordsPerPage, sortOrder) {
                $.ajax({
                    url: "diner/pagination", // 페이지네이션 요청을 보낼 URL
                    type: "POST", // 요청 메소드
                    data: { // 요청 데이터
                        currentPage: currentPage,
                        recordsPerPage: recordsPerPage,
                        sortOrder: sortOrder,
                        searchKeyword: $("#bd_srch_btm_itx_").val(),
                        searchTarget: $("#search_target").val()
                    },
                    success: function(result) { // 요청 성공 시 실행될 콜백 함수
                        $("#pagination").html(result);
                    }
                });
            }
        });
    </script>

</head>
<body>
<h1> 음식 추천 정보 </h1>
<a class="btn btn-primary" href="home"> 홈으로 </a>
<img src="images/homeimg.jpg" alt="식당 이미지"><br>
<div class="container" style="width:70%">


    <form action="/diner" method="post">
     <span class="btn_img itx_wrp">
    <label for="bd_srch_btm_itx_">검색</label>
     <input type="text" name="search_keyword" id="bd_srch_btm_itx_" class="bd_srch_btm_itx srch_itx" value="">
  </span>
        <span class="btn_img select">   <select name="search_target">
    <option value="name">이름</option>
    <option value="address">주소</option>
    <option value="dish">요리</option>
  </select>	</span>
        <button type="submit" class="ico_16px search">Search</button>
    </form>


    <div class="text-center">
        <ul id="pagination" class="pagination">
            <li class="page-item" value="1"><a class="page-link" href="#">1</a></li>
            <li class="page-item" value="2"><a class="page-link" href="#">2</a></li>
            <li class="page-item" value="3"><a class="page-link" href="#">3</a></li>
            <!-- 페이지 숫자를 추가할 수 있음 -->
        </ul>
    </div>


    <table class="table table-striped", id="dinerTable">
        <br>
        <caption> 음식점 리스트</caption>
        <thead>
        <tr>
            <th>음식점 이름</th>
            <th> 주소</th>
            <th> 음식점 전화번호</th>
            <th> 메인 요리</th>
        </tr>
        </thead>


        <tbody>
        <c:forEach items="${diners}" var="diner">
            <tr>
                <td>${diner.name}</td>
                <td>${diner.address}</td>
                <td>${diner.phone_num}</td>
                <td>${diner.dish}</td>
                <td><a class="btn btn-primary" href="map?address=${diner.address}">상세 보기</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</div>


</body>

</html>
