<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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


    <title>Login</title>
</head>
<body>
<div class="content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="member-tab" data-bs-toggle="tab"
                                        data-bs-target="#home-tab-pane" type="button" role="tab"
                                        aria-controls="home-tab-pane" aria-selected="true">회원 로그인
                                </button>
                            </li>
<%--                            <li class="nav-item" role="presentation">--%>
<%--                                <button class="nav-link" id="guest-tab" data-bs-toggle="tab"--%>
<%--                                        data-bs-target="#profile-tab-pane" type="button" role="tab"--%>
<%--                                        aria-controls="profile-tab-pane" aria-selected="false">비회원 로그인(주문 조회)--%>
<%--                                </button>--%>
<%--                            </li>--%>
                        </ul>
                        <div class="form-block">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel"
                                     aria-labelledby="home-tab" tabindex="0">
                                    <div class="mb-4">
                                        <h3><strong>로그인</strong></h3>
                                        <p class="mt-4 mb-4">Have a good time with Ddori Story!</p>
                                    </div>
                                    <main class="form-signin">
                                        <form name="frmLogin" id="frmLogin" action="/login/login" method="post">
                                            <div class="form-floating form-group first">
                                                <label for="member_id" class="small ifta-label">ID</label>
                                                <input type="text" class="ifta-field" style="border:none" name="member_id" id="member_id"
                                                       <c:if test="${not empty requestScope.id}">value="${requestScope.id}"</c:if>
                                                       <c:if test="${not empty dto.member_id}">value="${dto.member_id}"</c:if>>
                                            </div>

                                            <div class="form-floating form-group last mb-4 mt-4">
                                                <label for="pwd"  class="small ifta-label">비밀번호</label>
                                                <input type="password" class="ifta-field" style="border:none" name="pwd" id="pwd">
                                            </div>
                                            <div id="div_err">
                                            </div>
                                            <div class="d-flex mb-5 align-items-center mt-4 justify-content-between">
                                                <div class="d-flex">
                                                    <label class="control control--checkbox mb-0 mx-2"><span
                                                            class="caption">아이디 저장</span>
                                                        <input type="checkbox" name="save_id" id="save_id" value="${requestScope.save_id}"
                                                               <c:if test="${not empty requestScope.save_id}">checked="checked"</c:if>>
                                                        <div class="control__indicator"></div>
                                                    </label>
                                                    <label class="control control--checkbox ml-2 mb-0 mx-2"><span
                                                            class="caption">자동 로그인</span>
                                                        <input type="checkbox" name="auto_login" id="auto_login"
                                                               value="${requestScope.auto_login}"
                                                               <c:if test="${not empty requestScope.auto_login}">checked="checked"</c:if>>
                                                        <div class="control__indicator"></div>
                                                    </label>
                                                </div>
                                                <span class="ml-auto"><a href="/login/find" class="forgot-pass">계정 찾기</a></span>
                                            </div>
                                            <input type="submit" value="로그인" id="loginBtn"
                                                   class="btn btn-pill text-white btn-block btn-primary w-100">
                                            <span class="d-block text-center my-4 text-muted"> or </span>
                                            <button type="button"
                                                    class="btn btn-pill text-white btn-block btn-dark w-100"
                                                    onclick="location.href='/member/join'">회원가입
                                            </button>
                                        </form>
                                    </main>
                                </div>
