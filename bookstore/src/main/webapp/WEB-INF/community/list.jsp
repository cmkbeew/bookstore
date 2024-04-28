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
<div id="snippetContent">
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 mb-3 mb-lg-5">
                <div class="overflow-hidden card table-nowrap table-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">자료실</h5> <a href="#!" class="btn btn-light btn-sm">View All</a></div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="small text-uppercase bg-body text-muted">
                            <tr>
                                <th>제목</th>
                                <th>내용</th>
                                <th class="text-end">작성자</th>
                                <th class="text-end">조회수</th>
                                <th class="text-end">작성일</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:choose>

                                <c:when test="${noticeList != null}">
                                    <c:forEach items="${noticeList.dtoList}" var="list">
                                        <tr class="align-middle">
                                            <td>
                                                <a href="/community/notice/view?faq_idx=${list.idx}">
                                                    <div class="d-flex align-items-center">
                                                        <div class="h6 mb-0 lh-1">${list.title}</div>
                                                    </div>
                                                </a>
                                            </td>
                                            <td>${list.content}</td>
                                            <td class="text-end">${list.writer}</td>
                                            <td class="text-end">${list.reg_date}</td>
                                        </tr>
                                    </c:forEach>
                                </c:when>

                                <c:when test="${faqList != null}">
                                    <c:forEach items="${faqList.dtoList}" var="list">
                                        <tr class="align-middle">
                                            <td>
                                                <a href="/community/faq/view?faq_idx=${list.idx}">
                                                    <div class="d-flex align-items-center">
                                                        <div class="h6 mb-0 lh-1">${list.title}</div>
                                                    </div>
                                                </a>
                                            </td>
                                            <td>${list.content}</td>
                                            <td class="text-end">${list.writer}</td>
                                            <td class="text-end">${list.reg_date}</td>
                                        </tr>
                                    </c:forEach>
                                </c:when>

                                <c:when test="${qnaList != null}">
                                    <c:forEach items="${qnaList.dtoList}" var="list">
                                        <tr class="align-middle">
                                            <td>
                                                <a href="/community/qna/view?faq_idx=${list.idx}">
                                                    <div class="d-flex align-items-center">
                                                        <div class="h6 mb-0 lh-1">${list.title}</div>
                                                    </div>
                                                </a>
                                            </td>
                                            <td>${list.content}</td>
                                            <td class="text-end">${list.writer}</td>
                                            <td class="text-end">${list.reg_date}</td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td>????</td>
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
    <c:if test="${noticeList != null}">
        <jsp:include page="../common/paging.jsp">
            <jsp:param name="list" value="${noticeList}"/>
        </jsp:include>
    </c:if>
    <c:if test="${faqList != null}">
        <jsp:include page="../common/paging.jsp">
            <jsp:param name="list" value="${faqList}"/>
        </jsp:include>
    </c:if>
    <c:if test="${qnaList != null}">
        <jsp:include page="../common/paging.jsp">
            <jsp:param name="list" value="${qnaList}"/>
        </jsp:include>
    </c:if>
<%--    <nav aria-label="Page navigation example">--%>
<%--        <ul class="pagination" style="justify-content: center">--%>
<%--            <li class="page-item <c:if test="${faqList.prev_page_flag ne true}">disabled</c:if> ">--%>
<%--                <a class="page-link"--%>
<%--                   href="<c:choose>--%>
<%--                            <c:when test="${faqList.prev_page_flag}">--%>
<%--                                ${faqList.linkParams}&page=${faqList.page_block_start - 1}--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                ${faqList.linkParams}&page=1--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>"--%>
<%--                   aria-label="Previous"--%>
<%--                   data-num="<c:choose>--%>
<%--                                <c:when test="${faqList.prev_page_flag}">--%>
<%--                                    ${faqList.page_block_start - 1}--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    1--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>"--%>
<%--                >--%>
<%--                    <span aria-hidden="true">&laquo;</span>--%>
<%--                </a>--%>
<%--            </li>--%>

<%--            <c:forEach begin="${faqList.page_block_start}" end="${faqList.page_block_end}" var="page_num">--%>
<%--                <li class="page-item <c:if test="${faqList.page == page_num}">active</c:if>" >--%>
<%--                    <a class="page-link" data-num="${page_num}"--%>
<%--                       href="<c:choose>--%>
<%--                                <c:when test="${faqList.page == page_num}">#</c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    ${faqList.linkParams}&page=${page_num}--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>">--%>
<%--                            ${page_num}--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </c:forEach>--%>

<%--            <li class="page-item <c:if test="${faqList.next_page_flag ne true}">disabled</c:if>" >--%>
<%--                <a class="page-link"--%>
<%--                   href="<c:choose>--%>
<%--                            <c:when test="${faqList.next_page_flag}">--%>
<%--                                ${faqList.linkParams}&page=${faqList.page_block_end + 1}--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                ${faqList.page_block_end}--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>"--%>
<%--                   aria-label="Next"--%>
<%--                   data-num="<c:choose>--%>
<%--                                 <c:when test="${faqList.next_page_flag}">--%>
<%--                                    ${faqList.page_block_end + 1}--%>
<%--                                 </c:when>--%>
<%--                                 <c:otherwise>--%>
<%--                                    ${faqList.page_block_end}--%>
<%--                                 </c:otherwise>--%>
<%--                             </c:choose>">--%>
<%--                    <span aria-hidden="true">&raquo;</span>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </nav>--%>

    <style type="text/css">
        body{
            background:#eee;
        }
        .avatar.sm {
            width: 2.25rem;
            height: 2.25rem;
            font-size: .818125rem;
        }
        .table-nowrap .table td, .table-nowrap .table th {
            white-space: nowrap;
        }
        .table>:not(caption)>*>* {
            padding: 0.75rem 1.25rem;
            border-bottom-width: 1px;
        }
        table th {
            font-weight: 600;
            background-color: #eeecfd !important;
        }
    </style>
    <script type="text/javascript"></script>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
