<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-04-25
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>admin >> bbsList</title>

    <%--  header 부트스트랩  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <%-- list 부트스트랩   --%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
</head>
<body>
    <%@ include file="/WEB-INF/common/header.jsp"%>
    <div class="d-flex py-h" id="wrapper">
    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <button class="btn btn-primary" id="sidebarToggle">
                <i class="fa fa-arrow-left" aria-hidden="true" style="display: block;"></i>
                <i class="fa fa-arrow-right" aria-hidden="true" style="display: none;"></i>
            </button>
            <!-- Page content-->
            <div class="container py-h">
                <!-- 검색 -->
                <form id="frmSearch" name="frmSearch" method="get" action="/admin/list">
                    <input type="hidden" name="type" value="${communityList.type}"/>
<%--                    <input type="hidden" name="page_block_end" value="${bbsPagingList.page_block_end}">--%>
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
                            <h5>총 <span class="text-primary">${communityList.total_count}</span>개</h5>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase mb-0 text-center">${bbsTitle}</h5>
                                </div>
                                <div class="table-responsive">
                                    <table class="table no-wrap user-table mb-0">
                                        <thead>
                                        <tr>
                                            <th scope="col" class="border-0 text-uppercase font-medium pl-4" style="vertical-align: middle;">
                                                <label class="control control--checkbox">
                                                    <input type="checkbox" name="select" id="selectAll" value="">
                                                    <div class="control__indicator"></div>
                                                </label>
                                            </th>
                                            <th scope="col" class="border-0 text-uppercase font-medium pl-4">번호</th>
                                            <th scope="col" class="border-0 text-uppercase font-medium">제목</th>
                                            <th scope="col" class="border-0 text-uppercase font-medium">작성자</th>
                                            <th scope="col" class="border-0 text-uppercase font-medium">작성일</th>
                                            <c:if test="${communityList.type == 'qna'}">
                                                <th scope="col" class="border-0 text-uppercase font-medium">답변여부</th>
                                            </c:if>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${!empty communityList && communityList.total_count > 0}">
                                                    <c:forEach items="${communityList.dtoList}" var="list">
                                                        <tr>
                                                            <td class="pl-4" style="width: 80px;">
                                                                <label class="control control--checkbox">
                                                                    <input type="checkbox" name="select" id="select+${list.idx}" value="${list.idx}">
                                                                    <div class="control__indicator"></div>
                                                                </label>
                                                            </td>
                                                            <td class="pl-4"><a href="/admin/${communityList.type}/view?idx=${list.idx}">${list.idx}</a></td>
                                                            <td style="max-width: 300px;">
                                                                <a href="/admin/${communityList.type}/view?idx=${list.idx}" style="max-width: 100%; display: block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
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
                                                                                <i class="fa fa-reply" aria-hidden="true" style="transform: rotate(180deg)"></i>
                                                                            </c:if>
                                                                            ${list.title}
                                                                        </span>
                                                                    </c:if>
                                                                </a>
                                                            </td>
                                                            <td><a href="/admin/${communityList.type}/view?idx=${list.idx}">${list.writer}</a></td>
                                                            <td><a href="/admin/${communityList.type}/view?idx=${list.idx}">${list.reg_date}</a></td>
                                                            <c:if test="${communityList.type == 'qna'}">
                                                                <td style="width: 100px;"><a href="/admin/${communityList.type}/view?idx=${list.idx}">${list.reply_state}</a></td>
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
                            <div style="display: flex; justify-content: space-between; margin-top: 4px;">
                                <div>
                                    <button type="button" id="deleteBtn" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2" onclick="goDelete()">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                    <c:if test="${communityList.type == 'notice'}">
                                        <button id="fixBtn" type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2">
                                            <i class="fa fa-thumb-tack" aria-hidden="true"></i>
                                        </button>
                                    </c:if>
                                    <c:if test="${communityList.type != 'qna'}">
                                        <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/admin/${communityList.type}/regist'">
                                            <i class="fa fa-upload"></i>
                                        </button>
                                    </c:if>
                                </div>
                            </div>
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
    </div>
    <%@ include file="/WEB-INF/common/footer.jsp"%>
<script>
    const selectAllDOM = document.querySelector("#selectAll");
    const allCheckboxDOM = document.querySelectorAll(".control--checkbox");
    selectAllDOM.addEventListener("click", function (e) {
        if (selectAllDOM.checked) {
            for (let i = 0; i < allCheckboxDOM.length; i++) {
                allCheckboxDOM[i].children[0].checked = true;
            }
        } else {
            for (let i = 0; i < allCheckboxDOM.length; i++) {
                allCheckboxDOM[i].children[0].checked = false;
            }
        }

    }, false)

    const fixBtn = document.querySelector("#fixBtn");
    const control = document.querySelectorAll(".control__indicator");
    let idx = [];

    for (let i = 0; i < control.length; i++) {
        control[i].addEventListener("click", function (e) {
            console.log(e.target.parentNode.parentNode.parentNode.children[1].children[0].textContent);
            idx.push(e.target.parentNode.parentNode.parentNode.children[1].children[0].textContent);
        }, false)
    }

    fixBtn.addEventListener("click", function (e) {
        console.log(idx.length);
        let linkParam = idx[0];

        for (let i = 1; i < idx.length; i++) {
            linkParam += '+' + idx[i]
        }

        location.href = "/admin/notice/fix?idx=" + linkParam;

    }, false)

    function goDelete() {
        const frm = document.getElementById("deleteFrm");
        let confirm_flag = confirm("해당 게시글을 삭제하시겠습니까?");

        if (confirm_flag) {
            frm.submit();
        }
    }

    </script>
</body>
</html>
