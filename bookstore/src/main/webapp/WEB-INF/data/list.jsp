<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>자료실 목록</title>

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link href="/resources/css/admin/styles.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
</head>
<body style="background-color: #eeeeee; padding-bottom: 0px;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <div id="page-content-wrapper" style="min-height: 80vh;">
        <!-- Page content-->
        <div class="container py-4">
            <!-- 검색 -->
            <form id="frmSearch" name="frmSearch" method="get" action="/data/list">
                <div class="d-flex justify-content-center align-items-center">
                    <div class="mx-2 my-3">
                        <select class="form-select form-select-lg" name="search_date" id="search_date">
                            <option value="all">전체</option>
                            <option value="day" <c:if test="${dataList.search_date == 'day'}">selected</c:if>>하루</option>
                            <option value="week" <c:if test="${dataList.search_date == 'week'}">selected</c:if>>일주일</option>
                            <option value="month"<c:if test="${dataList.search_date == 'month'}">selected</c:if>>한달</option>
                        </select>
                    </div>
                    <div class="mx-2 my-3">
                        <select class="form-select form-select-lg" name="search_type" id="search_type">
                            <option value="">전체</option>
                            <option value="title" <c:if test="${dataList.search_type == 'title'}">selected</c:if>>제목</option>
                            <option value="writer"<c:if test="${dataList.search_type == 'writer'}">selected</c:if>>작성자</option>
                        </select>
                    </div>
                    <div class="me-2">
                        <input class="form-control form-control-lg me-2" type="search" placeholder="Search" aria-label="Search" name="search_word" id="search_word" value="${dataList.search_word}">
                    </div>
                    <button class="btn btn-primary me-2" type="submit" id="btn_search">검색</button>
                    <button class="btn btn-outline-danger" type="reset">초기화</button>
                </div>
            </form>
            <!-- 검색 끝 -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="mb-0 text-center">자료실</h5>
                        </div>
                        <div class="table-responsive px-1 pb-4">
                            <table class="table no-wrap user-table mb-0 table-hover">
                                <thead>
                                <tr style="background-color: #e4f3ef">
                                    <th scope="col" class="border-0 text-uppercase font-medium">제목</th>
                                    <th scope="col" class="border-0 text-uppercase font-medium">작성자</th>
                                    <th scope="col" class="border-0 text-uppercase font-medium">작성일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${!empty dataList}">
                                        <c:forEach items="${dataList.dtoList}" var="list">
                                            <tr>
                                                <td style="max-width: 300px;">
                                                    <a href="/data/view?data_idx=${list.data_idx}">
                                                        <span class="mt-0 font-weight-bold mb-2">${list.title}</span>
                                                        <c:if test="${list.org_file_name != null && list.org_file_name != ''}">
                                                            <span class="material-symbols-outlined web_font">attach_file</span>
                                                        </c:if>
                                                    </a>
                                                </td>
                                                <td><a href="/data/view?data_idx=${list.data_idx}">
                                                        ${list.writer}</a>
                                                </td>
                                                <td>
                                                    <a href="/data/view?data_idx=${list.data_idx}">
                                                            ${list.reg_date}
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="text-center" colspan="5">해당하는 게시글이 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="py-1">
                        <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/data/regist'">
                            <span class="material-symbols-outlined">edit</span>
                        </button>
                    </div>
                    <nav aria-label="Page navigation example pagination">
                        <ul class="pagination justify-content-center">
                            <li class="page-item
                            <c:if test="${dataList.prev_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${dataList.prev_page_flag}">${dataList.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${dataList.prev_page_flag}">${dataList.linkParams}&page=${dataList.page_block_start-1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="${dataList.page_block_start}" end="${dataList.page_block_end}" var="page_num">
                                <li class="page-item<c:if test="${dataList.page == page_num}"> active</c:if> ">
                                    <a class="page-link" data-num="${page_num}"
                                       href="<c:choose><c:when test="${dataList.page == page_num}">#</c:when><c:otherwise>${dataList.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item
                            <c:if test="${dataList.next_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${dataList.next_page_flag}">${dataList.page_block_end+1}</c:when><c:otherwise>${dataList.page_block_end}</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${dataList.next_page_flag}">${dataList.linkParams}&page=${dataList.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
<script type="text/javascript"></script>
</body>
</html>
