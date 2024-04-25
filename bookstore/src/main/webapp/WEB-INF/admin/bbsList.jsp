<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-04-26
  Time: 오전 12:05
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

    <title>admin >> memberList</title>

    <%--  header 부트스트랩  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <%-- bbsList 부트스트랩   --%>

</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<h1 style="padding-top: 92px;">admin >> bbsList</h1>
<ul>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">idx</th>
                <th scope="col">title</th>
                <th scope="col">member_id</th>
                <th scope="col">content</th>
                <th scope="col">reg_date</th>
            </tr>
        </thead>
        <tbody>
        <c:choose>
                <c:when test="${!empty noticeList}">
                    <c:forEach items="${noticeList}" var="list">
                        <tr>
                            <th scope="row">${list.notice_idx}</th>
                            <td>${list.title}</td>
                            <td>${list.member_id}</td>
                            <td>${list.content}</td>
                            <td>${list.reg_date}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td>등록된 게시글이 없습니다.</td>
                    </tr>
                </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</ul>


<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
