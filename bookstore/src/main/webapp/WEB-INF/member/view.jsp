<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-04-25
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>myInfo</title>

    <%--    &lt;%&ndash;  header 부트스트랩  &ndash;%&gt;--%>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />--%>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>--%>
    <%--    <link href="/resources/css/admin/styles.css" rel="stylesheet" />--%>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">--%>
    <%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />--%>
    <%--    &lt;%&ndash; list 부트스트랩   &ndash;%&gt;--%>
    <%--    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />--%>
    <%--    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">--%>

    <%--  header 부트스트랩  --%>
    <link href="/resources/mintybootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet"/>

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">


</head>
<body style="padding-bottom: 0px; background-color: #eeeeee;">
<%@ include file="/WEB-INF/common/header.jsp" %>
<main class="container" id="wrapper">
    <div id="page-content-wrapper">
        <div class="container">
            <div class="row g-5">
                <div class="col-md-3" style="background-color: #e4f3ef">
                    <%@ include file="/WEB-INF/common/sidebar.jsp" %>
                </div>
                <div class="col-md-9">
                    <h3 class="pb-4 mb-4 fst-italic border-bottom"></h3>
                    <article>
                        <div class="card border-primary m-2 mx-auto"
                             style="width: 38rem; height: auto; box-shadow: 0 5 5 5">
                            <div class="card-body">
                                <h4 class="card-title px-3 fw-bold">기본 정보</h4>
                                <hr class="my-1">
                                <ul class="list-group list-group-flush px-3 my-2">
                                    <li class="list-group-item" style="border:none;"><h5
                                            class="card-title fw-bold">${memberDTO.name}</h5></li>
                                    <li class="list-group-item" style="border:none;"><h6
                                            class="card-subtitle mb-2 text-body-secondary"><span
                                            class="material-symbols-outlined align-middle">mail</span> ${memberDTO.email}
                                    </h6></li>
                                    <li class="list-group-item"><span class="material-symbols-outlined align-middle">phone_iphone</span>${memberDTO.phone_num}
                                    </li>
                                    <li class="list-group-item"><span class="material-symbols-outlined align-middle">home</span>${memberDTO.addr1}&nbsp;${memberDTO.addr2}
                                    </li>
                                    <li class="list-group-item"><span class="material-symbols-outlined align-middle">assignment_turned_in</span>
                                        평생 회원 : ${memberDTO.forever_yn}</li>
                                    <li class="list-group-item"><span class="material-symbols-outlined align-middle">confirmation_number</span>
                                        선택 사항 : ${memberDTO.option}</li>
                                    <li class="list-group-item"><span class="material-symbols-outlined align-middle">how_to_reg</span>${memberDTO.reg_date}
                                    </li>
                                    <li class="list-group-item">
                                        <div class="row justify-content-between">
                                            <div class="col">
                                                회원정보 수정
                                            </div>
                                            <button class="col-2 text-center btn btn-outline-success h-25 w-25"
                                                    style="font-size: 1rem; "
                                                    onclick="window.location='/member/modify?member_id=${memberDTO.member_id}'">
                                                수정
                                            </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <hr class="my-2">
                        <div class="col-md-12">
                            <div class="py-3 align-items-center">
                                <div class="card border-primary m-2 mx-auto" style="width: 38rem; height: auto">
                                    <div class="card-body">
                                        <h4 class="card-title px-3 fw-bold">보안 설정</h4>
                                        <h6 class="card-subtitle mb-2 text-body-secondary px-3"><span
                                                class="material-symbols-outlined align-middle">password</span> 비밀번호</h6>
                                        <hr class="my-1">
                                        <ul class="list-group list-group-flush px-3 my-2">
                                            <li class="list-group-item">
                                                <div class="row justify-content-between">
                                                    <div class="col"><span
                                                            class="material-symbols-outlined align-middle">lock</span>
                                                        비밀번호 변경
                                                    </div>
                                                    <button class="col-2 text-center btn btn-outline-success h-25 w-25"
                                                            style="font-size: 1rem; "
                                                            onclick="window.location='/member/modifyPwd?member_id=${memberDTO.member_id}'">
                                                        수정
                                                    </button>
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
                                <form name="delFrm" id="delFrm" action="/member/delete" method="post">
                                    <input type="hidden" name="member_id" id="member_id"
                                           value="${sessionScope.member_id}">
                                    <div class="row justify-content-between">
                                        <div class="col">
                                            <p><span class="material-symbols-outlined align-middle">exit_to_app</span>
                                                회원탈퇴</p></div>
                                        <button class="col-2 text-center btn btn-outline-danger h-25 w-25" id="delBtn"
                                                style="font-size: 1rem; ">회원 탈퇴
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="/WEB-INF/common/footer.jsp" %>
<script>
    document.getElementById("delBtn").addEventListener("click", (e) => {
        if (confirm('정말 탈퇴하시겠습니까?')) {
            alert("탈퇴되었습니다.")
            document.getElementById("delFrm").submit();
        } else {
            e.preventDefault();
            return false;
        }
    });
</script>
</body>
</html>
