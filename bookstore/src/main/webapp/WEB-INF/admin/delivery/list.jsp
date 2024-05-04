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

    <title>admin >> noticeList</title>

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link href="/resources/css/admin/styles.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex" id="wrapper">
    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper" style="min-height: 80vh;">
        <button class="btn btn-primary" id="sidebarToggle">
            <span class="material-symbols-outlined" style="display: block;">arrow_back</span>
            <span class="material-symbols-outlined" style="display: none;">arrow_forward</span>
        </button>
        <!-- Page content-->
        <div class="container py-h">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-uppercase mb-0 text-center">배송관리</h5>
                            <div class="d-flex justify-content-end align-items-center">
                                <span class="me-3">변경 : </span>
                                <c:if test="${delivery_state == '주문취소요청'}" var="cancel">
                                    <button type="button" class="btn btn-outline-primary me-3" id="rejectCancel" onclick="changeState(this)">취소거부</button>
                                    <button type="button" class="btn btn-outline-primary me-3" id="approveCancel" onclick="changeState(this)">취소승인</button>
                                </c:if>
                                <c:if test="${not cancel}">
                                    <button type="button" class="btn btn-outline-primary me-3" id="before" onclick="changeState(this)">배송전</button>
                                    <button type="button" class="btn btn-outline-warning me-3" id="ing" onclick="changeState(this)">배송중</button>
                                    <button type="button" class="btn btn-outline-danger" id="complete" onclick="changeState(this)">배송완료</button>
                                </c:if>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table no-wrap user-table mb-0">
                                <thead>
                                <tr>
                                    <th scope="col" class="border-0">
                                        <input type="checkbox" class="form-check my-1 mx-auto" id="checkAll" name="checkAll" onclick="checkAll(this)"/>
                                    </th>
                                    <th scope="col" class="border-0">주문번호</th>
                                    <th scope="col" class="border-0">배송상태</th>
                                    <th scope="col" class="border-0">배송회사</th>
                                    <th scope="col" class="border-0">받는고객명</th>
                                    <th scope="col" class="border-0">받는고객휴대폰번호</th>
                                    <th scope="col" class="border-0">받는고객주소</th>
                                    <th scope="col" class="border-0">결제금액</th>
                                    <th scope="col" class="border-0">주문일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${!empty orderDetailList}">
                                        <c:forEach items="${orderDetailList}" var="list">
                                            <tr>
                                                <td>
                                                    <input type="checkbox" class="form-check my-1 mx-auto" id="order${list.order_idx}" value="${list.order_idx}" name="checkList"/>
                                                </td>
                                                <td>${list.order_code}</td>
                                                <td>${list.delivery_state}</td>
                                                <td>${list.delivery_company}</td>
                                                <td>${list.receiver_name}</td>
                                                <td>${list.receiver_phone_num}</td>
                                                <td>(${list.zipcode}) ${list.receiver_addr}</td>
                                                <td>${list.pay_price}</td>
                                                <td>${list.pay_date}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="text-center" colspan="5">배송정보가 없습니다.</td>
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
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
    // 체크박스 전체 선택/해제
    function checkAll(obj) {
        if(obj.checked) {
            $("input:checkbox[name=checkList]").prop("checked", true);
        } else {
            $("input:checkbox[name=checkList]").prop("checked", false);
        }
    }

    // 체크된 값 가져오기
    function changeState(obj) {
        let checkboxes = [];

        $("input:checkbox[name=checkList]").each(function() {
            if($(this).is(":checked") == true) {
                checkboxes.push($(this).val());
            }
        });

        let state = obj.id;
        console.log(state);
        if(state == "rejectCancel") {
            state = "배송전";
        } else if(state == "approveCancel"){
            state = "취소완료";
        } else if(state == "before"){
            state = "배송전";
        } else if(state == "ing"){
            state = "배송중";
        } else if(state == "complete"){
            state = "배송완료";
        }

        let changeCheck = confirm("배송 상태를 변경하겠습니까?");

        if(checkboxes != null && changeCheck) {
            console.log(typeof checkboxes);
            $.ajax({
               type : "post",
               url : "/admin/delivery/updateState",
               data : {
                   check_idx : checkboxes,
                   delivery_state : state
               },
               success : function(url) {
                   alert("배송 상태가 변경되었습니다.")
                   location.reload(url);
               }
            });
        }
    }
</script>
</body>
</html>
