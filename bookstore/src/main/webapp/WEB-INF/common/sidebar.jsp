<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="position-sticky my-2" style="top: 4rem;">
    <div class="p-4 mb-3 border-primary bg-light rounded text-center" style="border:1px solid;">
        <h4 class="fst-italic">${sessionScope.member_id}</h4>
        <p class="mb-0">${memberDTO.email}</p>
        <div class="p-4 mb-3 border-primary bg-light rounded text-center" style="border:1px solid;">
            <h4 class="fst-italic">${sessionScope.member_id}</h4>
            <p class="mb-0">${memberDTO.email}</p>
        </div>
        <div class="p-4">
            <h4 class="fst-italic">MENU</h4>
            <ol class="list-group list-group-flush">
                <li class="list-group-item"><a href="/member/view?member_id=${sessionScope.member_id}" style="color:black">내 프로필</a></li>
                <li class="list-group-item"><a href="/my/qna?member_id=${sessionScope.member_id}" style="color:black">작성한 qna</a></li>
                <div class="list-group list-group-flush">
                    <a class="list-group-item dropdown-toggle" href="#"
                       id="dropdownMenuClickable" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                        주문 조회
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuClickable">
                        <li><a class="list-group-item dropdown-item <c:if test="${delivery_state == '배송전'}">active</c:if>" href="/my/order?member_id=${sessionScope.member_id}&delivery_state=배송전" style="color:black">배송전</a></li>
                        <li><a class="list-group-item dropdown-item <c:if test="${delivery_state == '배송중'}">active</c:if>" href="/my/order?member_id=${sessionScope.member_id}&delivery_state=배송중" style="color:black">배송중</a></li>
                        <li><a class="list-group-item dropdown-item <c:if test="${delivery_state == '배송완료'}">active</c:if>" href="/my/order?member_id=${sessionScope.member_id}&delivery_state=배송완료" style="color:black">배송완료</a></li>
                        <li><a class="list-group-item dropdown-item <c:if test="${delivery_state == '주문취소요청'}">active</c:if>" href="/my/order?member_id=${sessionScope.member_id}&delivery_state=주문취소요청" style="color:black">주문취소요청</a></li>
                        <li><a class="list-group-item dropdown-item <c:if test="${delivery_state == '취소완료'}">active</c:if>" href="/my/order?member_id=${sessionScope.member_id}&delivery_state=취소완료" style="color:black">취소완료</a></li>
                    </ul>
                </div>
                <li class="list-group-item"><a href="/my/cart?member_id=${sessionScope.member_id}" style="color:black">장바구니</a></li>
            </ol>
        </div>
    </div>
</div>

