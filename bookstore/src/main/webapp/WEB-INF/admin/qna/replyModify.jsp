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
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>--%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>admin >> qnaModify</title>

    <%--  header 부트스트랩  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <script src="https://cdn.tiny.cloud/1/l7s9qc136p4pmwyuszv8b1a5nh66vdir4b84oksbknriidxl/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
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
        <div class="container py-h" style="margin-bottom: 5rem;">
            <div class="row">
                <div class="col-md-12">
                    <form name="modifyFrm" id="modifyFrm" method="post" action="/admin/qna/replyModify">
                        <input type="hidden" name="idx" id="idx" value="${qnaDTO.idx}">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0" style="text-align: center;">답변 수정</h5>
                            </div>
                            <div class="row text-left">
                                <div class="full-width site-content col-md-12">
                                    <div>
                                        <table class="table no-wrap user-table mb-0 text-lg-start">
                                            <tr>
                                                <th style="width: 120px; vertical-align: middle">제목 <i class="fa fa-pencil" aria-hidden="true"></i></th>
                                                <td>
<%--                                                    <c:set var="now" value="<%=new java.util.Date()%>" />--%>
<%--                                                    <fmt:setLocale value = "ko_kr" scope = "request" />--%>
<%--                                                    <fmt:formatDate value="${now}" type="both" pattern="YYYY-MM-dd hh:mm:ss" />--%>
                                                    <input type="text" name="title" id="title" class="form-control" value="(수정)답변입니다."/>
                                                </td>

                                            </tr>
                                            <tr>
                                                <th style="vertical-align: middle;">작성자 <i class="fa fa-user" ></i></th>
                                                <td><input type="text" name="writer" id="writer" class="form-control" value="${member_id}" readonly/></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="p-3" style="min-height: 20vh;">
                                        <textarea name="content" id="content">
                                            ${qnaDTO.content}<br/>
                                            <hr/>
                                            [(수정)답변내용]<br/>
                                        </textarea>
                                        <div id="div_err_content" style="display: none"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-md-2">
                            <div>
                                <button type="reset" class="btn btn-outline-primary me-2">초기화</button>
                                <button type="submit" class="btn btn-primary me-2">완료</button>
                                <button type="button" class="btn btn-outline-danger me-2" onclick="location.href='/admin/list?type=qna'">취소</button>
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

