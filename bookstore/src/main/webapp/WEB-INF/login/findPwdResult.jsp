<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">


    <link rel="stylesheet" href="/resources/css/login/style.css">
    <title>findID</title>
    <link rel="stylesheet" href="/resources/css/mintybootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/mintybootstrap.css">
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp" %>
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
                                    <div class="mb-4 text-center">
                                        <h3><strong>비밀번호 변경</strong></h3>
                                        <p class="mt-4 mb-4">새로 변경하실 비밀번호를 입력해주세요.</p>
                                    </div>
                                    <main class="form-signin">
                                        <form name="frmLogin" id="frmLogin" action="/login/findPwdResult" method="post">
                                            <input type="hidden" name="member_id" id="member_id" value="${requestScope['member_id']}">
                                            <div class="form-floating form-group last mb-4">
                                                <label for="pwd">비밀번호</label>
                                                <input type="password" class="form-control" name="pwd" id="pwd">
                                            </div>
                                            <div class="form-floating form-group last mb-4">
                                                <label for="pwd2">비밀번호 재입력</label>
                                                <input type="password" class="form-control" name="pwd2" id="pwd2">
                                            </div>
                                            <div class="invalid-feedback" style="display: block">
                                                비밀번호와 재입력 비밀번호가 다릅니다.
                                            </div>
                                            <input type="submit" value="비밀번호 변경하기"
                                                   class="btn btn-pill text-white btn-block btn-primary w-100 mt-3 mb-4">
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
<%@ include file="/WEB-INF/common/footer.jsp" %>
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
