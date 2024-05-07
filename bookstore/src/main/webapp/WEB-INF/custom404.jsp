<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <title>404 Error</title>
    <meta charset="utf-8"/>
    <style>
        .noto-sans-kr {
           font-family: "Noto Sans KR", sans-serif;
           font-optical-sizing: auto;
           font-weight: 400;
           font-style: normal;
       }
        button {
            z-index: 6000;
            position: absolute;
            top : 81%;
            left: 43%;
            width: 14%;
            height:7%;
            color:white;
            border-radius: 12px;
            border: #055218 2px solid;
            background-color: #0b6500;
            cursor:pointer;
            font-size: 1rem;
        }
        button:hover {
            background-color: #0c9101;
        }
    </style>
</head>
<body>
<div style="margin:0 auto;width: 50%; height: 100%">
    <img src="/resources/img/error_img.jpg" alt="에러 이미지" style="width: 100%; height: 100%; margin: 0 auto;">
    <button class="noto-sans-kr" onclick="window.location.href='/'">메인 화면 가기</button>
</div>
<script>
    console.log(document.referrer)
</script>
</body>
</html>
