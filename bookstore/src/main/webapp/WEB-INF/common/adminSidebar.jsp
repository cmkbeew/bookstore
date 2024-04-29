<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-04-28
  Time: 오후 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="border-end bg-white" id="sidebar-wrapper">
    <div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
    <div class="list-group list-group-flush">
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/list?bbsName=notice">공지사항</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/list?bbsName=faq">FAQ</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/list?bbsName=qna">QnA</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/member/list">회원관리</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/product/list">도서</a>
        <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/delivery/list">배송관리</a>
    </div>
</div>
