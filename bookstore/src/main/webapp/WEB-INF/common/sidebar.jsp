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
                <li class="list-group-item"><a href="/my/order?member_id=${sessionScope.member_id}" style="color:black">주문 조회</a></li>
                <li class="list-group-item"><a href="/my/cart?member_id=${sessionScope.member_id}" style="color:black">장바구니</a></li>
            </ol>
        </div>
    </div>
</div>

