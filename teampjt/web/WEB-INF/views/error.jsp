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
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body class="custom">
<%@ include file="../common/navigation.jspf" %>

<div class="error-message">${fail}</div>
<img class="lock-image" src="/images/lock.png" alt="Lock Image">

</body>
</html>

