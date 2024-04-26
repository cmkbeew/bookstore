<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    <title>Login</title>
    <script nonce="527f5118-0b83-4ded-83c4-52d880cabcd3">try {
        (function (w, d) {
            !function (ng, nh, ni, nj) {
                ng[ni] = ng[ni] || {};
                ng[ni].executed = [];
                ng.zaraz = {deferred: [], listeners: []};
                ng.zaraz._v = "5594";
                ng.zaraz.q = [];
                ng.zaraz._f = function (nk) {
                    return async function () {
                        var nl = Array.prototype.slice.call(arguments);
                        ng.zaraz.q.push({m: nk, a: nl})
                    }
                };
                for (const nm of ["track", "set", "debug"]) ng.zaraz[nm] = ng.zaraz._f(nm);
                ng.zaraz.init = () => {
                    var nn = nh.getElementsByTagName(nj)[0], no = nh.createElement(nj),
                        np = nh.getElementsByTagName("title")[0];
                    np && (ng[ni].t = nh.getElementsByTagName("title")[0].text);
                    ng[ni].x = Math.random();
                    ng[ni].w = ng.screen.width;
                    ng[ni].h = ng.screen.height;
                    ng[ni].j = ng.innerHeight;
                    ng[ni].e = ng.innerWidth;
                    ng[ni].l = ng.location.href;
                    ng[ni].r = nh.referrer;
                    ng[ni].k = ng.screen.colorDepth;
                    ng[ni].n = nh.characterSet;
                    ng[ni].o = (new Date).getTimezoneOffset();
                    if (ng.dataLayer) for (const nt of Object.entries(Object.entries(dataLayer).reduce(((nu, nv) => ({...nu[1], ...nv[1]})), {}))) zaraz.set(nt[0], nt[1], {scope: "page"});
                    ng[ni].q = [];
                    for (; ng.zaraz.q.length;) {
                        const nw = ng.zaraz.q.shift();
                        ng[ni].q.push(nw)
                    }
                    no.defer = !0;
                    for (const nx of [localStorage, sessionStorage]) Object.keys(nx || {}).filter((nz => nz.startsWith("_zaraz_"))).forEach((ny => {
                        try {
                            ng[ni]["z_" + ny.slice(7)] = JSON.parse(nx.getItem(ny))
                        } catch {
                            ng[ni]["z_" + ny.slice(7)] = nx.getItem(ny)
                        }
                    }));
                    no.referrerPolicy = "origin";
                    no.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(ng[ni])));
                    nn.parentNode.insertBefore(no, nn)
                };
                ["complete", "interactive"].includes(nh.readyState) ? zaraz.init() : ng.addEventListener("DOMContentLoaded", zaraz.init)
            }(w, d, "zarazData", "script");
        })(window, document)
    } catch (e) {
        throw fetch("/cdn-cgi/zaraz/t"), e;
    }
    ;</script>
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
                                <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                        data-bs-target="#home-tab-pane" type="button" role="tab"
                                        aria-controls="home-tab-pane" aria-selected="true">회원 로그인
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                                        data-bs-target="#profile-tab-pane" type="button" role="tab"
                                        aria-controls="profile-tab-pane" aria-selected="false">비회원 로그인(주문 조회)
                                </button>
                            </li>
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
                                                <label for="member_id">ID</label>
                                                <input type="text" class="form-control" name="member_id" id="member_id"
                                                       value="${requestScope.id}">
                                            </div>
                                            <div class="form-floating form-group last mb-4">
                                                <label for="pwd">비밀번호</label>
                                                <input type="password" class="form-control" name="pwd" id="pwd">
                                            </div>
                                            <div class="invalid-feedback mb-3" id="div_err">
                                            </div>
                                            <div class="d-flex mb-5 align-items-center">
                                                <label class="control control--checkbox mb-0"><span class="caption">아이디 저장</span>
                                                    <input type="checkbox" name="save_id" id="save_id" value=""
                                                           <c:if test="${not empty requestScope.save_id}">checked="checked"</c:if>>
                                                    <div class="control__indicator"></div>
                                                </label>
                                                <label class="control control--checkbox ml-2 mb-0"><span
                                                        class="caption">자동 로그인</span>
                                                    <input type="checkbox" name="auto_login" id="auto_login" value=""
                                                           <c:if test="${not empty requestScope.auto_login}">checked="checked"</c:if>>
                                                    <div class="control__indicator"></div>
                                                </label>
                                                <span class="ml-auto"><a href="/login/find"
                                                                         class="forgot-pass">계정 찾기</a></span>
                                            </div>
                                            <input type="submit" value="로그인"
                                                   class="btn btn-pill text-white btn-block btn-primary">
                                            <span class="d-block text-center my-4 text-muted"> or </span>
                                            <button type="button" class="btn btn-pill text-white btn-block btn-dark"
                                                    onclick="location.href='/member/join'">회원가입
                                            </button>
                                        </form>
                                    </main>
                                </div>
                                <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
                                     aria-labelledby="profile-tab" tabindex="0">
                                    <div class="mb-4">
                                        <h3><strong>비회원 로그인</strong></h3>
                                        <p class="mt-4 mb-4">비회원의 경우, 주문 시 주문번호로 조회 가능합니다.</p>
                                    </div>
                                    <main class="form-signin">
                                        <form name="frmLoginGuest" id="frmLoginGuest" action="/my/order" method="post">
                                            <div class="form-floating form-group first">
                                                <label for="name">이름</label>
                                                <input type="text" class="form-control" name="name" id="name">
                                            </div>
                                            <div class="form-floating form-group last mb-4">
                                                <label for="order_no">주문번호</label>
                                                <input type="text" class="form-control" name="order_no" id="order_no">
                                            </div>
                                            <div class="form-floating form-group last mb-4">
                                                <label for="pwdGuest">비밀번호</label>
                                                <input type="password" class="form-control" name="pwd" id="pwdGuest">
                                            </div>
                                            <div class="invalid-feedback mb-3">
                                            </div>
                                            <input type="submit" value="조회"
                                                   class="btn btn-pill text-white btn-block btn-primary">
                                            <span class="d-block text-center my-4 text-muted"> or </span>
                                            <button type="button" class="btn btn-pill text-white btn-block btn-dark"
                                                    onclick="location.href='/member/join'">회원가입
                                            </button>
                                        </form>
                                    </main>
                                </div>

                            </div>
                            <%--                                <div class="social-login text-center">--%>
                            <%--                                    <a href="#" class="facebook">--%>
                            <%--                                        <span class="icon-facebook mr-3"></span>--%>
                            <%--                                    </a>--%>
                            <%--                                    <a href="#" class="twitter">--%>
                            <%--                                        <span class="icon-twitter mr-3"></span>--%>
                            <%--                                    </a>--%>
                            <%--                                    <a href="#" class="google">--%>
                            <%--                                        <span class="icon-google mr-3"></span>--%>
                            <%--                                    </a>--%>
                            <%--                                </div>--%>
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
    const serverValidResult = {};
    <c:forEach items="${errors}" var="err">
    if (document.getElementById("div_err") != null) {
        document.getElementById("div_err").innerHTML = "<div style='width:100%;margin-bottom:.25rem;font-size:.875em;color:#dc3545'>${err.getField()}필드는 공백일 수 없습니다.</div>";
        document.getElementById("div_err").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
    console.log(serverValidResult);
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
