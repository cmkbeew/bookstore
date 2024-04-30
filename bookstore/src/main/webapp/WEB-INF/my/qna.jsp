<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>QNA</title>

    <%--  header 부트스트랩  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <%-- list 부트스트랩   --%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
<%--    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>--%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper">
<%--        <button class="btn btn-primary" id="sidebarToggle">--%>
<%--            <i class="fa fa-arrow-left" aria-hidden="true" style="display: block;"></i>--%>
<%--            <i class="fa fa-arrow-right" aria-hidden="true" style="display: none;"></i>--%>
<%--        </button>--%>
        <!-- Page content-->
        <div class="container py-h">
            <div class="row">
                <div class="col-md-3"style="background-color: #e4f3ef ">
                    <%@ include file="/WEB-INF/common/sidebar.jsp"%>
                </div>
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-uppercase mb-0 text-center">회원관리</h5>
                        </div>
                        <div class="table-responsive">
                            <table class="table no-wrap user-table mb-0">
                                <thead>
                                <tr>
                                    <th scope="col" class="border-0">선택</th>
                                    <th scope="col" class="border-0">번호</th>
                                    <th scope="col" class="border-0">아이디</th>
                                    <th scope="col" class="border-0">이름</th>
                                    <%--                                    <th scope="col" class="border-0 text-uppercase font-medium">주소</th>--%>
                                    <%--                                    <th scope="col" class="border-0 text-uppercase font-medium">상세주소</th>--%>
                                    <%--                                    <th scope="col" class="border-0 text-uppercase font-medium">우편번호</th>--%>
                                    <%--                                    <th scope="col" class="border-0 text-uppercase font-medium">휴대폰번호</th>--%>
                                    <th scope="col" class="border-0" >이메일</th>
                                    <th scope="col" class="border-0">평생회원</th>
                                    <th scope="col" class="border-0">선택사항</th>
                                    <th scope="col" class="border-0">포인트</th>
                                    <th scope="col" class="border-0">회원상태</th>
                                    <th scope="col" class="border-0">가입일</th>
                                    <th scope="col" class="border-0">탈퇴일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${!empty memberList}">
                                        <c:forEach items="${memberList}" var="list">
                                            <tr>
                                                <td class="pl-4">
                                                    <label class="control control--checkbox">
                                                        <input type="checkbox" name="select" id="select" value="">
                                                        <div class="control__indicator"></div>
                                                    </label>
                                                </td>
                                                <td class="pl-4">${list.member_idx}</td>
                                                <td>${list.member_id}</td>
                                                <td>${list.name}</td>
                                                    <%--                                                <td>${list.addr1}</td>--%>
                                                    <%--                                                <td>${list.addr2}</td>--%>
                                                    <%--                                                <td>${list.zipcode}</td>--%>
                                                    <%--                                                <td>${list.phone_num}</td>--%>
                                                <td>${list.email}</td>
                                                <td>${list.forever_yn}</td>
                                                <td>${list.option}</td>
                                                <td>${list.point}</td>
                                                <td>${list.member_state}</td>
                                                <td>${list.reg_date}</td>
                                                <td>${list.leave_date}</td>
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
