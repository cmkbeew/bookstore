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

    <title>admin >> noticeList</title>

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link href="/resources/css/admin/styles.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
</head>
<body style="background-color: #eeeeee">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex" id="wrapper" style="min-height: 80vh;">
    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper">
        <button class="btn btn-primary" id="sidebarToggle">
            <span class="material-symbols-outlined" style="display: block;">arrow_back</span>
            <span class="material-symbols-outlined" style="display: none;">arrow_forward</span>
        </button>
        <!-- Page content-->
        <div class="container">
            <!-- 검색 -->
            <form id="frmSearch" name="frmSearch" method="get" action="/admin/product/list">
                <div class="d-flex justify-content-center align-items-center mb-3">
                    <div class="me-2">
                        <input class="form-control form-control-lg me-2" type="search" placeholder="교재명" name="search_word" id="search_word" value="${productList.search_word}">
                    </div>
                    <div>
                        <button class="btn btn-primary" type="submit" id="btn_search">검색</button>
                    </div>
                </div>
            </form>
            <!-- 검색 끝 -->
            <div class="row">
                <div class="col-md-12">
                    <form name="deleteFrm" id="deleteFrm" method="post" action="/admin/product/list/delete">
                        <h5>총 <span class="text-primary">${adminProductListByPage.total_count}</span>개</h5>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0 text-center">도서관리</h5>
                            </div>
                            <div class="table-responsive px-1 pb-4">
                                <table class="table no-wrap user-table mb-0 table-hover">
                                    <thead>
                                    <tr class="table-light">
                                        <th scope="col" class="border-0 text-uppercase font-medium pl-4" style="vertical-align: middle;">
                                            <label class="control control--checkbox">
                                                <input type="checkbox" name="selectAll" id="selectAll" value="">
                                                <div class="control__indicator"></div>
                                            </label>
                                        </th>
                                        <th scope="col" class="border-0">교재명</th>
                                        <th scope="col" class="border-0">출판사</th>
                                        <th scope="col" class="border-0">저자</th>
                                        <th scope="col" class="border-0">출판일</th>
                                        <th scope="col" class="border-0">유형</th>
                                        <th scope="col" class="border-0">학년</th>
                                        <th scope="col" class="border-0">과목</th>
                                        <th scope="col" class="border-0">쪽수</th>
                                        <th scope="col" class="border-0">가격</th>
                                        <th scope="col" class="border-0">할인율</th>
                                        <th scope="col" class="border-0">상품등록일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${not empty adminProductListByPage && adminProductListByPage.total_count > 0}">
                                        <c:forEach items="${adminProductListByPage.dtoList}" var="list">
                                            <tr>
                                                <td class="pl-4" style="width: 80px;">
                                                    <label class="control control--checkbox">
                                                        <input type="checkbox" name="select" class="selectOne" id="select${list.product_idx}" value="${list.product_idx}">
                                                        <div class="control__indicator"></div>
                                                    </label>
                                                </td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.product_name}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.publisher}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.author}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.publish_date}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.type}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.grade}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.subject}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.page_cnt}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.price}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.discount}</a></td>
                                                <td><a href="/admin/product/view?product_idx=${list.product_idx}">${list.reg_date}</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty adminProductListByPage}">
                                        <tr>
                                            <td class="text-center" colspan="12">도서정보가 없습니다.</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div style="display: flex; justify-content: space-between; margin-top: 4px;">
                            <div>
                                <button type="submit" id="deleteBtn" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="goDelete()">
                                    <span class="material-symbols-outlined">delete</span>
                                </button>
                                <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/admin/product/regist'">
                                    <span class="material-symbols-outlined">edit</span>
                                </button>
                            </div>
                        </div>
                    </form>
                    <nav aria-label="Page navigation example pagination">
                        <ul class="pagination justify-content-center">
                            <li class="page-item
                            <c:if test="${adminProductListByPage.prev_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${adminProductListByPage.prev_page_flag}">${adminProductListByPage.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${adminProductListByPage.prev_page_flag}">${adminProductListByPage.linkParams}&page=${adminProductListByPage.page_block_start-1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="${adminProductListByPage.page_block_start}" end="${adminProductListByPage.page_block_end}" var="page_num">
                                <li class="page-item<c:if test="${adminProductListByPage.page == page_num}"> active</c:if> ">
                                    <a class="page-link" data-num="${page_num}"
                                       href="<c:choose><c:when test="${adminProductListByPage.page == page_num}">#</c:when><c:otherwise>${adminProductListByPage.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item
                            <c:if test="${adminProductListByPage.next_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${adminProductListByPage.next_page_flag}">${adminProductListByPage.page_block_end+1}</c:when><c:otherwise>${adminProductListByPage.page_block_end}</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${adminProductListByPage.next_page_flag}">${adminProductListByPage.linkParams}&page=${adminProductListByPage.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Next">
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
    const selectOneDOMList = document.querySelectorAll(".selectOne");
    const fixBtn = document.querySelector("#fixBtn");
    let idx = [];

    // 체크 박스 전체 선택 및 해제
    selectAllDOM.addEventListener("click", function (e) {
        if (selectAllDOM.checked) {
            for (let i = 0; i < selectOneDOMList.length; i++) {
                selectOneDOMList[i].checked = true;
            }
        } else {
            for (let i = 0; i < selectOneDOMList.length; i++) {
                selectOneDOMList[i].checked = false;
            }
        }
    }, false)

    // 체크 박스 하나씩 선택 및 해제
    for (let i = 0; i < selectOneDOMList.length; i++) {
        selectOneDOMList[i].addEventListener("click", function (e) {

            if (selectOneDOMList[i].checked) {
                idx.push(e.target.parentNode.children[0].value);
            }
            console.log(idx);

        }, false)
    }


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
