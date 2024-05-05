<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <title>findPwdResult</title>
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
<body style="padding-bottom: 0px;">
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
                                                <label for="pwd" class="small ifta-label">비밀번호</label>
                                                <input type="password" class="ifta-field" style="border:none;" name="pwd" id="pwd">
                                            </div>
                                            <div class="form-floating form-group last mb-4">
                                                <label for="pwd2" class="small ifta-label">비밀번호 재입력</label>
                                                <input type="password" class="ifta-field" style="border:none;" name="pwd2" id="pwd2">
                                            </div>
                                            <div class="mb-4" style="display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#9a9a9a">
                                                영어 대문자 / 영어 소문자 / 특수문자 (@#$%^&~!) / 숫자 포함 8~16자만 사용 가능합니다.
                                            </div>
                                            <div class="blank_check" id="blank_check" style="display:none">
                                                공백은 비밀번호로 지정 불가합니다.
                                            </div>
                                            <div id="pwdck" style="display: none;">
                                                비밀번호와 입력 비밀번호가 다릅니다.
                                            </div>
                                            <div id="pwdck2" style="display: none;">
                                                규칙에 맞는 비밀번호를 입력해주세요.
                                            </div>
                                            <input type="submit" value="비밀번호 변경하기" id="submitBtn"
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
<script>
    const blank_pattern = /^\s+|\s+$/g;
    let pwd1 = document.getElementById("pwd");
    let pwd2 = document.getElementById("pwd2");
    let submitBtn = document.getElementById("submitBtn");
    const pwdCheck = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[@#$%^&~!]).*$/;

    pwd1.addEventListener("input", (e) => {
        document.getElementById("blank_check").style.display = "none";
        // 비밀번호가 규격에 맞는지 확인
        if (!(pwdCheck).test(pwd1.value)) {
            document.getElementById("pwdck2").style ='display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545';
            e.preventDefault();
            e.stopPropagation();
        }
        // 비밀번호 규격에 맞는 경우 안내 문구 사라지게
        if ((pwdCheck).test(pwd1.value)) {
            e.preventDefault();
            e.stopPropagation();
            document.getElementById("pwdck2").style.display = "none";
        }
        // 빈간 입력 시 문구 none
        if (pwd1.value.length < 1 || (pwdCheck).test(pwd1.value)) {
            document.getElementById("pwdck").style.display = "none";
        }
        // 값이 동일 할 경우 문구 none
        if (pwd1.value == pwd2.value) {
            document.getElementById("pwdck").style.display = "none";
        }
        // 재입력 칸 비밀번호가 빈 칸인 경우 문구 none
        if (pwd2.value === "") {
            document.getElementById("pwdck").style.display = "none";
        }
        // 비밀번호 & 비밀번호 재입력 칸 값 같지 않을 경우 none
        if (pwd1.value != pwd2.value){
            document.getElementById("pwdck").style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
        }
    });

    pwd2.addEventListener("input", (e) => {
        // 비밀번호 재 입력 값이 다른 경우
        if (pwd1.value != pwd2.value) {
            document.getElementById("pwdck").style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
        }
        // 비밀번호 재입력 칸 값이 없거나, 칸 두 개의 값이 동일한 경우
        if (pwd2.value === "" || pwd1.value == pwd2.value) {
            document.getElementById("pwdck").style.display = "none";
        }
    });

    submitBtn.addEventListener("click", (e)=>{
        // 문구가 출력되어 있는 경우 제출 x
        if(document.getElementById("pwdck").style.display == "block") {
            e.preventDefault();
            e.stopPropagation();
        }
        if(document.getElementById("pwdck2").style.display == "block") {
            e.preventDefault();
            e.stopPropagation();
        }
        // 값이 빈칸 또는 값이 공백 입력 시
        if(pwd1.value.length < 1 || pwd1.value.replace(blank_pattern, '' ) == "" ) {
            document.getElementById("blank_check").style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
            pwd1.focus();
            e.preventDefault();
            e.stopPropagation();
        }
        // 값이 빈칸 또는 값이 공백 입력 시
        if(pwd2.value.length < 1 || pwd2.value.replace(blank_pattern, '' ) == "" ) {
            document.getElementById("blank_check").style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
            pwd2.focus();
            e.preventDefault();
            e.stopPropagation();
        }
    })
</script>
</body>
</html>
