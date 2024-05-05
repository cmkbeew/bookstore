<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>도서 목록</title>
    <%--  header 부트스트랩  --%>
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

    <style>
        span a {
            text-decoration: none;
            color : black;
        }
        span a:hover {
            color : gray;
        }


        #listUi .rounded-pill:hover {
            opacity: 0.5;
        }

        #listUi button {
            width: 100px;
            height: 30px;
        }
    </style>
</head>
<body style="padding-bottom: 0px;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<!-- Header-->
<%--<header class="bg-info py-5" style="background:linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ),url('/resources/img/book_img.jpg')">--%>
<header class=" bg-white" style="border-bottom : 1px solid lightgray">
    <div class="container px-0 px-lg-5 my-5">
        <div class="text-white">
            <h6 class="lead fw-normal mb-0" style="font-size : 1.5rem; color:lightgray;">
                <span><a href="/">홈</a></span>
                <span>&gt;</span>
                <span>
                    <c:if test="${productList.type == '유아'}"><span><a href="/product/list?type=유아">유아</a></span></c:if>
                    <c:if test="${productList.type == '초등'}"><span><a href="/product/list?type=초등">초등</a></span></c:if>
                    <c:if test="${productList.type == '중등'}"><span><a href="/product/list?type=중등">중등</a></span></c:if>
                    <c:if test="${productList.type == '고등'}"><span><a href="/product/list?type=고등">고등</a></span></c:if>
                </span>
            </h6>
            <br>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5 d-flex">
    <div class="container px-4 px-lg-5 mt-5" style="min-height: 80vh;">
<%--        <ul class="d-flex justify-content-center list-unstyled mb-3" id="listUi">--%>
<%--                    <li class="mx-2"><button class="btn badge rounded-pill bg-primary" type="button" style="font-size: 1rem">유아</button></li>--%>
<%--                    <li class="mx-2"><button class="btn badge rounded-pill bg-dark" type="button" style="font-size: 1rem">초등</button></li>--%>
<%--                    <li class="mx-2"><button class="btn badge rounded-pill bg-dark" type="button" style="font-size: 1rem">중등</button></li>--%>
<%--                    <li class="mx-2"><button class="btn badge rounded-pill bg-dark" type="button" style="font-size: 1rem">고등</button></li>--%>
<%--        </ul>--%>
        <ul class="d-flex justify-content-center list-unstyled mb-3" id="gradeUl">
            <c:choose>
                <c:when test="${productList.type == '유아'}">
                    <li><button class="btn btn-primary me-3" type="button">전체</button></li>
                </c:when>
                <c:otherwise>
                    <li><button class="btn btn-primary me-3" type="button">전체</button></li>
                    <li><button class="btn btn-primary me-3" type="button">1학년</button></li>
                    <li><button class="btn btn-primary me-3" type="button">2학년</button></li>
                    <li><button class="btn btn-primary me-3" type="button">3학년</button></li>

                    <c:if test="${productList.type == '초등'}">
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
                            <c:if test="${list.discount != 0}">
                                <div class="badge bg-secondary text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            </c:if>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
<%--                            <img class="card-img-top" src="/resources/img/${list.save_file_name}" alt="...">--%>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${list.product_name}</h5>
                                    <!-- Product price-->
                                    <c:if test="${list.discount != 0}">
                                        <span class="text-muted text-decoration-line-through">${list.price}원</span>
                                        ${list.display_price}원
                                    </c:if>
                                    <c:if test="${list.discount == 0}">
                                        ${list.price}원
                                    </c:if>
                                    <br>
                                    ${relatedList.type}  ${list.grade}
                                    <br>
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
<script>

</script>
</body>

</html>
