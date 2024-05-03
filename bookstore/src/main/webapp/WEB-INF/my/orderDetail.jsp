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

    <title>order_detail</title>

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
            margin: 0;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex" id="wrapper">
    <div id="page-content-wrapper">
        <div class="container py-h">
            <div class="row">
                <div class="col-md-3"style="background-color: #e4f3ef">
                    <%@ include file="/WEB-INF/common/sidebar.jsp"%>
                </div>
                <div class="col-md-9">
                    <div class="container py-5 h-100">
                        <div class="col">
                            <div class="card">
                                <div class="card-body p-4">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h5 class="mb-3"><i class="fas fa-long-arrow-alt-left me-2"></i>주문 상세 내역</h5>
                                            <hr>
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <div>
                                                    <p class="mb-1">주문번호</p>
                                                    <p class="mb-0">${orderDetailDTO[0].order_code}</p>
                                                </div>
                                            </div>
                                            <c:if test="${not empty orderDetailDTO}">
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
                                                                            <p class="small mb-0">결제금액 : ${list.order_price} 원</p>
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
                                                <span class="badge rounded-pill bg-success mb-2" style=" height : 33px; font-size: 1rem">주문,배송정보</span>
                                                <div class="card mb-3">
                                                    <div class="card-body">
                                                        <div class="d-flex justify-content-between">
                                                            <div class="col-md-6">
                                                                <label  class="form-label">주문하신 분</label>
                                                                <input type="text" class="form-control align-middle" value="${orderDetailDTO[0].member_id}" style="height:50px" readonly>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">받으시는 분</label>
                                                                <input type="text" class="form-control" value="${orderDetailDTO[0].receiver_name}" style="height:50px" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <div class="col-md-6">
                                                                <label  class="form-label">전화번호</label>
                                                                <input type="text" class="form-control" value="${orderDetailDTO[0].receiver_phone_num}" style="height:50px" readonly>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">배송 받는 주소</label>
                                                                <input type="text" class="form-control" value="${orderDetailDTO[0].receiver_addr}" style="height:50px" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <div class="col-md-12">
                                                                <label  class="form-label">배송 조회</label>
                                                                <c:choose>
                                                                    <c:when test="${orderDetailDTO[0].delivery_state eq '배송전'}">
                                                                        <input type="text" class="form-control"  value="${orderDetailDTO[0].delivery_state}" style="height:50px" readonly>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control"  value="${orderDetailDTO[0].delivery_state} / ${orderDetailDTO[0].delivery_company}" style="height:50px" readonly>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <span class="badge rounded-pill bg-success mb-2" style=" height : 33px; font-size: 1rem">결제정보</span>
                                                <div class="card mb-3">
                                                    <div class="card-body">
                                                        <div class="d-flex justify-content-between">
                                                            <div class="col-md-6">
                                                                <label class="form-label">결제 수단</label>
                                                                <input type="text" class="form-control" value="${orderDetailDTO[0].pay_method}" style="height:50px" readonly>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label">총 결제 금액</label>
                                                                <input type="text" class="form-control" value="${total_price + shipping}원" style="height:50px" readonly>
                                                            </div>
                                                        </div>


                                                    </div>
                                                </div>
                                                    <form id="orderDelete" name="orderDelete" method="post" action="/my/orderDelete">
                                                        <input type="hidden" name="member_id" value="${sessionScope.member_id}" />
                                                        <input type="hidden" name="order_code" value="${order_code}" />
                                                        <div class="row justify-content-around">
                                                            <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle col-4" onclick="location.href='/my/order?member_id=${sessionScope.member_id}&delivery_state=${delivery_state}'">주문목록</button>
                                                            <c:if test="${delivery_state == '배송전'}">
                                                                <button type="button" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-4" onclick="deleteOrder()">주문취소</button>
                                                            </c:if>
                                                            <c:if test="${delivery_state == '배송중'}">
                                                                <button type="button" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-4" onclick="requestRefund()">환불요청</button>
                                                            </c:if>
                                                            <c:if test="${delivery_state == '배송완료'}">
                                                                <button type="button" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-4" disabled>배송완료</button>
                                                            </c:if>
                                                        </div>
                                                    </form>
                                                </c:if>



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
    function deleteOrder() {
        const frm = document.getElementById("orderDelete");
        console.log(frm);
        let delete_check = confirm("주문 취소하시겠습니까?");

        if(delete_check) {
            frm.submit();
        }
    }

    function requestRefund() {
        // TODO: 환불 요청 구현
    }
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>
