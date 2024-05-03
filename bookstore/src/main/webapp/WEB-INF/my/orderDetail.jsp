<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-04-25
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Myy cart</title>

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

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <div id="page-content-wrapper">
        <div class="container py-h">
            <div class="row">
                <div class="col-md-3"style="background-color: #e4f3ef">
                    <%@ include file="/WEB-INF/common/sidebar.jsp"%>
                </div>
                <div class="col-md-9">
                    <%--                    <section class="h-100 h-custom" style="background-color: #eee;">--%>
                    <div class="container py-5 h-100">
                        <%--                            <div class="row d-flex justify-content-center align-items-center h-100">--%>
                        <div class="col">
                            <div class="card">
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h5 class="mb-3"><a href="#!" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>주문 상세 내역</a></h5>
                                            <hr>
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <div>
                                                    <p class="mb-1">Shopping cart</p>
                                                    <p class="mb-0">You have items in your cart</p>
                                                </div>
                                            </div>
                                            <c:choose>
                                                <c:when test="${not empty orderDetailDTO}">
                                                    <c:forEach items="${orderDetailDTO}" var="list" varStatus="status">
                                                        <div class="card mb-3">
                                                            <div class="card-body">
                                                                <div class="d-flex justify-content-between">
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <div>
                                                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                                                                 class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                                        </div>
                                                                        <div class="ms-3">
                                                                            <h5>${list.product_name}</h5>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <input id="form${list.order_idx}" min="1" name="quantity" value="${list.product_cnt}" type="number"
                                                                               class="form-control form-control-sm me-2" style="width:50px; text-align: center" readonly/>
                                                                        <div>
                                                                            <p class="small mb-0">결제금액 : ${list.order_price}</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="card mb-3">
                                                        <div class="card-body">
                                                            <div class="text-end py-2">
                                                                <div>
                                                                    <span style="font-size: 20px;">총 결제금액 : <span style="color: indianred; font-size: 22px">${total_price + shipping}원</span></span>
                                                                </div>
                                                            </div>
                                                            <p class="text-end" style="color: indianred; font-size: 14px">※ 15,000원이상 구입시 배송비 무료</p>
                                                        </div>
                                                    </div>
                                                    <form id="orderCancel" name="orderCancel" method="post" action="/my/orderCancelRequest">
                                                        <input type="hidden" name="member_id" value="${sessionScope.member_id}" />
                                                        <input type="hidden" name="order_code" value="${order_code}" />
                                                        <input type="hidden" name="delivery_state" value="${delivery_state}" />
                                                        <div class="row justify-content-around">
                                                            <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle col-4" onclick="location.href='/my/order?member_id=${sessionScope.member_id}&delivery_state=${delivery_state}'">목록</button>
                                                            <c:if test="${delivery_state == '배송전'}">
                                                                <button type="button" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-4" onclick="cancelOrder()">주문취소</button>
                                                            </c:if>
                                                            <c:if test="${delivery_state == '배송중'}">
                                                                <button type="button" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-4" onclick="cancelOrder()">주문취소요청</button>
                                                            </c:if>
                                                            <c:if test="${delivery_state == '주문취소요청'}">
                                                                <button type="button" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-4" onclick="cancelOrder()">요청취소</button>
                                                            </c:if>
                                                            <c:if test="${delivery_state == '배송완료'}">
                                                                <button type="button" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-4" disabled>배송완료</button>
                                                            </c:if>
                                                            <c:if test="${delivery_state == '취소완료'}">
                                                                <button type="button" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-4" disabled>취소완료</button>
                                                            </c:if>
                                                        </div>
                                                    </form>
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
    function cancelOrder() {
        const frm = document.getElementById("orderCancel");
        console.log(frm);
        let delete_check = confirm("주문 취소 요청을 하시겠습니까?");

        if(delete_check) {
            frm.submit();
            <%--$.ajax({--%>
            <%--   type : "post",--%>
            <%--   url : "/my/orderCancelRequest",--%>
            <%--   data : {--%>
            <%--       member_id : "${sessionScope.member_id}",--%>
            <%--       order_code : "${order_code}",--%>
            <%--       delivery_state : "${delivery_state}"--%>
            <%--   },--%>
            <%--   success : function (url) {--%>
            <%--       console.log(url);--%>

            <%--       window.location.href = url;--%>
            <%--   }--%>
            <%--});--%>
        }
    }
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>
