<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>공지사항</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
    <h1>공지사항 페이지</h1>

    <ul>
        <c:forEach items="${faqList}" var="list">
            <a href="/community/faq/view?faq_idx=${list.faq_idx}"><li>${list}</li></a>
<%--            <li>${list.title}</li>--%>
<%--            <li>${list.member_id}</li>--%>
<%--            <li>${list.content}</li>--%>
<%--            <li>${list.reg_date}</li>--%>
        </c:forEach>
    </ul>
<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
