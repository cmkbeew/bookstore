<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>자료실 등록</title>
</head>
<body>
<form id="frmRegist" name="frmRegist" action="/data/regist" method="post" enctype="multipart/form-data">
    <label for="title">제목</label>
    <input type="text" name="title" id="title" value="${dataDTO.title}" />

    <label for="content">내용</label>
    <textarea cols="10" rows="5" name="content" id="content">${dataDTO.content}</textarea>

    <label for="writer">작성자</label>
    <input type="text" name="writer" id="writer" value="${dataDTO.writer}" />

    <label>파일</label>
    <input type="file" name="file" id="file" />

    <button type="submit">등록</button>
</form>
</body>
</html>
