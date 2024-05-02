<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>ddoi story</title>

    <%--  header 부트스트랩  --%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />--%>
    <link href="/resources/mintybootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />

<%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
<%--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>&ndash;%&gt;--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
</head>
<body style="background-color: #f3f3f3">
    <%@ include file="/WEB-INF/common/header.jsp"%>
        <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel" style="height: 610px">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
                </div>
            <div class="carousel-inner" style="height: 610px;">
                <div class="carousel-item active">
                    <img style="height: 610px;" src="https://mall.chunjaetext.co.kr/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/52d64df773188393b4b65e2dcd4443ad.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img style="height: 610px;" src="https://mall.chunjaetext.co.kr/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/cb4328fec43a5b8f29980590dd332859.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img style="height: 610px;" src="https://mall.chunjaetext.co.kr/web/upload/NNEditor/20200722/3404a9e07e6ffc48abb8136d5bde2276.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img style="height: 610px;" src="https://mall.chunjaetext.co.kr/web/upload/NNEditor/20200707/506bc3b5b27650c0465945d5172c7486.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img style="height: 610px;" src="https://mall.chunjaetext.co.kr/web/upload/NNEditor/20200707/ff0da5bad4160da3a9f773e0f21fa922.jpg" class="d-block w-100" alt="...">
                </div>

            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    <div class="container marketing">
        <div class="row text-center">
            <h3>새로 입고된 책</h3>
            <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active text-dark" id="pills-kid-tab" data-bs-toggle="pill" data-bs-target="#pills-kid" type="button" role="tab" aria-controls="pills-home" aria-selected="true">유아</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link text-dark" id="pills-elementary-tab" data-bs-toggle="pill" data-bs-target="#pills-elementary" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">초등</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link text-dark" id="pills-middle-tab" data-bs-toggle="pill" data-bs-target="#pills-middle" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">중등</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link text-dark" id="pills-high-tab" data-bs-toggle="pill" data-bs-target="#pills-high" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false">고등</button>
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-kid" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
                    <div class="row justify-content-between align-items-center">
                        <c:forEach items="${allList}" var="list" >
                            <div class="col-lg-3 my-3">
                                <a href="/product/view?type=${list.type}&product_idx=${list.product_idx}" style="color:black">
                                    <svg class="bd-placeholder-img" width="250" height="300" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
                                    <h4 class="my-2">${list.product_name}</h4>
                                    <p class="mb-1">${list.type}&nbsp;${list.grade}</p>
                                    <p class="mb-1">${list.price}원</p>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-elementary" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
                    <div class="row justify-content-between">
                        <c:forEach items="${elemList}" var="list" >
                            <div class="col-lg-3 my-3">
                            <a href="/product/view?type=${list.type}&product_idx=${list.product_idx}" style="color:black">
                                <svg class="bd-placeholder-img" width="250" height="300" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
                                <h4 class="my-2">${list.product_name}</h4>
                                <p class="mb-1">${list.type}&nbsp;${list.grade}</p>
                                <p class="mb-1">${list.price}원</p>
                            </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-middle" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
                    <div class="row justify-content-between align-items-center">
                        <c:forEach items="${midList}" var="list" >
                            <div class="col-lg-3 my-3">
                                <a href="/product/view?type=${list.type}&product_idx=${list.product_idx}" style="color:black">
                                    <svg class="bd-placeholder-img" width="250" height="300" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
                                    <h4 class="my-2">${list.product_name}</h4>
                                    <p class="mb-1">${list.type}&nbsp;${list.grade}</p>
                                    <p class="mb-1">${list.price}원</p>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-high" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">
                    <div class="row justify-content-between align-items-center">
                        <c:forEach items="${highList}" var="list" >
                            <div class="col-lg-3 my-3">
                                <a href="/product/view?type=${list.type}&product_idx=${list.product_idx}" style="color:black">
                                    <svg class="bd-placeholder-img" width="250" height="300" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
                                    <h4 class="my-2">${list.product_name}</h4>
                                    <p class="mb-1">${list.type}&nbsp;${list.grade}</p>
                                    <p class="mb-1">${list.price}원</p>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <hr class="featurette-divider">
<%--초등 책--%>
        <div class="row text-center">
            <h3>학년 별 추천 책 ( 초등 )</h3>
            <div class="tab-content" id="pills-tabContent2">
                <div class="tab-pane fade show active" id="pills-home2" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-3 my-3 text-center">
                            <img style="height: 510px; border-radius: 15px" src="https://mall.chunjaetext.co.kr/SkinImg/recommend_bn1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <c:forEach items="${elemRandom}" var="list" >
                            <div class="col-lg-3 my-3 text-center">
                                <a href="/product/view?type=${list.type}&product_idx=${list.product_idx}" style="color:black">
                                    <svg class="bd-placeholder-img" width="250" height="300" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
                                    <h4 class="my-2">${list.product_name}</h4>
                                    <p class="mb-1">${list.type}&nbsp;${list.grade}</p>
                                    <p class="mb-1">${list.price}원</p>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
