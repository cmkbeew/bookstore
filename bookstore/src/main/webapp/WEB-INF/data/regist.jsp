<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>자료실 등록</title>
    <script src="https://cdn.tiny.cloud/1/l7s9qc136p4pmwyuszv8b1a5nh66vdir4b84oksbknriidxl/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>

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
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <script>
        tinymce.init({
            selector: 'textarea',
        });
    </script>
</head>
<body>
<%@ include file="../common/header.jsp"%>

<div class="container-md mt-3 py-h">
    <h1 style="text-align: center">자료실 등록</h1>
    <form name="frmRegist" id="frmRegist" method="post" action="/data/regist" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${dataDTO.title}" placeholder="제목">
            <div id="div_err_title" style="display: none"></div>
        </div>

        <div class="mb-3">
            <label for="writer" class="form-label">작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" value="${sessionScope.member_id}" readonly />
            <div id="div_err_writer" style="display: none;"></div>
        </div>

        <div class="mb-3">
            <label for="content" class="form-label">내용</label>
            <textarea class="form-control" id="content" name="content" rows="3" placeholder="내용을 입력하세요.">${dataDTO.content}</textarea>
            <div id="div_err_content" style="display: none;"></div>
        </div>

        <div class="mb-3">
            <label for="file" class="form-label">첨부 파일</label>
            <input type="file" class="form-control" name="file" id="file" />
        </div>

        <div class="d-grid gap-2">
            <button class="btn btn-primary" type="submit">글 등록</button>
            <button class="btn btn-secondary" type="button" onclick="location.href='/data/list?'">게시판 목록</button>
        </div>
    </form>
</div>
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
