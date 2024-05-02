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
<body style="background-color: #eeeeee;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h mb-3" id="wrapper">
    <!-- Page content wrapper-->
    <div id="page-content-wrapper" style="min-height: 80vh;">
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
                                                            <span>${dto.org_file_name}</span>
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
                                        </div>
                                    </c:if>

                                    <c:if test="${type == 'qna'}">
                                        <div>
                                            <div>
                                                <table class="table no-wrap user-table mb-0 text-lg-start">
                                                    <tr class="table-light">
                                                        <th style="width: 120px;">
                                                            제목<span class="material-symbols-outlined web_font">title</span>
                                                        </th>
                                                        <td>${dto.title}</td>
                                                    </tr>
                                                    <tr class="table-light">
                                                        <th>
                                                            작성자<span class="material-symbols-outlined web_font">face</span>
                                                        </th>
                                                        <td>${dto.writer}</td>
                                                    </tr>
                                                    <tr class="table-light">
                                                        <th>작성일<span class="material-symbols-outlined web_font">calendar_month</span></th>
                                                        <td>${dto.reg_date}</td>
                                                    </tr>
                                                    <tr class="table-light">
                                                        <th>조회수<span class="material-symbols-outlined web_font">visibility</span></th>
                                                        <td>${dto.read_cnt}</td>
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
                    <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle" onclick="location.href='/community/list?type=${type}'">
                        <span class="material-symbols-outlined">list</span>
                    </button>
                    <c:if test="${sessionScope.member_id == dto.writer}">
                        <c:if test="${type == 'qna'}">
                            <c:if test="${dto.reply_state == 'Y'}">
                                <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle" onclick="noModifyDelete()"><span class="material-symbols-outlined">edit_note</span></button>
                                <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle" onclick="noModifyDelete()"><span class="material-symbols-outlined">delete</span></button>
                            </c:if>
                            <c:if test="${dto.reply_state == 'N'}">
                                <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle" onclick="location.href='/community/qna/modify?idx=${dto.idx}'"><span class="material-symbols-outlined">edit_note</span></button>
                                <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle" onclick="goDelete()"><span class="material-symbols-outlined">delete</span></button>
                            </c:if>
                        </c:if>
                    </c:if>
                </div>

            </div>
            <div class="card my-5">
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

    function noModifyDelete() {
        alert("답변이 달린 글은 수정/삭제가 불가합니다.")
    }
</script>
<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
