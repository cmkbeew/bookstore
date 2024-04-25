<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>공지사항</title>
</head>
<body>
    <h1>공지사항 페이지</h1>

    <ul>
        <c:forEach items="${noticeList}" var="list">
            <a href="/community/notice/view?notice_idx=${list.notice_idx}"><li>${list}</li></a>
<%--            <li>${list.title}</li>--%>
<%--            <li>${list.member_id}</li>--%>
<%--            <li>${list.content}</li>--%>
<%--            <li>${list.reg_date}</li>--%>
        </c:forEach>
    </ul>
</body>
</html>
