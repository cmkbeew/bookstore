<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="position: fixed; top:0; width:100%; height: 8vh; z-index: 10000;">
    <div class="container px-4 px-lg-5 bg-light">
        <a class="navbar-brand" href="/">Ddoi Story</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">홈</a></li>
                <li class="nav-item"><a class="nav-link" href="/company/greeting">회사소개</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="bookstore" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">도서</a>
                    <ul class="dropdown-menu" aria-labelledby="bookstore">
                        <li><a class="dropdown-item" href="/product/list?type=유아">유아</a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li><a class="dropdown-item" href="/product/list?type=초등">초등</a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li><a class="dropdown-item" href="/product/list?type=중등">중등</a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li><a class="dropdown-item" href="/product/list?type=고등">고등</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="boards" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">커뮤니티</a>
                    <ul class="dropdown-menu" aria-labelledby="boards">
                        <li><a class="dropdown-item" href="/community/list?type=notice">공지사항</a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li><a class="dropdown-item" href="/community/list?type=faq">FAQ</a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <li><a class="dropdown-item" href="/community/list?type=qna">QnA</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="/data/list">자료실</a></li>
            </ul>
            <div>
                <c:choose>
                    <c:when test="${not empty sessionScope.member_id}">
                        <c:if test="${sessionScope.member_id ne 'admin'}">
                            <button type="button" class="btn btn-outline-primary me-2"
                                    onclick="location.href='/login/logout'">로그아웃
                            </button>
                            <button type="button" class="btn btn-primary me-2"
                                    onclick="location.href='/member/view?member_id=${sessionScope.member_id}'">마이페이지
                            </button>
                            <button type="button" class="btn btn-outline-dark" onclick="location.href='/my/cart?member_id=${sessionScope.member_id}'">
                                <i class="bi-cart-fill me-1"></i>
                                장바구니
                                <span class="badge bg-primary text-white ms-1 rounded-pill">${cookie.cartCnt.value}</span>
                            </button>
                        </c:if>
                        <c:if test="${sessionScope.member_id eq 'admin'}">
                            <button type="button" class="btn btn-outline-primary me-2"
                                    onclick="location.href='/login/logout'">로그아웃
                            </button>
                            <button type="button" class="btn btn-primary me-2"
                                    onclick="location.href='/admin/list?type=notice'">관리자페이지
                            </button>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${sessionScope.member_id == null}">
                            <button type="button" class="btn btn-outline-primary me-2"
                                    onclick="location.href='/login/login'">로그인
                            </button>
                            <button type="button" class="btn btn-primary me-2" onclick="location.href='/member/join'">
                                회원가입
                            </button>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>
</html>
