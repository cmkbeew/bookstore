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

    <%--  header 부트스트랩  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
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
                            <h5 class="card-title text-uppercase mb-0" style="text-align: center;">배송관리</h5>
                        </div>
                        <div class="row text-left">
                            <div id="content" class="full-width site-content col-md-12">
                                <div>
                                    <div>
                                        <table class="table no-wrap user-table mb-0 text-lg-start">
                                            <tr>
                                                <td>${deliveryDTO}</td>
                                            </tr>
                                        </table>
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
                    <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='admin/delivery/modify?${deliverDTO.pay_idx}';"><i class="fa fa-edit"></i></button>
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