<%--                                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"--%>
<%--                                     aria-labelledby="profile-tab" tabindex="0">--%>
<%--                                    <div class="mb-4">--%>
<%--                                        <h3><strong>비회원 로그인</strong></h3>--%>
<%--                                        <p class="mt-4 mb-4">비회원의 경우, 주문 시 주문번호로 조회 가능합니다.</p>--%>
<%--                                    </div>--%>
<%--                                    <main class="form-signin">--%>
<%--                                        <form name="frmLoginGuest" id="frmLoginGuest" action="/my/order" method="post">--%>
<%--                                            <div class="form-floating form-group first mt-4">--%>
<%--                                                <label for="name" class="small ifta-label">이름</label>--%>
<%--                                                <input type="text" class="ifta-field" style="border:none" name="name" id="name">--%>
<%--                                            </div>--%>
<%--                                            <div class="form-floating form-group last mb-4 mt-4">--%>
<%--                                                <label for="order_no" class="small ifta-label">주문번호</label>--%>
<%--                                                <input type="text" class="ifta-field" style="border:none" name="order_no" id="order_no">--%>
<%--                                            </div>--%>
<%--                                            <div class="form-floating form-group last mb-4 mt-4">--%>
<%--                                                <label for="pwdGuest" class="small ifta-label" >비밀번호</label>--%>
<%--                                                <input type="password" class="ifta-field" style="border:none" name="pwd" id="pwdGuest">--%>
<%--                                            </div>--%>
<%--                                            <div class="invalid-feedback mb-3">--%>
<%--                                            </div>--%>
<%--                                            <input type="submit" value="조회"--%>
<%--                                                   class="btn btn-pill text-white btn-block btn-primary w-100">--%>
<%--                                            <span class="d-block text-center my-4 text-muted"> or </span>--%>
<%--                                            <button type="button"--%>
<%--                                                    class="btn btn-pill text-white btn-block btn-dark w-100"--%>
<%--                                                    onclick="location.href='/member/join'">회원가입--%>
<%--                                            </button>--%>
<%--                                        </form>--%>
<%--                                    </main>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/resources/js/form-validation.js"></script>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/main.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v55bfa2fee65d44688e90c00735ed189a1713218998793"
        integrity="sha512-FIKRFRxgD20moAo96hkZQy/5QojZDAbyx0mQ17jEGHCJc/vi0G2HXLtofwD7Q3NmivvP9at5EVgbRqOaOQb+Rg=="
        data-cf-beacon='{"rayId":"879d448bbc1a29e5","version":"2024.4.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
        crossorigin="anonymous"></script>
<script>
    let idSvBtn = document.getElementById("save_id");
    let autoBtn = document.getElementById("auto_login");
    idSvBtn.addEventListener("click", (e) => {
        if (idSvBtn.value == "on") {
            idSvBtn.value = ""
            console.log(idSvBtn.value);
        } else {
            idSvBtn.value = "on"
            console.log(idSvBtn.value);
        }

    });
    autoBtn.addEventListener("click", (e) => {
        if (autoBtn.value == "on") {
            autoBtn.value = ""
            console.log(autoBtn.value);
        } else {
            autoBtn.value = 'on';
            console.log(autoBtn.value);
        }
    });
    const triggerTabList = document.querySelectorAll('#myTab button')
    triggerTabList.forEach(triggerEl => {
        const tabTrigger = new bootstrap.Tab(triggerEl)

        triggerEl.addEventListener('click', event => {
            event.preventDefault()
            tabTrigger.show()
        })
    })

    <c:if test="${ not empty errors}">
        document.getElementById("div_err").innerHTML = "<div style='width:100%;margin-bottom:.25rem;font-size:.875em;color:#dc3545'>${errors}</div>";
        document.getElementById("div_err").style.display = "block";
    </c:if>
    let member_tab = document.getElementById("member-tab");
    let guest_tab = document.getElementById("guest-tab");
    member_tab.addEventListener("click", (e) => {
        document.getElementById("name").value = '';
        document.getElementById("order_no").value = '';
        document.getElementById("pwdGuest").value = '';
    });
    guest_tab.addEventListener("click", (e) => {
        if (${empty requestScope.save_id}) {
            document.getElementById("member_id").value = '';
            document.getElementById("pwd").value = '';
            document.getElementById("save_id").checked = false;
        }
    });

    let member_id = document.getElementById("member_id");
    let pwd = document.getElementById("pwd");

    document.getElementById("loginBtn").addEventListener("click", (e)=>{
       if(member_id.value.length <1 || pwd.value.length <1) {
           e.preventDefault();
           document.getElementById("div_err").innerHTML = "<div style='width:100%;margin-bottom:.25rem;font-size:.875em;color:#dc3545'>칸을 모두 입력해주세요.</div>";
           document.getElementById("div_err").style.display = "block";
       }
       else {
           document.getElementById("frmLogin").submit;
       }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
