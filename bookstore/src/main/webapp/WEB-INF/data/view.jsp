<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Notice View</title>

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link href="/resources/css/admin/styles.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
</head>
<body style="background-color: #eeeeee;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <!-- Page content wrapper-->
    <div id="page-content-wrapper" style="min-height: 80vh;">
        <!-- Page content-->
        <div class="container py-h">
            <form name="deleteFrm" id="deleteFrm" method="post" action="/data/delete">
                <input type="hidden" name="data_idx" id="data_idx" value="${dto.data_idx}" />
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0" style="text-align: center;">자료실</h5>
                            </div>
                            <div class="row text-left">
                                <div id="content" class="full-width site-content col-md-12">
                                    <div>
                                        <div>
                                            <table class="table no-wrap user-table mb-0 text-lg-start">
                                                <tr class="table-light">
                                                    <th style="width: 120px;">제목<span class="material-symbols-outlined web_font">title</span></th>
                                                    <td>${dto.title}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>작성자<span class="material-symbols-outlined web_font">face</span></th>
                                                    <td>${dto.writer}</td>
                                                </tr>
                                                <tr class="table-light">
                                                    <th>작성일<span class="material-symbols-outlined web_font">calendar_month</span></th>
                                                    <td>${dto.reg_date}</td>
                                                </tr>
                                                <tr>
                                                    <th>내용<span class="material-symbols-outlined web_font">description</span></th>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="p-3" style="min-height: 20vh;">
                                            ${dto.content}
                                        </div>
                                        <c:if test="${dto.org_file_name != null && dto.org_file_name != ''}">
                                            <table class="table no-wrap user-table mb-0 text-lg-start">
                                                <tr>
                                                    <th style="width: 120px; vertical-align: middle;">첨부파일</th>
                                                    <td>
                                                        <span class="material-symbols-outlined web_font">attach_file</span>
<%--                                                        <span><a href="<c:url value='/attach/download/${dto.save_file_name}'/>" target="_blank">${dto.org_file_name}</a></span>--%>
                                                        <span><a href="/data/filedownload?data_idx=${dto.data_idx}" target="_blank">${dto.org_file_name}</a></span>
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
                    <c:if test="${sessionScope.member_id ne dto.writer}">
                        <div>
                            <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/data/list';"><span class="material-symbols-outlined">list</span></button>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.member_id eq dto.writer}">
                        <div>
                            <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/data/list';"><span class="material-symbols-outlined">list</span></button>
                            <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/data/modify?data_idx=${dto.data_idx}';"><span class="material-symbols-outlined">edit_note</span></button>
                            <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="goDelete()"><span class="material-symbols-outlined">delete</span></button>
                        </div>
                    </c:if>
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
                            <td><a href="/data/view?data_idx=${prevDTO.data_idx}">${prevDTO.title}</a></td>
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
                            <td><a href="/data/view?data_idx=${nextDTO.data_idx}">${nextDTO.title}</a></td>
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

        if(confirm_flag) {
            frm.submit();
        }
    }
</script>
</body>
</html>
