<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

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
<div class="d-flex py-h mb-3" id="wrapper">
    <!-- Page content wrapper-->
    <div id="page-content-wrapper">
        <!-- Page content-->
        <div class="container py-h">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <c:if test="${type == 'notice'}"> <h5 class="card-title text-uppercase mb-0" style="text-align: center;">공지사항</h5> </c:if>
                            <c:if test="${type == 'faq'}"> <h5 class="card-title text-uppercase mb-0" style="text-align: center;">FAQ</h5> </c:if>
                            <c:if test="${type == 'qna'}"> <h5 class="card-title text-uppercase mb-0" style="text-align: center;">QnA</h5></c:if>
                        </div>
                        <div class="row text-left">
                            <div id="content" class="full-width site-content col-md-12">
                                <form id="frmDelete" name="frmDelete" method="post" action="/community/qna/delete">
                                    <input type="hidden" name="idx" id="idx" value="${dto.idx}" />
                                    <c:if test="${type == 'notice'}">
                                        <div>
                                            <div>
                                                <table class="table no-wrap user-table mb-0 text-lg-start">
                                                    <tr>
                                                        <th style="width: 120px;">제목 <i class="fa fa-pencil" aria-hidden="true"></i></th>
                                                        <td>${dto.title}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>작성자 <i class="fa fa-user"></i></th>
                                                        <td>${dto.writer}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>작성일 <i class="fa fa-calendar"></i></th>
                                                        <td>${dto.reg_date}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="p-3" style="min-height: 20vh;">
                                                    ${dto.content}
                                            </div>
                                            <c:if test="${dto.org_file_name != null}">
                                                <table class="table no-wrap user-table mb-0 text-lg-start">
                                                    <tr>
                                                        <th style="width: 120px;">첨부파일</th>
                                                        <td><span class="material-symbols-outlined">attach_file</span>
                                                                ${dto.org_file_name}
                                                        </td>
                                                    </tr>
                                                </table>
                                            </c:if>
                                        </div>
                                    </c:if>

                                    <c:if test="${type == 'faq'}">
                                        <div>
                                            <div>
                                                <table class="table no-wrap user-table mb-0 text-lg-start">
                                                    <tr>
                                                        <th style="width: 120px;">제목 <i class="fa fa-pencil" aria-hidden="true"></i></th>
                                                        <td>${dto.title}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>작성자 <i class="fa fa-user"></i></th>
                                                        <td>${dto.writer}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>작성일 <i class="fa fa-calendar"></i></th>
                                                        <td>${dto.reg_date}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="p-3" style="min-height: 20vh;">
                                                    ${dto.content}
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${type == 'qna'}">
                                        <div>
                                            <div>
                                                <table class="table no-wrap user-table mb-0 text-lg-start">
                                                    <tr>
                                                        <th style="width: 120px;">제목 <i class="fa fa-pencil" aria-hidden="true"></i></th>
                                                        <td>${dto.title}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>작성자 <i class="fa fa-user"></i></th>
                                                        <td>${dto.writer}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>작성일 <i class="fa fa-calendar"></i></th>
                                                        <td>${dto.reg_date}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>조회수 <i class="fa fa-eye" aria-hidden="true"></i></th>
                                                        <td>${dto.read_cnt}</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="p-3" style="min-height: 20vh;">
                                                    ${dto.content}
                                            </div>
                                        </div>
                                    </c:if>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content: space-between; margin-top: 4px;">
                <div>
                    <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle" onclick="location.href='/community/list?type=${type}'"><i class="fa fa-list"></i></button>
                    <c:if test="${sessionScope.member_id == dto.writer}">
                        <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle" onclick="location.href='/community/qna/modify?idx=${dto.idx}'"><i class="fa fa-pencil-square-o"></i></button>
                        <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle" onclick="goDelete()"><i class="fa fa-trash-o"></i></button>
                    </c:if>
                </div>

            </div>
            <div class="card mt-5">
                <table class="table no-wrap user-table mb-0 text-lg-start">

                    <tr>
                        <th style="width: 120px;">
                            <span class="material-symbols-outlined">expand_less</span>
                            <span>이전글</span>
                        </th>
                        <c:if test="${prevDTO != null}">
                            <td><a href="/community/view?type=${type}&idx=${prevDTO.idx}">${prevDTO.title}</a></td>
                        </c:if>
                        <c:if test="${prevDTO == null}">
                            <td>이전글이 없습니다.</td>
                        </c:if>
                    </tr>
                    <tr>
                        <th style="width: 120px;">
                            <span class="material-symbols-outlined">expand_more</span>
                            <span>다음글</span>
                        </th>
                        <c:if test="${nextDTO != null}">
                            <td><a href="/community/view?type=${type}&idx=${nextDTO.idx}">${nextDTO.title}</a></td>
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
<script>
    function goDelete() {
        const frm = document.getElementById("frmDelete");
        let confirm_flag = confirm("해당 문의글을 삭제하시겠습니까?");

        if(confirm_flag) {
            frm.submit();
        }
    }
</script>
<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
