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
    <form id="frmDelete" name="frmDelete" method="post" action="/data/delete">
        <input type="hidden" name="data_idx" id="data_idx" value="${dataDTO.data_idx}" />
        <table>
            <tr>
                <td>번호</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성자</td>
                <td>등록일</td>
                <td>원본 파일명</td>
                <td>저장 파일명</td>
            </tr>
            <tr>
                <td>${dataDTO.data_idx}</td>
                <td>${dataDTO.title}</td>
                <td>${dataDTO.content}</td>
                <td>${dataDTO.writer}</td>
                <td>${dataDTO.reg_date}</td>
                <td>${dataDTO.org_file_name}</td>
                <td>${dataDTO.save_file_name}</td>
            </tr>
        </table>
        <button type="button" onclick="location.href='/data/list'">목록</button>
        <button type="button" onclick="location.href='/data/modify?data_idx=${dataDTO.data_idx}'">수정</button>
        <button type="button" onclick="goDelete()">삭제</button>
    </form>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>

<script>
    function goDelete() {
        const delete_check = confirm("삭제하시겠습니까?");

        if(delete_check) {
            document.getElementById("frmDelete").submit();
        }
    }
</script>
</body>
</html>
