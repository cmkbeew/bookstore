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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>

<div id="snippetContent" class="py-h">
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 mb-3 mb-lg-5">
                <div class="overflow-hidden card table-nowrap table-card">
                    <!-- 검색 -->
                    <form id="frmSearch" name="frmSearch" method="get" action="/community/list">
                        <input type="hidden" name="type" id="type" value="${communityList.type}" />
                        <div class="d-flex justify-content-center align-items-center">
                            <div class="mx-2 my-3">
                                <select class="form-select form-select-lg" name="search_date" id="search_date">
                                    <option value="all">전체</option>
                                    <option value="day" <c:if test="${communityList.search_date == 'day'}">selected</c:if>>하루</option>
                                    <option value="week" <c:if test="${communityList.search_date == 'week'}">selected</c:if>>일주일</option>
                                    <option value="month"<c:if test="${communityList.search_date == 'month'}">selected</c:if>>한달</option>
                                </select>
                            </div>
                            <div class="mx-2 my-3">
                                <select class="form-select form-select-lg" name="search_type" id="search_type">
                                    <option value="">전체</option>
                                    <option value="title" <c:if test="${communityList.search_type == 'title'}">selected</c:if>>제목</option>
                                    <option value="writer"<c:if test="${communityList.search_type == 'writer'}">selected</c:if>>작성자</option>
                                </select>
                            </div>
                            <div class="me-2">
                                <input class="form-control form-control-lg me-2" type="search" placeholder="Search" aria-label="Search" name="search_word" id="search_word" value="${communityList.search_word}">
                            </div>
                            <button class="btn btn-primary me-2" type="submit" id="btn_search">검색</button>
                            <button class="btn btn-outline-danger" type="reset">초기화</button>
                        </div>
                    </form>
                    <!-- 검색 끝 -->
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <c:if test="${communityList.type == 'notice'}"> <h5 class="mb-0">공지사항</h5> </c:if>
                        <c:if test="${communityList.type == 'faq'}"> <h5 class="mb-0">FAQ</h5> </c:if>
                        <c:if test="${communityList.type == 'qna'}"> <h5 class="mb-0">QnA</h5> <a href="/community/qna/regist" class="btn btn-light btn-sm">질문하기</a></c:if>
                    </div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="small text-uppercase bg-body text-muted">
                                <c:if test="${communityList.type == 'notice'}">
                                    <tr>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th class="text-center">작성자</th>
                                        <th class="text-end">작성일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${communityList != null}">
                                        <c:forEach items="${communityList.dtoList}" var="list">
                                            <tr class="align-middle">
                                                <td>
                                                    <a href="/community/view?type=${communityList.type}&idx=${list.idx}">
                                                        <div class="d-flex align-items-center">
                                                            <div class="h6 mb-0 lh-1">${list.title}
                                                                <c:if test="${list.org_file_name != null}">
                                                                    <span class="material-symbols-outlined">attach_file</span>
                                                                </c:if></div>
                                                        </div>
                                                    </a>
                                                </td>
                                                <td>${list.content}</td>
                                                <td class="text-center">${list.writer}</td>
                                                <td class="text-end">${list.reg_date}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </c:if>

                                <c:if test="${communityList.type == 'faq'}">
                                    <tr>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th class="text-center">작성자</th>
                                        <th class="text-end">작성일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${communityList != null}">
                                        <c:forEach items="${communityList.dtoList}" var="list">
                                            <tr class="align-middle">
                                                <td>
                                                    <a href="/community/view?type=${communityList.type}&idx=${list.idx}">
                                                        <div class="d-flex align-items-center">
                                                            <div class="h6 mb-0 lh-1">${list.title}
                                                        </div>
                                                    </a>
                                                </td>
                                                <td>${list.content}</td>
                                                <td class="text-center">${list.writer}</td>
                                                <td class="text-end">${list.reg_date}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </c:if>

                                <c:if test="${communityList.type == 'qna'}">
                                    <tr>
                                    <th>제목</th>
                                        <th>작성자</th>
                                        <th class="text-center">답변 여부</th>
                                        <th class="text-end">조회수</th>
                                        <th class="text-end">작성일</th>
                                    </tr>
                                        </thead>
                                    <tbody>
                                    <c:if test="${communityList != null}">
                                        <c:forEach items="${communityList.dtoList}" var="list">
                                            <tr class="align-middle">
                                                <td>
                                                    <a href="/community/view?type=${communityList.type}&idx=${list.idx}">
                                                        <div class="d-flex align-items-center">
                                                            <div class="h6 mb-0 lh-1">${list.title}</div>
                                                        </div>
                                                    </a>
                                                </td>
                                                <td>${list.writer}</td>
                                                <td class="text-center">${list.reply_state}</td>
                                                <td class="text-end">${list.read_cnt}</td>
                                                <td class="text-end">${list.reg_date}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </c:if>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="pagination" style="justify-content: center">
            <li class="page-item <c:if test="${communityList.prev_page_flag ne true}">disabled</c:if> ">
                <a class="page-link"
                   href="<c:choose>
                            <c:when test="${communityList.prev_page_flag}">
                                ${communityList.linkParams}&page=${communityList.page_block_start - 1}
                            </c:when>
                            <c:otherwise>
                                ${communityList.linkParams}&page=1
                            </c:otherwise>
                        </c:choose>"
                   aria-label="Previous"
                   data-num="<c:choose>
                                <c:when test="${communityList.prev_page_flag}">
                                    ${communityList.page_block_start - 1}
                                </c:when>
                                <c:otherwise>
                                    1
                                </c:otherwise>
                            </c:choose>"
                >
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <c:forEach begin="${communityList.page_block_start}" end="${communityList.page_block_end}" var="page_num">
                <li class="page-item <c:if test="${communityList.page == page_num}">active</c:if>" >
                    <a class="page-link" data-num="${page_num}"
                       href="<c:choose>
                                <c:when test="${communityList.page == page_num}">#</c:when>
                                <c:otherwise>
                                    ${communityList.linkParams}&page=${page_num}
                                </c:otherwise>
                            </c:choose>">
                            ${page_num}
                    </a>
                </li>
            </c:forEach>

            <li class="page-item <c:if test="${communityList.next_page_flag ne true}">disabled</c:if>" >
                <a class="page-link"
                   href="<c:choose>
                            <c:when test="${communityList.next_page_flag}">
                                ${communityList.linkParams}&page=${communityList.page_block_end + 1}
                            </c:when>
                            <c:otherwise>
                                ${communityList.page_block_end}
                            </c:otherwise>
                        </c:choose>"
                   aria-label="Next"
                   data-num="<c:choose>
                                 <c:when test="${communityList.next_page_flag}">
                                    ${communityList.page_block_end + 1}
                                 </c:when>
                                 <c:otherwise>
                                    ${communityList.page_block_end}
                                 </c:otherwise>
                             </c:choose>">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>

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
