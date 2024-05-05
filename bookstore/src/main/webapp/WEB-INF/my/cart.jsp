<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>My cart</title>

<%--    &lt;%&ndash;  header 부트스트랩  &ndash;%&gt;--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>--%>
<%--    <link href="/resources/css/admin/styles.css" rel="stylesheet" />--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">--%>

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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/css/admin/styles.css">

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0; }
    </style>
</head>

<body style="padding-bottom: 0px; background-color: #eeeeee;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="container" id="wrapper">
    <div id="page-content-wrapper">
        <div class="container">
            <div class="row g-5" style="min-height: 80vh;">
                <div class="col-md-3" style="background-color: #e4f3ef">
                <%@ include file="/WEB-INF/common/sidebar.jsp"%>
                </div>
                <div class="col-md-9">
                    <div class="container py-5 h-100">
                        <div class="col">
                            <div class="card">
                                <div class="card-body p-4">
                                    <div class="row">
                                        <form id="frm" name="frm" method="post" action="">
                                            <div class="col-lg-12">
                                                <h5 class="mb-3"><a href="/product/list?type=유아" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>계속 쇼핑하기</a></h5>
                                                <hr>
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <div>
                                                        <p class="mb-1">Shopping cart</p>
                                                        <p class="mb-0">You have items in your cart</p>
                                                    </div>
                                                </div>
                                                <c:choose>
                                                <c:when test="${not empty cartList }" >
                                                    <c:forEach items="${cartList}" var="list" varStatus="status">
                                                        <div class="card mb-3">
                                                            <div class="card-body">
                                                                <div class="d-flex justify-content-between">
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <div><label class="control control--checkbox">
                                                                            <input class="control_value" type="checkbox" name="select" id="${list.cart_idx}" value="${list.cart_idx}">
                                                                            <div class="control__indicator"></div>
                                                                        </label></div>
                                                                        <div>
                                                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                                                                    class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                                        </div>
                                                                        <div class="ms-3">
                                                                            <h5>${list.product_name}</h5>
                                                                            <p class="small mb-0">${list.publisher}</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2 up" type="button"
                                                                                id="minus${list.cart_idx}" onclick="this.parentNode.querySelector('input[type=number]').stepDown(); bookCntUpdate(${list.cart_idx});"
                                                                                <c:out value="${list.product_cnt eq 1 ? 'disabled' : '' }"/>>
                                                                            <span class="material-symbols-outlined">remove</span>
                                                                        </button>

                                                                        <input id="form${list.cart_idx}" min="1" name="quantity" value="${list.product_cnt}" type="number"
                                                                               class="form-control form-control-sm totalCnt" style="width:50px; text-align: center" readonly/>
                                                                        <div class="cart_info">
                                                                        <input type="hidden" class="cart_idx"  value="${list.cart_idx}"/>
                                                                        <input type="hidden" class="cart_price"  value="${list.display_price}"/>
                                                                        <input type="hidden" class="cart_cnt"  value="${list.product_cnt}"/>
                                                                            <input type="hidden" class="cart_totalPrice" value="${list.display_price * list.product_cnt}"/>
                                                                        </div>



                                                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2" type="button"
                                                                                id="plus${list.cart_idx}" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); bookCntUpdate(${list.cart_idx}); totalCnt(${list.cart_idx});" >
                                                                            <span class="material-symbols-outlined">add</span>
                                                                        </button>
                                                                        <div style="width: 150px;">
                                                                            <c:choose>
                                                                                <c:when test="${list.discount == 0}">
                                                                                    <p class="small mb-0">정가 : ${list.price} 원</p>
                                                                                    <%--                                                                                    <p class="small mb-0">정가 : ${list.price}</p>--%>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <p class="small mb-0"><del>정가 : ${list.price} 원</del></p>
                                                                                    <p class="small mb-0">판매가 : ${list.display_price} 원</p>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </div>
                                                                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="card mb-3">
                                                        <div class="card-body">
                                                            <div class="text-start py-2">
                                                                <div>
                                                                    <span style="font-size: 20px;">총 도서금액 : <span style="color: #5c9ecd; font-size: 20px">${total_price}원</span></span><br>
                                                                    <span style="font-size: 20px;">배송비 : <span style="font-size: 20px">${shipping}원</span></span><br>
                                                                    <p class="text-start" style="color: indianred; font-size: 12px">※ 15,000원이상 구입시 배송비 무료</p>
                                                                    <hr>
                                                                    <span style="font-size: 20px;">총 결제금액 : <span style="color: indianred; font-size: 20px">${total_price + shipping}원</span></span><br>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-around">
                                                        <button type="button" id="delBtn" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-3">삭제하기</button>
                                                        <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle col-4" onclick="selectProduct()">선택 상품 주문하기</button>
                                                        <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle col-4" onclick="location.href='/my/payment?member_id=${sessionScope.member_id}'">전체 상품 주문하기</button>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="card mb-3">
                                                        <div class="card-body">
                                                            <div class="d-flex justify-content-center">
                                                                <p>장바구니가 비어있습니다.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
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
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
<script>
    let total_cnt = document.getElementById("total_cnt");
    let totalCntValue = document.querySelector(".totalCnt");
    let total_price = document.getElementById("total_price");
    let delBtn = document.getElementById("delBtn");
    delBtn.addEventListener("click", (e) => {
        document.getElementById("frm").action = "/my/deleteCart";
        document.getElementById("frm").submit();
    });


    function bookCntUpdate(cartIdx) {
        let product_cnt = document.getElementById("form" + cartIdx).value;

        $.ajax({
            url: "/my/updateCnt",
            type: "post",
            data: {
                product_cnt: product_cnt,
                cart_idx: cartIdx,
                or_member_id: "${sessionScope.member_id}"
            },
            success: function (url) {
                location.reload(url);

            },
            error: function (err) {
                console.log(err);
            }
        });
    }

    const allCheckboxDOM = document.querySelectorAll(".control--checkbox");
    const control = document.querySelectorAll(".control_value");
    let idx = [];

    for (let i = 0; i < control.length; i++) {
        control[i].addEventListener("click", function (e) {
            // if(!e.target.parentNode.parentNode.parentNode.children[0].children[0].children[0].checked) {
            //     e.target.parentNode.parentNode.parentNode.children[0].children[0].children[0].checked = true;
            // } else {
            //     e.target.parentNode.parentNode.parentNode.children[0].children[0].children[0].checked = false;
            // }
            // e.target.parentNode.parentNode.parentNode.children[0].children[0].children[0].checked = true;
            console.log(e.target.checked)
            console.log(e.target.id);
            idx.push(e.target.id);
            console.log(idx);
        }, false)
    }

</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>
