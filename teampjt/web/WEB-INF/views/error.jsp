<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-27
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
    <style>
        /* 배경색 */
        body.custom {
            background-color: darksalmon;
            position: relative;
        }

        /* 글자 스타일 */
        .error-message {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            color: #FF5733;
        }

        /* 자물쇠 이미지 */
        .lock-image {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20%;
            transform: translate(-50%, -100%);
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body class="custom">
<%@ include file="../common/navigation.jspf" %>

<div class="error-message">${fail}</div>
<img class="lock-image" src="/images/lock.png" alt="Lock Image">

</body>
</html>

