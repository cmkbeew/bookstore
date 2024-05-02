<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%--    <link rel="stylesheet" href="/resources/css/login/style.css">--%>
<%--    <link rel="stylesheet" href="/resources/css/ifta.css">--%>

    <title>finPwd</title>

    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/css/ifta.css">
    <%--  header 부트스트랩  --%>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link href="/resources/css/login/style.css" rel="stylesheet" />

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="form-block">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel"
                                     aria-labelledby="home-tab" tabindex="0">
                                    <div class="mb-4">
                                        <h3><strong>비밀번호 찾기</strong></h3>
                                        <p class="mt-4 mb-4">이름과 가입할 때 작성한 이메일를 적어주세요.</p>
                                    </div>
                                    <main class="form-signin">
                                        <form name="frmLogin" id="frmLogin" action="/login/findPwd" method="post">
                                            <div class="form-floating form-group first mb-3">
                                                <label for="name" class="small ifta-label">이름</label>
                                                <input type="text" class="ifta-field" style="border:none;" name="name" id="name">
                                            </div>
                                            <div class="form-floating form-group last mb-4">
                                                <label for="member_id" class="small ifta-label">아이디</label>
                                                <input type="text" class="ifta-field" style="border:none;" name="member_id" id="member_id">
                                            </div>
                                            <div class="form-floating form-group last mb-4">
                                                <label for="email" class="small ifta-label">이메일</label>
                                                <input type="email" class="ifta-field" style="border:none;" name="email" id="email">
                                            </div>
                                            <input type="submit" value="비밀번호 찾기"
                                                   class="btn btn-pill text-white btn-block btn-primary w-100">
                                        </form>
                                    </main>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
<script src="/resources/js/form-validation.js"></script>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/main.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v55bfa2fee65d44688e90c00735ed189a1713218998793"
        integrity="sha512-FIKRFRxgD20moAo96hkZQy/5QojZDAbyx0mQ17jEGHCJc/vi0G2HXLtofwD7Q3NmivvP9at5EVgbRqOaOQb+Rg=="
        data-cf-beacon='{"rayId":"879d448bbc1a29e5","version":"2024.4.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
