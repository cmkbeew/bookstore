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

    <title>admin >> productView</title>

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
<body style="background-color: #eeeeee; padding-bottom: 0px;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex" id="wrapper">
    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper" style="min-height: 80vh;">
        <button class="btn btn-primary" id="sidebarToggle">
            <span class="material-symbols-outlined" style="display: block;">arrow_back</span>
            <span class="material-symbols-outlined" style="display: none;">arrow_forward</span>
        </button>
        <!-- Page content-->
        <div class="container">
            <form name="deleteFrm" id="deleteFrm" method="post" action="/admin/product/delete">
                <input type="hidden" name="product_idx" id="product_idx" value="${dto.product_idx}"/>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0" style="text-align: center;">도서관리</h5>
                            </div>
                            <div class="row text-left">
                                <div id="content" class="full-width site-content col-md-12">
                                    <div>
                                        <div>
                                            <table class="table no-wrap user-table mb-0 text-lg-start">
                                                <tr class="table-light">
                                                    <th style="width: 120px;">교재명</th>
                                                    <td>${dto.product_name}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>출판사</th>
                                                    <td>${dto.publisher}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>저자</th>
                                                    <td>${dto.author}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>쪽수</th>
                                                    <td>${dto.page_cnt}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>출판일</th>
                                                    <td>${dto.publish_date}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>유형</th>
                                                    <td>${dto.type}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>학년</th>
                                                    <td>${dto.grade}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>과목</th>
                                                    <td>${dto.subject}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>할인율</th>
                                                    <td>${dto.discount}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>상품등록일</th>
                                                    <td>${dto.reg_date}</td>
                                                </tr>
                                                <tr>
                                                    <th>교재소개<span class="material-symbols-outlined web_font">description</span></th>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="p-3" style="min-height: 20vh;">${dto.product_content}</div>
                                        <c:if test="${dto.org_file_name != null && dto.org_file_name != ''}">
                                            <table class="table no-wrap user-table mb-0 text-lg-start">
                                                <tr>
                                                    <th style="width: 120px; vertical-align: middle;">첨부파일</th>
                                                    <td>
                                                        <span class="material-symbols-outlined web_font">attach_file</span>
                                                        <span><a href="#">${dto.org_file_name}</a></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-md-2">
                    <div>
                        <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/admin/product/list';"><span class="material-symbols-outlined">list</span></button>
                        <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/admin/product/modify?product_idx=${dto.product_idx}';"><span class="material-symbols-outlined">edit_note</span></button>
                        <button type="submit" class="btn btn-primary btn-circle btn-lg btn-circle ml-2"><span class="material-symbols-outlined">delete</span></button>
                    </div>
                </div>
            </form>
            <div class="card my-5">
                <table class="table no-wrap user-table mb-0 text-lg-start">
                    <tr>
                        <th style="width: 120px;">
                            <span class="material-symbols-outlined" style="vertical-align: middle;">expand_less</span>
                            <span>이전글</span>
                        </th>
                        <c:if test="${prevDTO != null}">
                            <td><a href="/admin/product/view?product_idx=${prevDTO.product_idx}">${prevDTO.product_name}</a></td>
                        </c:if>
                        <c:if test="${prevDTO == null}">
                            <td>이전글이 없습니다.</td>
                        </c:if>
                    </tr>
                    <tr>
                        <th style="width: 120px;">
                            <span class="material-symbols-outlined" style="vertical-align: middle;">expand_more</span>
                            <span>다음글</span>
                        </th>
                        <c:if test="${nextDTO != null}">
                            <td><a href="/admin/product/view?product_idx=${nextDTO.product_idx}">${nextDTO.product_name}</a></td>
                        </c:if>
                        <c:if test="${nextDTO == null}">
                            <td>다음글이 없습니다.</td>
                        </c:if>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
<script>
    function goDelete() {
        const frm = document.getElementById("deleteFrm");
        let confirm_flag = confirm("해당 게시글을 삭제하시겠습니까?");

        if (confirm_flag) {
            frm.submit();
        }
    }
</script>
</body>
</html>
