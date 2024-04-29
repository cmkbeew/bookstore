<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>도서 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<!-- Header-->
<header class="bg-info py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Shop in style</h1>
            <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5 d-flex">
    <div class="container px-4 px-lg-5 mt-5">
        <ul class="d-flex justify-content-center list-unstyled mb-3" id="gradeUl">
            <c:choose>
                <c:when test="${productList.type == 'child'}">
                    <li><button class="btn btn-primary me-3" type="button">전체</button></li>
                </c:when>
                <c:otherwise>
                    <li><button class="btn btn-primary me-3" type="button">전체</button></li>
                    <li><button class="btn btn-primary me-3" type="button">1학년</button></li>
                    <li><button class="btn btn-primary me-3" type="button">2학년</button></li>
                    <li><button class="btn btn-primary me-3" type="button">3학년</button></li>

                    <c:if test="${productList.type == 'element'}">
                        <li><button class="btn btn-primary me-3" type="button">4학년</button></li>
                        <li><button class="btn btn-primary me-3" type="button">5학년</button></li>
                        <li><button class="btn btn-primary me-3" type="button">6학년</button></li>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </ul>

        <form id="frmSearch" name="frmSearch" method="get" action="/product/list">
            <input type="hidden" name="type" id="type" value="${productList.type}" />
            <input type="hidden" name="grade" id="grade" value="${productList.grade}" />
            <div class="d-flex justify-content-center align-items-center mb-3">
                <div class="me-2">
                    <input class="form-control form-control-lg me-2" type="search" placeholder="교재이름" name="search_word" id="search_word" value="${productList.search_word}">
                </div>
                <div>
                    <button class="btn btn-primary" type="submit" id="btn_search">검색</button>
                </div>
            </div>
        </form>

        <div class="d-flex justify-content-between">
            <div>총 ${productList.total_count}개의 상품</div>
            <ul class="d-flex justify-content-between list-unstyled" id="orderUl">
                <li><button class="border-0 bg-transparent me-2" id="1">최신순</button></li>
                <li><button class="border-0 bg-transparent me-2" id="2">높은가격순</button></li>
                <li><button class="border-0 bg-transparent me-2" id="3">낮은가격순</button></li>
                <li><button class="border-0 bg-transparent me-2" id="4">리뷰많은순</button></li>
                <li><button class="border-0 bg-transparent me-2" id="5">발행일순</button></li>
            </ul>
        </div>

        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:if test="${not empty productList.dtoList}">
                <c:forEach items="${productList.dtoList}" var="list">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${list.product_name}</h5>
                                    <!-- Product price-->
                                        ${list.price}원 <br>
                                        ${list.grade} <br>
                                        ${list.subject}
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product/view?type=${list.type}&product_idx=${list.product_idx}">View options</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty productList.dtoList}">
                <div class="col mb-5">
                    <h5>해당하는 도서가 없습니다.</h5>
                </div>
            </c:if>
        </div>
    </div>
</section>

<!-- 페이징 -->
<nav aria-label="Page navigation example">
    <ul class="pagination" style="justify-content: center">
        <li class="page-item <c:if test="${productList.prev_page_flag ne true}">disabled</c:if> ">
            <a class="page-link"
               href="<c:choose>
                            <c:when test="${productList.prev_page_flag}">
                                ${productList.linkParams}&page=${productList.page_block_start - 1}
                            </c:when>
                            <c:otherwise>
                                ${productList.linkParams}&page=1
                            </c:otherwise>
                        </c:choose>"
               aria-label="Previous"
               data-num="<c:choose>
                                <c:when test="${productList.prev_page_flag}">
                                    ${productList.page_block_start - 1}
                                </c:when>
                                <c:otherwise>
                                    1
                                </c:otherwise>
                            </c:choose>"
            >
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>

        <c:forEach begin="${productList.page_block_start}" end="${productList.page_block_end}" var="page_num">
            <li class="page-item <c:if test="${productList.page == page_num}">active</c:if>" >
                <a class="page-link" data-num="${page_num}"
                   href="<c:choose>
                                <c:when test="${productList.page == page_num}">#</c:when>
                                <c:otherwise>
                                    ${productList.linkParams}&page=${page_num}
                                </c:otherwise>
                            </c:choose>">
                        ${page_num}
                </a>
            </li>
        </c:forEach>

        <li class="page-item <c:if test="${productList.next_page_flag ne true}">disabled</c:if>" >
            <a class="page-link"
               href="<c:choose>
                            <c:when test="${productList.next_page_flag}">
                                ${productList.linkParams}&page=${productList.page_block_end + 1}
                            </c:when>
                            <c:otherwise>
                                ${productList.page_block_end}
                            </c:otherwise>
                        </c:choose>"
               aria-label="Next"
               data-num="<c:choose>
                                 <c:when test="${productList.next_page_flag}">
                                    ${productList.page_block_end + 1}
                                 </c:when>
                                 <c:otherwise>
                                    ${productList.page_block_end}
                                 </c:otherwise>
                             </c:choose>">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>
<%-- 페이징 끝 --%>

<script src="/resources/js/scripts.js"></script>
<script>
    // 학년 선택 시
    const gradeList = document.querySelectorAll("#gradeUl li");
    for(let i=0; i<gradeList.length; i++) {
        gradeList[i].addEventListener("click", function(e) {
            let grade = this.textContent;

            if(grade == "전체") {
                location.href = "/product/list?type=${productList.type}";
            } else {
                location.href = "/product/list?type=${productList.type}&grade=" + grade + "&search_word=${productList.search_word}";
            }
        });
    }

    // 정렬 선택 시
    const orderList = document.querySelectorAll("#orderUl li button");
    for(let i=0; i<orderList.length; i++) {
        orderList[i].addEventListener("click", function(e) {
            let order = this.id;

            location.href = "/product/list?type=${productList.type}&grade=${productList.grade}&search_word=${productList.search_word}&sort_type=" + order;
        });
    }

</script>
<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</body>
</html>
