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
    <meta name="description" content="">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
    <%--    헤더 css--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />

    <link rel="stylesheet" href="/resources/css/login/style.css">
    <link rel="stylesheet" href="/resources/css/mintybootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/mintybootstrap.css">
    <link rel="stylesheet" href="/resources/css/ifta.css">
    <title>회원가입</title>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
</head>
<body style="background-color:#fdfdfd ">
<%@ include file="/WEB-INF/common/header.jsp" %>
<div class="content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="form-block">
                            <%--                            class="form-block"--%>
                            <div class="py-5 text-center">
                                <span class="material-symbols-outlined d-block mx-auto mb-4" style="font-size: 72px">edit_square</span>
                                <h2>Modify Pwd</h2>
                                <p class="lead">비밀번호 수정</p>
                            </div>
                            <div>
                                <form class="needs-validation" novalidate method="post" action="/member/modifyPwd">
                                    <input type="hidden" name="member_id" id="member_id" value="${member_id}"/>
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label for="old_pwd" class="small ifta-label">현재 비밀번호</label>
                                            <input type="password" class="ifta-field" id="old_pwd" name="old_pwd" placeholder=""
                                                   value="${model.nowPwd}" required>
                                            <div id="oldPwdMsg" style="display:none;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545">
                                                현재 비밀번호와 일치하지 않습니다.
                                            </div>
                                        </div>
                                        <hr class="my-2">
                                        <div class="col-12">
                                            <label for="pwd" class="small ifta-label">새 비밀번호</label>
                                            <input type="password" class="ifta-field" id="pwd" name="pwd" placeholder=""
                                                   value="" required>
                                            <div class="invalid-feedback">
                                                사용할 비밀번호를 입력해주세요.
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <label for="pwd2" class="small ifta-label">새 비밀번호 재입력</label>
                                            <input type="password" class="ifta-field" id="pwd2" name="pwd2"
                                                   placeholder="" value="" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 재입력해주세요.
                                            </div>
                                            <div id="pwdck" style="display: none;">
                                                비밀번호와 입력 비밀번호가 다릅니다.
                                            </div>
                                            <div id="feedbackPwd" style="display:none;width:100%;margin-top:.15rem;font-size:.875em;color:#dc3545"></div>
                                        </div>
                                        </div>
                                    <button class="w-100 btn btn-primary btn-lg mt-3" id="submitBtn" type="submit">수정하기</button>
                                </form>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

<script>
    function addr() {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("addr1").value = data.roadAddress;
            }
        }).open();
    }
</script>


<%--<script src="/resources/js/bootstrap.bundle.min.js"></script>--%>

<%--<script src="/resources/js/form-validation.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"--%>
<%--        crossorigin="anonymous"></script>--%>
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
<script>
    let old_pwd = document.getElementById("old_pwd");
    let pwd1 = document.getElementById("pwd");
    let pwd2 = document.getElementById("pwd2");
    let submitBtn = document.getElementById("submitBtn");
    const pwdCheck = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[@#$%^&~!]).*$/;
    //validator 체크
    pwd1.addEventListener("input", (e) => {
        if (!(pwdCheck).test(pwd1.value)) {
            e.preventDefault();
            e.stopPropagation();
            document.getElementById("feedbackPwd").style.display = "block";
            document.getElementById("feedbackPwd").innerText = "규칙에 맞는 비밀번호를 입력해주세요."
        }
        if (pwd1.value.length < 1 || (pwdCheck).test(pwd1.value)) {
            document.getElementById("feedbackPwd").style.display = "none";
        }
    })

    old_pwd.addEventListener("input", (e)=> {
        if('${nowPwd}' !== old_pwd.value) {
            document.getElementById("oldPwdMsg").style.display="block";

        } else {
            document.getElementById("oldPwdMsg").style.display="none";
        }
    })
    pwd1.addEventListener("input", (e) => {
        if (pwd1.value == pwd2.value) {
            document.getElementById("pwdck").style.display = "none";
        }
        if (pwd2.value === "") {
            document.getElementById("pwdck").style.display = "none";
        }
        if (pwd1.value != pwd2.value){
            document.getElementById("pwdck").style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
        }
    });
    pwd2.addEventListener("input", (e) => {
        if (pwd1.value != pwd2.value) {
            document.getElementById("pwdck").style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
        }
        if (pwd2.value === "") {
            document.getElementById("pwdck").style.display = "none";
        }
        if(pwd1.value == pwd2.value) {
            document.getElementById("pwdck").style.display = "none"
        }
    });
    submitBtn.addEventListener("click", (e)=>{
        if(pwdck.style.display == "block" || document.getElementById("oldPwdMsg").style.display=="block" || document.getElementById("feedbackPwd").style.display=="block") {
            e.preventDefault();
            e.stopPropagation();
        }
    })
    const serverValidResult = {};
    <c:forEach items="${errors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<div style='width:100%;margin-bottom:.25rem;font-size:.875em;color:#dc3545'>${err.getField()}필드는 공백일 수 없습니다.</div>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
    console.log(serverValidResult);

</script>


</body>
</html>


