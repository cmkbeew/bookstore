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
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>admin >> noticeRegist</title>

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link href="/resources/css/admin/styles.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
    <script src="https://cdn.tiny.cloud/1/l7s9qc136p4pmwyuszv8b1a5nh66vdir4b84oksbknriidxl/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body style="background-color: #eeeeee;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper" style="min-height: 80vh;">
        <button class="btn btn-primary" id="sidebarToggle">
            <span class="material-symbols-outlined" style="display: block;">arrow_back</span>
            <span class="material-symbols-outlined" style="display: none;">arrow_forward</span>
        </button>
        <!-- Page content-->
        <div class="container" style="margin-bottom: 5rem;">
            <div class="row">
                <div class="col-md-12">
                    <form name="registFrm" id="registFrm" method="post" action="/admin/notice/regist" enctype="multipart/form-data">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0" style="text-align: center;">공지사항 등록</h5>
                            </div>
                            <div class="row text-left">
                                <div class="full-width site-content col-md-12">
                                    <div>
                                        <table class="table no-wrap user-table mb-0 text-lg-start">
                                            <tr class="table-light">
                                                <th style="width: 120px;">제목<span class="material-symbols-outlined web_font">title</span></th>
                                                <td>
                                                    <input type="text" name="title" id="title" class="form-control" value="${noticeDTO.title}" placeholder="제목"/>
                                                    <div id="div_err_title" style="display: none"></div>
                                                </td>

                                            </tr>
                                            <tr class="table-light">
                                                <th>작성자<span class="material-symbols-outlined web_font">face</span></th>
                                                <td><input type="text" name="writer" id="writer" class="form-control" value="${member_id}" readonly/></td>
                                            </tr>
                                            <tr class="table-light">
                                                <th>고정여부<span class="material-symbols-outlined web_font">keep</span></th>
                                                <td>
                                                    <label class="control control--checkbox">
                                                        <input type="checkbox" name="fix_state" id="fix_state" value="-1">
                                                        <div class="control__indicator"></div>
                                                    </label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="p-3" style="min-height: 20vh;">
                                        <textarea name="content" id="content" placeholder="내용을 입력하세요.">${noticeDTO.content}</textarea>
                                        <div id="div_err_content" style="display: none"></div>
                                    </div>
                                    <table class="table no-wrap user-table mb-0 text-lg-start">
                                        <tr class="table-light">
                                            <th style="width: 120px; vertical-align: middle;">
                                                첨부파일
                                                <span class="material-symbols-outlined web_font">attach_file</span>
                                            </th>
                                            <td><input type="file" name="file" class="form-control" /></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="mt-md-2">
                            <div>
                                <button type="reset" class="btn btn-outline-primary me-2">초기화</button>
                                <button type="submit" class="btn btn-primary me-2">완료</button>
                                <button type="button" class="btn btn-outline-danger me-2" onclick="location.href='/admin/list?type=notice'">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
<script>
    tinymce.init({
        selector: 'textarea',
    });

    const serverValidResult = {};
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red;'>${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
</script>
</body>
</html>

