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
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>admin >> noticeList</title>

    <%--  header 부트스트랩  --%>
    <link href="/resources/mintybootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper">
        <button class="btn btn-primary" id="sidebarToggle">
            <i class="fa fa-arrow-left" aria-hidden="true" style="display: block;"></i>
            <i class="fa fa-arrow-right" aria-hidden="true" style="display: none;"></i>
        </button>
        <!-- Page content-->
        <div class="container py-h">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-uppercase mb-0 text-center">도서</h5>
                        </div>
                        <div class="table-responsive">
                            <table class="table no-wrap user-table mb-0">
                                <thead>
                                <tr>
                                    <th scope="col" class="border-0">선택</th>
                                    <th scope="col" class="border-0">번호</th>
                                    <th scope="col" class="border-0">아이디</th>
                                    <th scope="col" class="border-0">이름</th>
                                    <th scope="col" class="border-0" >이메일</th>
                                    <th scope="col" class="border-0">평생회원</th>
                                    <th scope="col" class="border-0">선택사항</th>
                                    <th scope="col" class="border-0">포인트</th>
                                    <th scope="col" class="border-0">회원상태</th>
                                    <th scope="col" class="border-0">가입일</th>
                                    <th scope="col" class="border-0">탈퇴일</th>
                                    <th scope="col" class="border-0">탈퇴일</th>
                                    <th scope="col" class="border-0">탈퇴일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${!empty productList}">
                                        <c:forEach items="${productList}" var="list">
                                            <tr>
                                                <td class="pl-4">
                                                    <label class="control control--checkbox">
                                                        <input type="checkbox" name="select" id="select" value="">
                                                        <div class="control__indicator"></div>
                                                    </label>
                                                </td>
                                                <td class="pl-4">${list.product_idx}</td>
                                                <td>${list.product_name}</td>
                                                <td>${list.publisher}</td>
                                                <td>${list.author}</td>
                                                <td>${list.reg_date}</td>
                                                <td>${list.page_cnt}</td>
                                                <td>${list.price}</td>
                                                <td>${list.tax_yn}</td>
                                                <td>${list.publish_date}</td>
                                                <td>${list.category1}</td>
                                                <td>${list.category2}</td>
                                                <td>${list.discount}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="text-center" colspan="5">회원정보가 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="display: flex; justify-content: space-between; margin-top: 4px;">
                        <div>
                            <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2"><i class="fa fa-envelope" aria-hidden="true"></i></button>
                            <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2"><i class="fa fa-credit-card" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
