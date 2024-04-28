<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<meta name="description" content="">

    <link rel="stylesheet" href="/resources/css/login/style.css">
    <link rel="stylesheet" href="/resources/css/mintybootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/mintybootstrap.css">
    <link rel="stylesheet" href="/resources/css/ifta.css">
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>--%>

    <title>회원가입</title>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body style="background-color:#fdfdfd ">
<%@ include file="/WEB-INF/common/header.jsp" %>
<div class="content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-3 col-sm-8 bg-primary-subtle">
                <div class="position-sticky my-2" style="top: 2rem;">
                    <div class="p-4 mb-3 border-primary bg-light-subtle rounded text-center">
                        <h4 class="fst-italic">${sessionScope.member_id}</h4>
                        <p class="mb-0">${memberDTO.email}</p>
                    </div>
                        <div class="p-4">
                            <h4 class="fst-italic">Elsewhere</h4>
                            <ol class="list-unstyled">
                                <li><a href="#">GitHub</a></li>
                                <li><a href="#">Twitter</a></li>
                                <li><a href="#">Facebook</a></li>
                            </ol>
                        </div>
                </div>
            </div>
            <div class="col-12 col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-12">

                            <div class="py-3 align-items-center">
                                <div class="card border-primary m-2 mx-auto" style="width: 38rem; height: auto">
                                    <div class="card-body">
                                        <h4 class="card-title px-3 fw-bold">기본 정보</h4>
                                        <hr class="my-1">
<%--                                        <h5 class="card-title px-3 py-1 fw-bold">${memberDTO.name}</h5>--%>
<%--                                        <h6 class="card-subtitle mb-2 text-body-secondary px-3"><span class="material-symbols-outlined align-middle">mail</span> ${memberDTO.email}</h6>--%>
                                        <ul class="list-group list-group-flush px-3 my-2">
                                            <li class="list-group-item" style="border:none;"><h5 class="card-title fw-bold">${memberDTO.name}</h5></li>
                                            <li class="list-group-item" style="border:none;"><h6 class="card-subtitle mb-2 text-body-secondary"><span class="material-symbols-outlined align-middle">mail</span> ${memberDTO.email}</h6></li>
                                            <li class="list-group-item"><span class="material-symbols-outlined align-middle" >phone_iphone</span>${memberDTO.phone_num}</li>
                                            <li class="list-group-item"><span class="material-symbols-outlined align-middle">home</span>${memberDTO.addr1}&nbsp;${memberDTO.addr2}</li>
                                            <li class="list-group-item"><span class="material-symbols-outlined align-middle">assignment_turned_in</span> 평생 회원 : ${memberDTO.forever_yn}</li>
                                            <li class="list-group-item"><span class="material-symbols-outlined align-middle">confirmation_number</span> 선택 사항 : ${memberDTO.option}</li>
                                            <li class="list-group-item"><span class="material-symbols-outlined align-middle">how_to_reg</span>${memberDTO.reg_date}</li>
                                            <li class="list-group-item">
                                            <div class="row justify-content-between">
                                                <div class="col">
                                                    회원정보 수정</div>
                                                <button class="col-2 text-center btn btn-outline-success h-25 w-25" style="font-size: 1rem; "
                                                onclick="window.location='/member/modify?member_id=${memberDTO.member_id}'">수정</button>
                                            </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <hr class="my-2">
                    <div class="col-md-12">

                        <div class="py-3 align-items-center">
                            <div class="card border-primary m-2 mx-auto" style="width: 38rem; height: auto">
                                <div class="card-body">
                                    <h4 class="card-title px-3 fw-bold">보안 설정</h4>
                                    <h6 class="card-subtitle mb-2 text-body-secondary px-3"><span class="material-symbols-outlined align-middle">password</span> 비밀번호</h6>
                                    <hr class="my-1">
                                    <ul class="list-group list-group-flush px-3 my-2">
                                        <li class="list-group-item">
                                            <div class="row justify-content-between">
                                            <div class="col"><span class="material-symbols-outlined align-middle">lock</span>
                                                비밀번호 변경</div>
                                        <button class="col-2 text-center btn btn-outline-success h-25 w-25" style="font-size: 1rem; "
                                                onclick="window.location='/member/modifyPwd?member_id=${memberDTO.member_id}'">수정</button>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="my-2">
                    <div class="col-md-12">
                        <div class="py-3 px-4 align-items-center">
                            <a href="member/delete"><p><span class="material-symbols-outlined align-middle">exit_to_app</span> 회원탈퇴</p></a>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>

<%@ include file="/WEB-INF/common/footer.jsp" %>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/main.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v55bfa2fee65d44688e90c00735ed189a1713218998793"
        integrity="sha512-FIKRFRxgD20moAo96hkZQy/5QojZDAbyx0mQ17jEGHCJc/vi0G2HXLtofwD7Q3NmivvP9at5EVgbRqOaOQb+Rg=="
        data-cf-beacon='{"rayId":"879d448bbc1a29e5","version":"2024.4.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>



<script src="/resources/js/bootstrap.bundle.min.js"></script>

<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
</body>
</html>


