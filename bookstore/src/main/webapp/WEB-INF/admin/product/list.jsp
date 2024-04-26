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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <%-- bbsList 부트스트랩   --%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" />--%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <%@ include file="/WEB-INF/common/header.jsp"%>
    <div class="d-flex" id="wrapper" style="padding-top: 56px;">
        <!-- Sidebar-->
        <div class="border-end bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
            <div class="list-group list-group-flush">
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/notice/list">공지사항</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/faq/list">FAQ</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/qna/list">QnA</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/member/list">회원내역</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/product/">도서(교재)</a>
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
            <div class="container" style="margin-top: 24px;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0" style="text-align: center;">공지사항</h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table no-wrap user-table mb-0">
                                    <thead>
                                    <tr>
                                        <th scope="col" class="border-0 text-uppercase font-medium pl-4">선택</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium pl-4">번호</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">제목</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">작성자</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">작성일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${!empty noticeList}">
                                            <c:forEach items="${noticeList}" var="list">
                                                <tr>
                                                        <td class="pl-4" style="vertical-align: middle;">
                                                            <input type="checkbox" name="select" id="select" value="" />
                                                            <div class="control__indicator"></div>
                                                        </td>
                                                        <td class="pl-4">
                                                            <a href="/admin/notice/view?notice_idx=${list.notice_idx}">
                                                                <h5 class="font-medium mb-0">${list.notice_idx}</h5>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="/admin/notice/view?notice_idx=${list.notice_idx}">
                                                                <h5 class="font-medium mb-0">${list.title}</h5>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="/admin/notice/view?notice_idx=${list.notice_idx}">
                                                                <h5 class="font-medium mb-0">${list.member_id}</h5>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="/admin/notice/view?notice_idx=${list.notice_idx}">
                                                                <h5 class="font-medium mb-0">${list.reg_date}</h5>
                                                            </a>
                                                                <%--                                                            <span class="text-muted">${list.reg_date}</span>--%>
                                                        </td>

<%--                                                        <td>--%>
<%--                                                            <select class="form-control category-select" id="exampleFormControlSelect1">--%>
<%--                                                                <option>Modulator</option>--%>
<%--                                                                <option>Admin</option>--%>
<%--                                                                <option>User</option>--%>
<%--                                                                <option>Subscriber</option>--%>
<%--                                                            </select>--%>
<%--                                                        </td>--%>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" style="text-align: center;">등록된 게시글이 없습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div style="display: flex; justify-content: space-between; margin-top: 4px;">
                            <div>
                                <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle"><i class="fa fa-edit"></i> </button>
                                <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i> </button>
                            </div>
                            <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2"><i class="fa fa-upload"></i> </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
