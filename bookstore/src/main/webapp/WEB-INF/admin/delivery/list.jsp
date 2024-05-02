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

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link href="/resources/css/admin/styles.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
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
                            <h5 class="card-title text-uppercase mb-0 text-center">배송관리</h5>
                        </div>
                        <div class="table-responsive">
                            <table class="table no-wrap user-table mb-0">
                                <thead>
                                <tr>
                                    <th scope="col" class="border-0">번호</th>
                                    <th scope="col" class="border-0">운송장번호</th>
                                    <th scope="col" class="border-0">배송회사</th>
                                    <th scope="col" class="border-0">수취자 이름</th>
                                    <th scope="col" class="border-0">수취자 휴대폰번호</th>
                                    <th scope="col" class="border-0">우편번호</th>
                                    <th scope="col" class="border-0">수취자 주소</th>
                                    <th scope="col" class="border-0">배송상태</th>
                                    <th scope="col" class="border-0">배송시작일</th>
                                    <th scope="col" class="border-0">배송도착일</th>
                                    <th scope="col" class="border-0">주문자 아이디</th>
                                    <th scope="col" class="border-0">결제번호</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${!empty deliveryList}">
                                        <c:forEach items="${deliveryList}" var="list">
                                            <tr>
                                                <td class="pl-4"><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.delivery_idx}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.tracking_num}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.delivery_company}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.receiver_name}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.receiver_phone_num}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.zipcode}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.receiver_addr}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.delivery_state}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.start_date}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.arrive_date}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.member_id}</a></td>
                                                <td><a href="/admin/delivery/modify?idx=${list.delivery_idx}">${list.pay_idx}</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="text-center" colspan="5">배송정보가 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
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
