<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>자료실 수정</title>

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link href="/resources/css/admin/styles.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <script src="https://cdn.tiny.cloud/1/l7s9qc136p4pmwyuszv8b1a5nh66vdir4b84oksbknriidxl/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: 'textarea',
        });
    </script>
</head>
<body style="background-color: #eeeeee; padding-bottom: 0px;">
<%@ include file="../common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <!-- Page content wrapper-->
    <div id="page-content-wrapper" style="min-height: 80vh;">
        <!-- Page content-->
        <div class="container" style="margin-bottom: 5rem;">
            <div class="row">
                <div class="col-md-12">
                    <form name="frmModify" id="frmModify" method="post" action="/data/modify" enctype="multipart/form-data">
                        <input type="hidden" name="data_idx" id="data_idx" value="${dataDTO.data_idx}"/>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0 text-center">자료실 수정</h5>
                            </div>
                            <div class="row text-left">
                                <div class="full-width site-content col-md-12">
                                    <div>
                                        <table class="table no-wrap user-table mb-0 text-lg-start">
                                            <tr class="table-light">
                                                <th style="width: 120px;">제목<span class="material-symbols-outlined web_font">title</span></th>
                                                <td>
                                                    <input type="text" name="title" id="title" class="form-control" value="${dataDTO.title}" placeholder="제목"/>
                                                    <div id="div_err_title" style="display: none"></div>
                                                </td>

                                            </tr>
                                            <tr class="table-light">
                                                <th>작성자<span class="material-symbols-outlined web_font">face</span></th>
                                                <td><input type="text" name="writer" id="writer" class="form-control" value="${member_id}" readonly/></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="p-3" style="min-height: 20vh;">
                                        <textarea name="content" id="content" placeholder="내용을 입력하세요.">${dataDTO.content}</textarea>
                                        <div id="div_err_content" style="display: none"></div>
                                    </div>
                                    <table class="table no-wrap user-table mb-0 text-lg-start">
                                        <tr class="table-light">
                                            <th style="width: 120px;">
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
                                <button type="button" class="btn btn-outline-danger me-2" onclick="location.href='/data/list'">취소</button>
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
    const serverValidResult = {};
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red;'>${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
