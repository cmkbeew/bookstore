<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Notice View</title>
    <%--  header 부트스트랩  --%>
    <link href="/resources/mintybootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
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
