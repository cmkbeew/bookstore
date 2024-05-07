<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>주문 결제</title>
    
<%--    &lt;%&ndash; list 부트스트랩   &ndash;%&gt;--%>
<%--    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />--%>
<%--    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">--%>
<%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />--%>
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
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>
<body style="padding-bottom: 0px;">
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
                                    <p class="text-body">
                                        <i class="fas fa-long-arrow-alt-left me-2"></i>결제목록
                                    </p>
                                </h5>
                                <hr>
                                <div class="d-flex justify-content-between align-items-center mb-4">
<%--                                    <div>--%>
<%--                                        <p class="mb-1">Shopping cart</p>--%>
<%--                                        <p class="mb-0">You have 4 items in your cart</p>--%>
<%--                                    </div>--%>
<%--                                    <div>--%>
<%--                                        <p class="mb-0">--%>
<%--                                            <span class="text-muted">Sort by:</span>--%>
<%--                                            <a href="#!" class="text-body">price <i class="fas fa-angle-down mt-1"></i></a>--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
                                </div>
                                <form class="mt-4" id="frmOrder" method="post" action="/my/payment">
                                    <input type="hidden" name="member_id" value="${sessionScope.member_id}" />
                                    <input type="hidden" name="pay_price" value="${total_price + shipping}"/>

                                    <c:forEach items="${cartList}" var="list">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <div class="d-flex flex-row align-items-center">
                                                    <div>
                                                        <img
                                                        <img src="<spring:url value='/resources/img/product/${list.save_file_name}'/>"
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

                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="text-end">
                                                <span style="font-size: 20px;">주문금액 합계 : ${total_price}원 + 배송비 : ${shipping}원</span>
                                            </div>
                                            <hr>
                                            <div class="text-end">
                                                <span style="font-size: 20px;">총 주문금액 : <span style="color: indianred; font-size: 22px">${total_price + shipping}원</span></span>
                                            </div>
                                        </div>
                                    </div>
                            </div>

                            <!-- 오른쪽 결제 창 -->
                            <div class="col-lg-5">
                                <div class="card bg-primary text-white rounded-3">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h5 class="mb-0">주문 고객 정보</h5>
                                        </div>
                                        <div class="form-outline form-white mb-2">
                                            <label class="form-label" for="name">이름</label>
                                            <input type="text" id="name" name="name" class="form-control form-control-lg text-black"
                                                   placeholder="Name" value="${sessionScope.name}" />
                                        </div>
                                        <div id="div_err_name" style="display: none"></div>

                                        <div class="form-outline form-white mb-2">
                                            <label class="form-label" for="phone_num">휴대폰번호</label>
                                            <input type="text" id="phone_num" name="phone_num" class="form-control form-control-lg text-black"
                                                   placeholder="010-0000-0000" maxlength="13" value="${sessionScope.phone_num}" />
                                        </div>
                                        <div id="div_err_phone_num" style="display: none"></div>

                                        <div class="form-outline form-white mb-5">
                                            <label class="form-label" for="email">이메일</label>
                                            <input type="email" id="email" name="email" class="form-control form-control-lg text-black"
                                                   placeholder="Email" value="${sessionScope.email}"/>
                                            <div id="div_err_email" style="display: none"></div>
                                        </div>


                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h5 class="mb-0">받는 고객 정보</h5>
                                            <label class="mb-0" style="font-size: 13px;" for="same_check">
                                                <input type="checkbox" name="same_check" id="same_check" <c:if test="${same_check == 'on'}">checked</c:if> />
                                                주문 고객 정보와 일치하면 선택하세요.
                                            </label>
                                        </div>

                                        <div class="form-outline form-white mb-2">
                                            <label class="form-label" for="receiver_name">받는 사람</label>
                                            <input type="text" id="receiver_name" name="receiver_name" class="form-control form-control-lg text-black"
                                                   placeholder="Name" value="${orderDTO.receiver_name}" />
                                        </div>
                                        <div id="div_err_receiver_name" style="display: none"></div>

                                        <div class="form-outline form-white mb-2">
                                            <label class="form-label" for="receiver_phone_num">휴대폰번호</label>
                                            <input type="text" id="receiver_phone_num" name="receiver_phone_num" class="form-control form-control-lg text-black"
                                                   placeholder="010-0000-0000" maxlength="13" value="${orderDTO.receiver_phone_num}"/>
                                        </div>
                                        <div id="div_err_receiver_phone_num" style="display: none"></div>

                                        <div class="form-outline form-white mb-2">
                                            <label class="form-label" for="zipcode">배송지 주소</label>

                                            <div class="d-flex justify-content-between align-items-center">
                                                <input type="text" id="zipcode" name="zipcode" class="form-control form-control-lg text-black me-2"
                                                       placeholder="우편번호" value="${orderDTO.zipcode}" required readonly />
                                                <input type="button" class="btn" value="주소 찾기" name="zipcodebtn" id="zipcodebtn" onclick="addr()">
                                            </div>
                                        </div>
                                        <div id="div_err_zipcode" style="display: none"></div>

                                        <div class="form-outline form-white mb-2">
                                            <input type="text" id="addr1" name="addr1" class="form-control form-control-lg text-black"
                                                   placeholder="기본주소" maxlength="11" value="${orderDTO.addr1}" readonly/>
                                        </div>
                                        <div id="div_err_addr1" style="display: none"></div>

                                        <div class="form-outline form-white mb-2">
                                            <input type="text" id="addr2" name="addr2" class="form-control form-control-lg text-black"
                                                   placeholder="상세주소" value="${orderDTO.addr2}" />
                                        </div>
                                        <div id="div_err_addr2" style="display: none"></div>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">주문금액</p>
                                            <p class="mb-2">${total_price} ₩</p>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">배송비</p>
                                            <p class="mb-2">${shipping} ₩</p>
                                        </div>
                                        <p class="mb-2 text-end" style="color: indianred; font-size: 14px">※ 15,000원이상 구입시 배송비 무료</p>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between mb-4 fs-4">
                                            <p class="mb-2">최종결제금액</p>
                                            <p class="mb-2">${total_price + shipping} ₩</p>
                                        </div>

                                        <div class="form-outline form-white">
                                            <label class="form-label">결제 수단</label>
                                        </div>

                                        <div class="form-check form-check-inline mb-2">
                                            <input class="form-check-input" type="radio" name="pay_method" id="pay_method" value="무통장입금" checked>
                                            <label class="form-check-label" for="pay_method">무통장입금</label>
                                        </div>

                                        <div class="form-outline form-white">
                                            <label class="form-label">택배 회사</label>
                                        </div>
                                        <div class="form-check form-check-inline d-flex justify-content-between align-items-center">
                                            <label class="form-check-label" for="hanjin">
                                                <input class="form-check-input" type="radio" name="delivery_company" id="hanjin" value="한진택배">한진택배
                                            </label>
                                            <label class="form-check-label" for="cj">
                                                <input class="form-check-input" type="radio" name="delivery_company" id="cj" value="CJ대한통운">CJ대한통운
                                            </label>
                                            <label class="form-check-label" for="post">
                                                <input class="form-check-input" type="radio" name="delivery_company" id="post" value="우체국택배">우체국택배
                                            </label>
                                        </div>
                                        <div id="div_err_delivery_company" style="display: none"></div>

                                        <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-block btn-lg" onclick="orderCheck()">
                                            <span>결제하기</span>
                                        </button>
                                        <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-block btn-lg" onclick="location.href='/my/cart?member_id=${sessionScope.member_id}'">
                                            이전으로
                                        </button>
                                        </form>
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
    const serverValidResult = {};
    <c:forEach items="${errors}" var="err">
        if(document.getElementById("div_err_${err.getField()}") != null) {
            document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red;'>${err.defaultMessage}</span>";
            document.getElementById("div_err_${err.getField()}").style.display = "block";
        }
        serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    function addr() {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("addr1").value = data.roadAddress;
            }
        }).open();
    }

    document.getElementById("same_check").addEventListener("click", function(e) {
        let receiver_name = document.getElementById("receiver_name");
        let rpn = document.getElementById("receiver_phone_num");
        let zipcode = document.getElementById("zipcode");
        let addr1 = document.getElementById("addr1");
        let addr2 = document.getElementById("addr2");

        if(document.getElementById("same_check").checked) {
            receiver_name.value = "${sessionScope.name}";
            rpn.value = "${sessionScope.phone_num}";
            zipcode.value = "${sessionScope.zipcode}";
            addr1.value = "${sessionScope.addr1}";
            addr2.value = "${sessionScope.addr2}";
        } else {
            receiver_name.value = "";
            rpn.value = "";
            zipcode.value = "";
            addr1.value = "";
            addr2.value = "";
        }
    });

    function orderCheck() {
        let frm = document.getElementById("frmOrder");
        let order_check = confirm("결제하시겠습니까?");

        if(order_check) {
            frm.submit();
        }
    }
</script>
</body>
</html>
