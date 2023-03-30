<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-16
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <title>HOME</title>

    <style>

        .box {
            height: 100px;
            border:1px solid silver;
        }

        .grid {
            background-size: 10px, 30px, 10px 10px, 30px 30px;
            background-image: linear-gradient(90deg, #00000004 1px, transparent 1px), linear-gradient(90deg, #00000004 1px, transparent 1px), linear-gradient(#00000004 1px, transparent 1px), linear-gradient(#00000004 1px, transparent 1px);
        }
        #carouselExampleControls {
            margin: 10px auto;
            position: center;
        }



        #subject{
            position: center;
            text-align: center;
        }

        .container{
            position: relative;
            width: 80%;
        }

        footer {
            width: 100%;
            height: 90px;
            bottom: 0px;
            position: relative;
            border-top: 1px solid #c4c4c4;
            padding-top: 15px;
            color: #808080;
            font-size: 11px;

        }

        footer a {
            display: inline-block;
            margin: 0 20px 10px 20px;
            color: #808080; font-size: 11px;
        }

        footer a:visited {
            color: #808080;
        }

        footer p {
            margin-top: 0; margin-bottom: 0;
        }

        footer p span {
            display: inline-block;
            margin-left: 20px;
        }
    </style>
</head>
<body class="box grid">
<%@ include file="../common/navigation.jspf"%>
<div class="container" >
    <h1 id="subject"> 종합  리뷰  게시판 </h1>

    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel"  style="width: 50%; max-width: 50%;">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="/diner"><img src="/images/spring.png" class="d-block w-100" alt="..."></a>
            </div>
            <div class="carousel-item">
                <a href="/cafe"><img src="/images/docker.png" class="d-block w-100" alt="..."></a>
            </div>
            <div class="carousel-item">
                <a href="/hall"><img src="/images/git.png" class="d-block w-100" alt="..."></a>
            </div>
            <div class="carousel-item">
                <a href="/library"><img src="/images/aws.png" class="d-block w-100" alt="..."></a>
            </div>
            <div class="carousel-item">
                <a href="/gym"><img src="/images/html.png" class="d-block w-100" alt="..."></a>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <%@ include file="../common/footer.jspf"%>
</div>



</body>

</html>
