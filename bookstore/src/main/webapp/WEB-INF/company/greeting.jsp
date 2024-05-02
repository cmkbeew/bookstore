<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <title>회사소개</title>
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/css/ifta.css">
    <%--  header 부트스트랩  --%>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link href="/resources/css/login/style.css" rel="stylesheet" />

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp" %>
<div class="mt-5">
    <div class="row  justify-content-center">
    <ul class="nav nav-underline mb-3 nav-justified" id="pills-tab" role="tablist" style="width:500px">
        <li class="nav-item" role="presentation">
            <button class="nav-link active text-dark" id="pills-company-tab" data-bs-toggle="pill" data-bs-target="#pills-company" type="button" role="tab" aria-controls="pills-home" aria-selected="true">회사개요</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link text-dark" id="pills-info-tab" data-bs-toggle="pill" data-bs-target="#pills-info" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">연혁</button>
        </li>
    </ul>
    </div>
    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active" id="pills-company" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
            <img src="/resources/img/company_.png" class="w-100" style="width: 100%">
        </div>
        <div class="tab-pane fade show" id="pills-info" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
            <img src="/resources/img/info.png" class="w-100" style="width: 100%">
        </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp" %>
</body>
</html>
