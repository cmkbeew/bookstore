<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Notice View</title>
</head>
<body>
    <table>
        <tr>
            <td>번호</td>
            <td>아이디</td>
            <td>제목</td>
            <td>내용</td>
            <td>등록일</td>
        </tr>
        <tr>
            <td>${noticeDTO.notice_idx}</td>
            <td>${noticeDTO.member_id}</td>
            <td>${noticeDTO.title}</td>
            <td>${noticeDTO.content}</td>
            <td>${noticeDTO.reg_date}</td>
        </tr>
    </table>
</body>
</html>
