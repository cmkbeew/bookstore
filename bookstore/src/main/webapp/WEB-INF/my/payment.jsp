<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>주문 결제</title>

    <%-- header 부트스트랩   --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <%-- list 부트스트랩   --%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>
<body>
<%@ include file="../common/header.jsp"%>

<section class="py-h" style="background-color: #eee;">
    <div class="container py-5">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">
                        <div class="row">
                            <div class="col-lg-7">
                                <h5 class="mb-3">
                                    <a href="#!" class="text-body">
                                        <i class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping
                                    </a>
                                </h5>
                                <hr>
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <div>
                                        <p class="mb-1">Shopping cart</p>
                                        <p class="mb-0">You have 4 items in your cart</p>
                                    </div>
                                    <div>
                                        <p class="mb-0">
                                            <span class="text-muted">Sort by:</span>
                                            <a href="#!" class="text-body">price <i class="fas fa-angle-down mt-1"></i></a>
                                        </p>
                                    </div>
                                </div>

                                <c:forEach items="${cartList}" var="list">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex flex-row align-items-center">
                                                    <div>
                                                        <img
                                                                src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                                                class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                    </div>
                                                    <div class="ms-3">
                                                        <h5>${list.product_name}</h5>
                                                        <p class="small mb-0">${list.publisher}</p>
                                                    </div>
                                                </div>
                                                <div class="d-flex flex-row align-items-center">
                                                    <input id="form${list.cart_idx}" min="1" name="product_cnt" value="${list.product_cnt}" type="number"
                                                           class="form-control form-control-sm me-3" style="width:50px; text-align: center" readonly/>

                                                    <div style="width: 100px;">
                                                        <c:choose>
                                                            <c:when test="${list.display_price eq list.price}">
                                                                <p class="small mb-0">정가 : ${list.price}</p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p class="small mb-0"><del>정가 : ${list.price}</del></p>
                                                                <p class="small mb-0">판매가 : ${list.display_price}</p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- 오른쪽 결제 창 -->
                            <div class="col-lg-5">
                                <div class="card bg-primary text-white rounded-3">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h5 class="mb-0">주문 고객 정보</h5>
                                        </div>

                                        <form class="mt-4">
                                            <div class="form-outline form-white mb-2">
                                                <label class="form-label" for="name">이름</label>
                                                <input type="text" id="name" name="name" class="form-control form-control-lg"
                                                       placeholder="Name" value="${sessionScope.name}" />
                                            </div>

                                            <div class="form-outline form-white mb-2">
                                                <label class="form-label" for="phone_num">휴대폰번호</label>
                                                <input type="text" id="phone_num" name="phone_num" class="form-control form-control-lg"
                                                       placeholder="010 5678 9012" maxlength="13" value="${sessionScope.phone_num}" />
                                            </div>
                                            <div class="form-outline form-white mb-5">
                                                <label class="form-label" for="email">이메일</label>
                                                <input type="email" id="email" name="email" class="form-control form-control-lg"
                                                       placeholder="Email" value="${sessionScope.email}"/>
                                            </div>


                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <h5 class="mb-0">받는 고객 정보</h5>
                                                <label class="mb-0" style="font-size: 13px;" for="same_check">
                                                    <input type="checkbox" id="same_check" />
                                                    주문 고객 정보와 일치하면 선택하세요.
                                                </label>
                                            </div>

                                            <div class="form-outline form-white mb-2">
                                                <label class="form-label" for="receiver">받는 사람</label>
                                                <input type="text" id="receiver" name="name" class="form-control form-control-lg"
                                                       placeholder="Name" />
                                            </div>

                                            <div class="form-outline form-white mb-2">
                                                <label class="form-label" for="receiver_phone_num">휴대폰번호</label>
                                                <input type="text" id="receiver_phone_num" name="receiver_phone_num" class="form-control form-control-lg"
                                                       placeholder="010 5678 9012" maxlength="11" />
                                            </div>

                                            <div class="form-outline form-white mb-2">
                                                <label class="form-label" for="zipcode">배송지 주소</label>

                                                <div class="d-flex justify-content-between align-items-center">
                                                    <input type="text" id="zipcode" name="zipcode" class="form-control form-control-lg me-2"
                                                           placeholder="우편번호" required readonly />
                                                    <input type="button" class="btn" value="주소 찾기" name="zipcodebtn" id="zipcodebtn" onclick="addr()">
                                                </div>
                                            </div>

                                            <div class="form-outline form-white mb-2">
                                                <input type="text" id="addr1" name="addr1" class="form-control form-control-lg"
                                                       placeholder="기본주소" maxlength="11" />
                                            </div>
                                            <div class="form-outline form-white mb-2">
                                                <input type="text" id="addr2" name="addr2" class="form-control form-control-lg"
                                                       placeholder="상세주소" maxlength="11" />
                                            </div>
                                        </form>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">주문상품</p>
                                            <p class="mb-2">4798 ₩</p>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">배송비</p>
                                            <p class="mb-2">2500 ₩</p>
                                        </div>

                                        <div class="d-flex justify-content-between mb-4">
                                            <p class="mb-2">Total(Incl. taxes)</p>
                                            <p class="mb-2">$4818.00</p>
                                        </div>

                                        <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-block btn-lg">
                                            <div class="d-flex justify-content-between">
                                                <span>$4818.00</span>
                                                <span>Checkout</span>
                                            </div>
                                        </button>
                                        <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-block btn-lg" onclick="location.href='/my/cart?member_id=${sessionScope.member_id}'">
                                            이전으로
                                        </button>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp"%>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v55bfa2fee65d44688e90c00735ed189a1713218998793"
        integrity="sha512-FIKRFRxgD20moAo96hkZQy/5QojZDAbyx0mQ17jEGHCJc/vi0G2HXLtofwD7Q3NmivvP9at5EVgbRqOaOQb+Rg=="
        data-cf-beacon='{"rayId":"879d448bbc1a29e5","version":"2024.4.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
        crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function addr() {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("addr1").value = data.roadAddress;
            }
        }).open();
    }

    document.getElementById("same_check").addEventListener("click", function(e) {
        let receiver = document.getElementById("receiver");
        let rpn = document.getElementById("receiver_phone_num");
        let zipcode = document.getElementById("zipcode");
        let addr1 = document.getElementById("addr1");
        let addr2 = document.getElementById("addr2");

        if(document.getElementById("same_check").checked) {
            receiver.value = "${sessionScope.name}";
            rpn.value = "${sessionScope.phone_num}";
            zipcode.value = "${sessionScope.zipcode}";
            addr1.value = "${sessionScope.addr1}";
            addr2.value = "${sessionScope.addr2}";
        } else {
            receiver.value = "";
            rpn.value = "";
            zipcode.value = "";
            addr1.value = "";
            addr2.value = "";
        }
    })

    // function same_check() {
    <%--    let sc = document.getElementById("same_check");--%>
    <%--    let receiver = document.getElementById("receiver");--%>
    <%--    let rpn = document.getElementById("receiver_phone_num");--%>
    <%--    let zipcode = document.getElementById("zipcode");--%>
    <%--    let addr1 = document.getElementById("addr1");--%>

    <%--    console.log(sc.checked);--%>

    <%--    if(sc.checked) {--%>
    <%--        receiver.value = "${sessionScope.name}";--%>
    <%--        rpn.value = "${sessionScope.phone_num}";--%>
    <%--        zipcode.value = "${sessionScope.zipcode}";--%>
    <%--        addr1.value = "${sessionScope.addr1}";--%>
    <%--    } else {--%>
    <%--        receiver.value = "";--%>
    <%--        rpn.value = "";--%>
    <%--        zipcode.value = "";--%>
    <%--        addr1.value = "";--%>
    <%--    }--%>
    <%--}--%>


</script>
</body>
</html>
