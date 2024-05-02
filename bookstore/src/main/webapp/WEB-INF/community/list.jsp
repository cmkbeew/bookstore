<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>community</title>

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
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
</head>
<body style="background-color: #eeeeee;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="py-h" id="wrapper">
    <div id="page-content-wrapper" style="min-height: 80vh;">
        <!-- Page content-->
        <div class="container py-4">
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
            <div class="row">
                <div class="col-md-12">
                    <form name="deleteFrm" id="deleteFrm" method="post" action="/admin/delete">
                        <input type="hidden" name="type" value="${communityList.type}"/>
                        <div class="card">
                            <div class="card-body">
                                <c:if test="${communityList.type == 'notice'}"> <h5 class="mb-0 text-center">공지사항</h5> </c:if>
                                <c:if test="${communityList.type == 'faq'}"> <h5 class="mb-0 text-center">FAQ</h5> </c:if>
                                <c:if test="${communityList.type == 'qna'}"> <h5 class="mb-0 text-center">QnA</h5></c:if>
                            </div>
                            <div class="table-responsive px-1 pb-4">
                                <table class="table no-wrap user-table mb-0 table-hover">
                                    <thead>
                                    <tr style="background-color: #e4f3ef">
                                        <th scope="col" class="border-0 text-uppercase font-medium">제목</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">작성자</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">작성일</th>
                                        <c:if test="${communityList.type == 'qna'}">
                                            <th scope="col" class="border-0 text-uppercase font-medium">조회수</th>
                                        </c:if>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${!empty communityList && communityList.total_count > 0}">
                                            <c:forEach items="${communityList.dtoList}" var="list">
                                                <c:choose>
                                                    <c:when test="${communityList.type == 'notice' && list.fix_state < 0}">
                                                        <tr class="table-light">
                                                    </c:when>
                                                    <c:otherwise><tr></c:otherwise>
                                                </c:choose>
                                                <td style="max-width: 300px;">
                                                    <a href="/community/view?type=${communityList.type}&idx=${list.idx}" style="max-width: 100%; display: block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
                                                        <c:if test="${communityList.type == 'notice'}">
                                                            <c:choose>
                                                                <c:when test="${list.fix_state < 0}">
                                                                    <span style="font-weight: bold">${list.title}</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span>${list.title}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <c:if test="${list.org_file_name != null && list.org_file_name != ''}">
                                                                <span class="material-symbols-outlined" style="vertical-align: center; transform: translateY(15%)">attach_file</span>
                                                            </c:if>
                                                        </c:if>

                                                        <c:if test="${communityList.type == 'faq'}">
                                                            <span>${list.title}</span>
                                                        </c:if>
                                                        <c:if test="${communityList.type == 'qna'}">
                                                                <span>
                                                                    <c:if test="${list.ref < list.idx}">
                                                                        <span class="material-symbols-outlined">prompt_suggestion</span>
                                                                    </c:if>
                                                                    ${list.title}
                                                                </span>
                                                        </c:if>
                                                    </a>
                                                </td>
                                                <td><a href="/community/view?type=${communityList.type}&idx=${list.idx}">${list.writer}</a></td>
                                                <td><a href="/community/view?type=${communityList.type}&idx=${list.idx}">${list.reg_date}</a></td>
                                                <c:if test="${communityList.type == 'qna'}">
                                                    <td style="width: 100px;"><a href="/community/view?type=${communityList.type}&idx=${list.idx}">${list.read_cnt}</a></td>
                                                </c:if>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td class="text-center" colspan="5">등록된 게시글이 없습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <c:if test="${communityList.type == 'qna'}">
                            <div class="py-1">
                                <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/community/qna/regist'">
                                    <span class="material-symbols-outlined">live_help</span>
                                </button>
                            </div>
                        </c:if>
                    </form>
                    <nav aria-label="Page navigation example pagination">
                        <ul class="pagination justify-content-center">
                            <li class="page-item
                            <c:if test="${communityList.prev_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${communityList.prev_page_flag}">${communityList.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${communityList.prev_page_flag}">${communityList.linkParams}&page=${communityList.page_block_start-1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="${communityList.page_block_start}" end="${communityList.page_block_end}" var="page_num">
                                <li class="page-item<c:if test="${communityList.page == page_num}"> active</c:if> ">
                                    <a class="page-link" data-num="${page_num}"
                                       href="<c:choose><c:when test="${communityList.page == page_num}">#</c:when><c:otherwise>${communityList.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item
                            <c:if test="${communityList.next_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${communityList.next_page_flag}">${communityList.page_block_end+1}</c:when><c:otherwise>${communityList.page_block_end}</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${communityList.next_page_flag}">${communityList.linkParams}&page=${communityList.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/common/footer.jsp"%>
    <script type="text/javascript"></script>
</body>
</html>
