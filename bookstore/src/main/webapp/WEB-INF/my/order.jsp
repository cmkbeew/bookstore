<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>My QNA</title>

<%--    &lt;%&ndash;  header 부트스트랩  &ndash;%&gt;--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>--%>
<%--    <link href="/resources/css/admin/styles.css" rel="stylesheet" />--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">--%>

<%--    &lt;%&ndash; list 부트스트랩   &ndash;%&gt;--%>
<%--    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />--%>
<%--    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">--%>
<%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />--%>
<%--    <link rel="stylesheet" href="/resources/css/mycss.css">--%>

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
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <%--    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>--%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper">
        <!-- Page content-->
        <div class="container py-h">
            <div class="row">
                <div class="col-md-3"style="background-color: #e4f3ef ">
                    <%@ include file="/WEB-INF/common/sidebar.jsp"%>
                </div>
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-uppercase mb-0 text-center">나의 문의 내역</h5>
                        </div>
                        <div class="table-responsive">
                            <table class="table no-wrap user-table custom-table mb-0 text-center">
                                <thead>
                                <tr scope="row">
                                    <th scope="col" class="border-0">번호</th>
                                    <th scope="col" class="border-0">문의 글 제목</th>
                                    <th scope="col" class="border-0">조회수</th>
                                    <th scope="col" class="border-0" >작성일자</th>
                                    <th scope="col" class="border-0">답변 여부</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${!empty qnaList}">
                                        <c:forEach items="${qnaList}" var="list" varStatus="i">
                                            <tr style="cursor:pointer;" onclick="window.location.href='/community/view?type=qna&idx=${list.idx}'">
                                                <td class="pl-4">${fn:length(qnaList) - i.index}</td>
                                                <td>${list.title}</td>
                                                    <%--                                                    <td>${list.writer}</td>--%>
                                                <td><span class="material-symbols-outlined align-middle" style="color: gray; font-size: 1rem">visibility</span> ${list.read_cnt}</td>
                                                <td>${list.reg_date}</td>
                                                <td>${list.reply_state}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="text-center" colspan="5">회원정보가 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>

</body>
</html>
