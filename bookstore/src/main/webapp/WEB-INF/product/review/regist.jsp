<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>도서 후기 등록</title>

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
<body>
<%@ include file="../../common/header.jsp"%>

<div class="container-md mt-3 py-h">
    <h1 style="text-align: center">도서 후기 등록</h1>
    <form name="frmRegist" id="frmRegist" method="post" action="/product/review/regist">
        <input type="hidden" name="type" id="type" value="${type}" />
        <input type="hidden" name="product_idx" id="product_idx" value="${product_idx}" />
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${reviewDTO.title}" placeholder="제목">
            <div id="div_err_title" style="display: none"></div>
        </div>

        <div class="mb-3">
            <label for="writer" class="form-label">작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" value="${sessionScope.member_id}" readonly />
            <div id="div_err_writer" style="display: none;"></div>
        </div>

        <div class="mb-3">
            <label for="content" class="form-label">내용</label>
            <textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력하세요." style="resize: none;">${reviewDTO.content}</textarea>
            <div id="div_err_content" style="display: none;"></div>
        </div>

        <div class="mb-3">
            <label for="grade" class="form-label">평점</label>
            <p class="ratings">
                <input class="form-control text-center me-3" name="grade" id="grade" type="number" value="5" min="1" max="5" style="max-width: 5rem;" />
                <a href="#"><span class="fa fa-star"></span></a>
                <a href="#"><span class="fa fa-star"></span></a>
                <a href="#"><span class="fa fa-star"></span></a>
                <a href="#"><span class="fa fa-star"></span></a>
                <a href="#"><span class="fa fa-star-o"></span></a>
            </p>
        </div>

        <div class="d-grid gap-2">
            <button class="btn btn-primary" type="submit">글 등록</button>
            <button class="btn btn-secondary" type="button" onclick="location.href='/product/view?type=${type}&product_idx=${product_idx}#bookReview'">뒤로가기</button>
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

    // 평점


</script>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>