<%--중등 책--%>
        <hr class="featurette-divider">
        <div class="row text-center">
            <h3>학년 별 추천 책 ( 중등 )</h3>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-3 my-3 text-center">
                            <img style="height: 510px; border-radius: 15px" src="https://mall.chunjaetext.co.kr/SkinImg/recommend_bn2.jpg" class="d-block w-100" alt="...">
                        </div>
                        <c:forEach items="${midRandom}" var="list" >
                            <div class="col-lg-3 my-3 text-center">
                                <a href="/product/view?type=${list.type}&product_idx=${list.product_idx}" style="color:black">
                                    <svg class="bd-placeholder-img" width="250" height="300" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
                                    <h4 class="my-2">${list.product_name}</h4>
                                    <p class="mb-1">${list.type}&nbsp;${list.grade}</p>
                                    <p class="mb-1">${list.price}원</p>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <hr class="featurette-divider">
<%--고등 책--%>
        <div class="row text-center">
            <h3>학년 별 추천 책 ( 고등 )</h3>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-3 my-3 text-center">
                            <img style="height: 510px; border-radius: 15px" src="https://mall.chunjaetext.co.kr/SkinImg/recommend_bn3.jpg" class="d-block w-100" alt="...">
                        </div>
<%--                        <div class="col-lg-9" >--%>
<%--                        <div class="owl-carousel owl-theme">--%>
                        <c:forEach items="${highRandom}" var="list" >
                            <div class="col-lg-3 my-3 owl-item text-center">
                                <a href="/product/view?type=${list.type}&product_idx=${list.product_idx}" style="color:black">
                                    <svg class="bd-placeholder-img" width="250" height="300" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
                                    <h4 class="my-2">${list.product_name}</h4>
                                    <p class="mb-1">${list.type}&nbsp;${list.grade}</p>
                                    <p class="mb-1">${list.price}원</p>
                                </a>
                            </div>
                        </c:forEach>
<%--                        </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">...</div>
            </div>
        </div>
        <hr class="featurette-divider">
        <div class="row featurette">
            <div class="col-md-6">
                <div class="card border-primary m-2 mx-auto" style="width: 30rem; height: auto; box-shadow: 0 5 5 5">
                    <div class="card-body">
                        <div class="row d-flex align-items-center">
                            <h4 class=" px-3 fw-bold col-6 align-items-center" style="color:#139d03;">공지사항</h4>
                            <a class="col-6 text-md-end" href="/community/list?type=qna">+더보기</a>
                        </div>
                        <hr class="my-1">
                        <div class="list-group" style="border: 0px">
                            <c:forEach items="${noticeList}" var="list">
                                <a href="/community/view?type=notice&idx=${list.idx}" class="list-group-item list-group-item-action">
                                    <span class="d-flex w-100 justify-content-between">
                                        <small class="mb-1"><c:out value="${list.title}"/></small>
                                        <small class="text-muted">${list.reg_date}</small>
                                    </span>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card border-primary m-2 mx-auto" style="width: 30rem; height: auto; box-shadow: 0 5 5 5">
                    <div class="card-body ">
                        <div class="row d-flex align-items-center">
                            <h4 class=" px-3 fw-bold col-6 align-items-center" style="color:#139d03;">FAQ</h4>
                            <a class="col-6 text-md-end" href="/community/list?type=faq">+더보기</a>
                        </div>
                        <hr class="my-1">
                        <div class="list-group" style="border: 0px">
                            <c:forEach items="${faqList}" var="list">
                                <a href="/community/view?type=faq&idx=${list.idx}" class="list-group-item list-group-item-action">
                                    <span class="d-flex w-100 justify-content-between">
                                        <small class="mb-1"><span class="material-symbols-outlined align-middle">help</span>&nbsp;<c:out value="${list.title}"/></small>
                                        <small class="text-muted">${list.reg_date}</small>
                                    </span>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/common/footer.jsp"%>
<script>
    <link rel="stylesheet" href="/resources/js/owl.carousel.js"/>
    <link rel="stylesheet" href="/resources/js/owl.autoplay.js"/>
    <link rel="stylesheet" href="/resources/js/owl.navigation.js"/>

    // $(function() {
    //     $('.owl-carousel').owlCarousel({
    //     items : 2,
    //         margin: 10,
    //         loop: true,
    //         nav: true,
    //         navText['이전','다음'],
    //         autoplay: true,
    //         autoplayTimeout: 3000,
    //         autoplayHoverPause: true
    //     });
    // });
</script>
</body>
</html>

