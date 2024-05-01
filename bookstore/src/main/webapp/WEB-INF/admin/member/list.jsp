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

    <title>admin >> memberList</title>

    <%--  header 부트스트랩  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <%-- list 부트스트랩   --%>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
</head>
<body style="background-color: #eeeeee;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper" style="min-height: 80vh;">
        <button class="btn btn-primary" id="sidebarToggle">
            <span class="material-symbols-outlined" style="display: block;">arrow_back</span>
            <span class="material-symbols-outlined" style="display: none;">arrow_forward</span>
        </button>
        <!-- Page content-->
        <div class="container">
            <!-- 검색 -->
            <form id="frmSearch" name="frmSearch" method="get" action="/member/list">
                <input type="hidden" name="type" value="${memberList.type}"/>
                <div class="d-flex justify-content-center align-items-center">
                    <div class="mx-2 my-3">
                        <select class="form-select form-select-lg" name="search_date" id="search_date">
                            <option value="all">전체</option>
                            <option value="day" <c:if test="${memberList.search_date == 'day'}">selected</c:if>>하루</option>
                            <option value="week" <c:if test="${memberList.search_date == 'week'}">selected</c:if>>일주일</option>
                            <option value="month"<c:if test="${memberList.search_date == 'month'}">selected</c:if>>한달</option>
                        </select>
                    </div>
                    <div class="mx-2 my-3">
                        <select class="form-select form-select-lg" name="search_type" id="search_type">
                            <option value="">전체</option>
                            <option value="title" <c:if test="${memberList.search_type == 'title'}">selected</c:if>>제목</option>
                            <option value="writer"<c:if test="${memberList.search_type == 'writer'}">selected</c:if>>작성자</option>
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
                    <form name="sendFrm" id="sendFrm" method="post" action="/member/list">
                        <h5>총 <span class="text-primary">${memberList.total_count}</span>명</h5>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0 text-center">회원관리</h5>
                            </div>
                            <div class="table-responsive px-1 pb-4">
                                <table class="table no-wrap user-table mb-0 table-hover">
                                    <thead>
                                    <tr class="table-light">
                                        <th scope="col" class="border-0">
                                            <label class="control control--checkbox">
                                                <input type="checkbox" name="select" id="selectAll" value="">
                                                <div class="control__indicator"></div>
                                            </label>
                                        </th>
                                        <th scope="col" class="border-0">아이디</th>
                                        <th scope="col" class="border-0">이름</th>
                                        <th scope="col" class="border-0">이메일</th>
                                        <th scope="col" class="border-0">선택사항</th>
                                        <th scope="col" class="border-0">포인트</th>
                                        <th scope="col" class="border-0">회원상태</th>
                                        <th scope="col" class="border-0">가입일</th>
                                        <th scope="col" class="border-0">탈퇴일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${!empty memberList}">
                                            <c:forEach items="${memberList.dtoList}" var="list">
                                                <tr>
                                                    <td>
                                                        <label class="control control--checkbox">
                                                            <input type="checkbox" name="select" id="select+${list.member_idx}" value="${list.member_idx}">
                                                            <div class="control__indicator"></div>
                                                        </label>
                                                    </td>
                                                    <td>${list.member_id}</td>
                                                    <td>${list.name}</td>
                                                    <td>${list.email}</td>
                                                    <td>${list.option}</td>
                                                    <td>${list.point}</td>
                                                    <td>${list.member_state}</td>
                                                    <td>${list.reg_date}</td>
                                                    <td>${list.leave_date}</td>
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
                        <div style="display: flex; justify-content: space-between; margin-top: 4px;">
                            <div>
                                <button type="button" id="mailBtn" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="sendEmail()">
                                    <span class="material-symbols-outlined">mail</span>
                                </button>
                            </div>
                        </div>
                    </form>
                    <nav aria-label="Page navigation example pagination">
                        <ul class="pagination justify-content-center">
                            <li class="page-item
                            <c:if test="${memberList.prev_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${memberList.prev_page_flag}">${memberList.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${memberList.prev_page_flag}">${memberList.linkParams}&page=${memberList.page_block_start-1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="${memberList.page_block_start}" end="${memberList.page_block_end}" var="page_num">
                                <li class="page-item<c:if test="${memberList.page == page_num}"> active</c:if> ">
                                    <a class="page-link" data-num="${page_num}"
                                       href="<c:choose><c:when test="${memberList.page == page_num}">#</c:when><c:otherwise>${memberList.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item
                            <c:if test="${memberList.next_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${memberList.next_page_flag}">${memberList.page_block_end+1}</c:when><c:otherwise>${memberList.page_block_end}</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${memberList.next_page_flag}">${memberList.linkParams}&page=${memberList.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Next">
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

    function sendEmail() {
        console.log("이메일을 보내야 해")
        // const frm = document.getElementById("deleteFrm");
        // let confirm_flag = confirm("해당 게시글을 삭제하시겠습니까?");
        //
        // if (confirm_flag) {
        //     frm.submit();
        // }
    }
</script>
</body>
</html>
