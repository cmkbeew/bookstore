<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Notice View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<!-- TODO: padding-top 스타일 해결 -->
<div style="padding-top: 92px;">
    <table>
        <tr>
            <td>번호</td>
            <td>제목</td>
            <td>내용</td>
            <td>작성자</td>
            <td>등록일</td>
        </tr>
        <tr>
            <td>${qnaDTO.qna_idx}</td>
            <td>${qnaDTO.title}</td>
            <td>${qnaDTO.content}</td>
            <td>${qnaDTO.writer}</td>
            <td>${qnaDTO.reg_date}</td>
        </tr>
    </table>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
