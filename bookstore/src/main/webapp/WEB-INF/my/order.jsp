<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>My Order</title>

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link href="/resources/css/admin/styles.css" rel="stylesheet">
    <link href="/resources/css/mycss.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />

</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <div id="page-content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3" style="background-color: #e4f3ef">
                    <%@ include file="/WEB-INF/common/sidebar.jsp"%>
                </div>
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-uppercase mb-0 text-center">나의 결제 내역</h5>

                        </div>
                        <div class="table-responsive">
                            <table class="table no-wrap user-table custom-table mb-0 text-center">
                                <thead>
                                <tr scope="row">
                                    <th scope="col" class="border-0">주문번호</th>
                                    <th scope="col" class="border-0">대표 상품명</th>
                                    <th scope="col" class="border-0">받는고객명</th>
                                    <th scope="col" class="border-0">받는고객번호</th>
                                    <th scope="col" class="border-0">받는고객주소</th>
                                    <th scope="col" class="border-0">결제금액</th>
                                    <th scope="col" class="border-0">배송상태</th>
                                    <th scope="col" class="border-0">주문일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${!empty orderList}">
                                        <c:forEach items="${orderList}" var="list" varStatus="i">
                                            <tr style="cursor:pointer;" onclick="window.location.href='/my/orderDetail?member_id=${sessionScope.member_id}&delivery_state=${delivery_state}&order_code=${list.order_code}'">
                                                <td class="pl-4" style="font-size:13px">${list.order_code}</td>
                                                <td style="font-size:13px">${list.product_name}</td>
                                                <td style="font-size:13px">${list.receiver_name}</td>
                                                <td style="font-size:13px">${list.receiver_phone_num}</td>
                                                <td style="font-size:13px">(${list.zipcode}) ${list.receiver_addr}</td>
                                                <td style="font-size:13px">${list.pay_price}</td>
                                                <td style="font-size:13px">${list.delivery_state}</td>
                                                <td style="font-size:13px">${list.pay_date}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="text-center" colspan="5">결제 내역이 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>

</body>
</html>
