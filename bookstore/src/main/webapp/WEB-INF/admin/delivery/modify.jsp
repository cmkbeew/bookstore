<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-04-26
  Time: 오전 12:05
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

    <title>admin >> deliveryModify</title>

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
    <!-- Sidebar-->
    <div class="border-end bg-white" id="sidebar-wrapper">
        <div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
        <div class="list-group list-group-flush">
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/list?bbsName=notice">공지사항</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/list?bbsName=faq">FAQ</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/list?bbsName=qna">QnA</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/member/list">회원관리</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/product/list">도서</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/delivery/list">배송관리</a>
        </div>
    </div>
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
                            <h5 class="card-title text-uppercase mb-0" style="text-align: center;">배송관리</h5>
                        </div>
                        <div class="row text-left">
                            <div id="content" class="full-width site-content col-md-12">
                                <div>
                                    <div>
                                        <form name="frmDelivery" id="frmDelivery" action="/admin/delivery/modify" method="post">
                                            <div class="form-floating form-group first">
                                                <label for="pay_idx">번호</label>
                                                <input type="text" class="form-control" name="pay_idx" id="pay_idx" value="${deliveryDTO.pay_idx}">
                                            </div>
                                            <div class="form-floating form-group first">
                                                <label for="delivery_company">배송회사</label>
                                                <input type="text" class="form-control" name="delivery_company" id="delivery_company" value="${deliveryDTO.delivery_company}">
                                            </div>

<%--                                            배송회사</th>--%>
<%--                                            전화번호</th>--%>
<%--                                            운송장번호</th>--%>
<%--                                            배송상태</th>--%>
<%--                                            배송시작일</th>--%>
<%--                                            배송도착일</th>--%>

<%--                                            <td><a href="/admin/delivery/modify?idx=${list.pay_idx}">${list.delivery_company}</a></td>--%>
<%--                                            <td><a href="/admin/delivery/modify?idx=${list.pay_idx}">${list.company_tel}</a></td>--%>
<%--                                            <td><a href="/admin/delivery/modify?idx=${list.pay_idx}">${list.tracking_num}</a></td>--%>
<%--                                            <td><a href="/admin/delivery/modify?idx=${list.pay_idx}">${list.delivery_state}</a></td>--%>
<%--                                            <td><a href="/admin/delivery/modify?idx=${list.pay_idx}">${list.start_date}</a></td>--%>
<%--                                            <td><a href="/admin/delivery/modify?idx=${list.pay_idx}">${list.arrive_date}</a></td>--%>
                                            <button type="reset" class="btn btn-pill text-white btn-block btn-dark">초기화</button>
                                            <button type="submit" class="btn btn-pill text-white btn-block btn-dark">수정</button>
                                        </form>

                                        <table class="table no-wrap user-table mb-0 text-lg-start">
                                            <tr>
                                                <th style="width: 120px;">제목 <i class="fa fa-pencil" aria-hidden="true"></i></th>
                                                <td>${deliveryDTO.title}</td>
                                            </tr>
                                            <tr>
                                                <th>작성자 <i class="fa fa-user"></i></th>
                                                <td>${faqDTO.writer}</td>
                                            </tr>
                                            <tr>
                                                <th>작성일 <i class="fa fa-calendar"></i></th>
                                                <td>${faqDTO.reg_date}</td>
                                            </tr>
                                        </table>
                                        <div class="mt-md-2">
                                            <div>
                                                <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='${referer}';"><i class="fa fa-list"></i></button>
                                                <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='admin/delivery/modify';"><i class="fa fa-edit"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt-md-2">
                <div>
                    <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='${referer}';"><i class="fa fa-list"></i></button>
                    <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2"><i class="fa fa-edit"></i></button>
                    <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i></button>
                </div>
            </div>
<%--            <div class="card mt-5">--%>
<%--                <table class="table no-wrap user-table mb-0 text-lg-start">--%>
<%--                    <tr>--%>
<%--                        <th style="width: 120px;">--%>
<%--                            <span class="material-symbols-outlined">expand_less</span>--%>
<%--                            <span>이전글</span>--%>
<%--                        </th>--%>
<%--                        <td><a href="/admin/notice/view?idx=${idx -1}">${totalCount}</a></td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th style="width: 120px;">--%>
<%--                            <span class="material-symbols-outlined">expand_more</span>--%>
<%--                            <span>다음글</span>--%>
<%--                        </th>--%>
<%--                        <td><a href="/admin/notice/view?idx=${idx +1}">다음글 타이틀</a></td>--%>
<%--                    </tr>--%>
<%--                </table>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
