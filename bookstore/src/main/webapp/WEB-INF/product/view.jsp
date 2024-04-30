<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>도서 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script src="//code.jquery.com/jquery-3.5.1.min.js" ></script>

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>
<body>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<<body>
<!-- Product section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..."></div>
            <div class="col-md-6">
                <%--                    <div class="small mb-1">SKU: BST-498</div>--%>
                <h1 class="display-5 fw-bolder">${productDTO.product_name}</h1>
                <table>
                    <tr>
                        <th>대상</th>
                        <td>${productDTO.type}</td>
                    </tr>
                    <tr>
                        <th>출간일</th>
                        <td>${productDTO.publish_date}</td>
                    </tr>
                    <tr>
                        <th>페이지</th>
                        <td>${productDTO.page_cnt}쪽</td>
                    </tr>
                    <tr>
                        <th>정가</th>
                        <td id="price">${productDTO.price}</td>
                    </tr>
                    <tr>
                        <th>판매가</th>
                        <td id="sell_price"></td>
                    </tr>
                    <tr>
                        <th>적립금</th>
                        <td>[VIP회원 5% / 골드회원 4% / 일반회원 3%]</td>
                    </tr>
                    <tr style="border-top: 2px solid lightgrey;">
                        <th>배송비</th>
                        <td>2500원</td>
                    </tr>

                    <tr>
                        <th>구매가</th>
                        <td id="real_price">${productDTO.price}</td>
                    </tr>
                </table>
                <form>
                    <div class="d-flex align-items-center">
                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2" id="stepDown"
                                onclick="this.parentNode.querySelector('input[type=number]').stepDown(); step();">
                            <span class="material-symbols-outlined">remove</span>
                        </button>

                        <input id="product_cnt" min="1" name="product_cnt" value="1" type="number"
                               class="form-control form-control-sm" style="width:50px; text-align: center"/>

                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2" id="stepUp"
                                onclick="this.parentNode.querySelector('input[type=number]').stepUp(); step();">
                            <span class="material-symbols-outlined">add</span>
                        </button>


                        <input type="hidden" name="or_member_id" value="${sessionScope.member_id}" />
                        <input type="hidden" name="product_idx" value="${productDTO.product_idx}"/>
                        <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="addCart()">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니에 담기
                        </button>
                    </div>
                </form>
                <div class="fs-5 text-end">
                    <div>
                        총 상품금액 <sub>(총 수량)</sub>
                        <span id="total_price" style="font-size: 30px; color: #0c63e4">${productDTO.price}</span> <span style="font-size: 20px; color: #0c63e4"><sub id="total_count">(1)</sub></span>
                    </div>
                    <div>

                    </div>
                </div>
            </div>

            <!-- 도서 정보 탭 -->
            <div class="products-container-wrap">
                <div class="products-container-tab">
                    <div class="tab-wrap scroll-tab" id="tab-menu">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#bookDetail">상세정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#bookReview">교재후기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#relatedProduct">관련상품</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#bookPolicy">배송안내</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- 도서정보 -->
            <div class="product-info-section product-spec" id="bookDetail">
                <h3 class="section-title py-3" style="border-bottom: 2px solid lightgrey;">기본정보</h3>
                <div class="product-info-content">
                    <!-- Editors s -->
                    <div class="text text-row">
                        <dl class="d-flex lh-1 mb-2">
                            <dt style="line-height:inherit;font-size:15px;color:#8d8d8d;width:100px;">출판사</dt>
                            <dd style="flex:1;line-height:inherit;font-size:15px;color:#373737;" class="ng-binding">${productDTO.publisher}</dd>
                        </dl>
                        <dl style="display:flex;line-height:1;margin-bottom:20px;">
                            <dt style="line-height:inherit;font-size:15px;color:#8d8d8d;width:100px;">저자</dt>
                            <dd style="flex:1;line-height:inherit;font-size:15px;color:#373737;" class="ng-binding">${productDTO.author}</dd>
                        </dl>
                        <dl style="display:flex;line-height:1;margin-bottom:20px;">
                            <dt style="line-height:inherit;font-size:15px;color:#8d8d8d;width:100px;">출간일</dt>
                            <dd style="flex:1;line-height:inherit;font-size:15px;color:#373737;" class="ng-binding">${productDTO.publish_date}</dd>
                        </dl>
                        <dl style="display:flex;line-height:1;">
                            <dt style="line-height:inherit;font-size:15px;color:#8d8d8d;width:100px;">페이지</dt>
                            <dd style="flex:1;line-height:inherit;font-size:15px;color:#373737;" class="ng-binding">${productDTO.page_cnt}쪽</dd>
                        </dl>
                    </div>
                    <!-- Editors e -->
                </div>
            </div>
            <div class="product-info-section">
                <h3 class="section-title py-3" style="border-bottom: 2px solid lightgrey;">교재소개</h3>
                <div class="product-info-content">
                    <c:if test="${productDTO.product_content != null}">
                        ${productDTO.product_content}
                    </c:if>
                    <c:if test="${productDTO.product_content == null}">
                        <div>교재 소개가 없습니다.</div>
                    </c:if>
                </div>
            </div>

            <!-- 교재 후기 -->
            <div class="product-info-section product-review" id="bookReview">
                <section class="section-title-wrap list-wrap-btw">
                    <h3 class="section-title py-3" style="border-bottom: 2px solid lightgrey;">
                        교재후기
                        <button type="button" class="btn btn-primary" style="font-size: 16px;" onclick="location.href='/product/review/regist?type=${productDTO.type}&product_idx=${productDTO.product_idx}'">후기쓰기</button>
                    </h3>
                </section>
                <div class="accordion accordion-flush" id="accordionFlushExample" style="border-bottom: 2px solid lightgrey;">
                    <%--                    <form id="frmDelete" name="frmDelete" method="post" action="/product/review/delete">--%>
                    <c:if test="${not empty reviewList}">
                        <c:forEach items="${reviewList}" var="list">
                            <input type="hidden" name="product_idx" value="${list.product_idx}" />
                            <input type="hidden" name="review_idx" value="${list.review_idx}" />
                            <input type="hidden" name="type" value="${productDTO.type}" />
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-heading${list.review_idx}">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${list.review_idx}" aria-expanded="false" aria-controls="flush-collapse${list.review_idx}">
                                            ${list.title}
                                    </button>
                                </h2>
                                <div id="flush-collapse${list.review_idx}" class="accordion-collapse collapse" aria-labelledby="flush-heading${list.review_idx}" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">${list.content}</div>
                                    <c:if test="${sessionScope.member_id == list.writer}">
                                        <div class="text-end mb-2">
                                            <button type="button" class="btn btn-primary" onclick="location.href='/product/review/modify?type=${productDTO.type}&product_idx=${productDTO.product_idx}&review_idx=${list.review_idx}'">수정</button>
                                            <button type="button" class="btn btn-outline-danger" onclick="goDelete(${list.review_idx}, ${list.product_idx})">삭제</button>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty reviewList}">
                        <div>
                            등록된 후기가 없습니다.
                        </div>
                    </c:if>

                    <!-- 관련 상품 -->
                    <div class="product-info-section product-spec" id="relatedProduct">
                        <h3 class="section-title py-3" style="border-bottom: 2px solid lightgrey;">관련상품</h3>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">Fancy Product</h5>
                                            <!-- Product price-->
                                            $40.00 - $80.00
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Sale badge-->
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                    <!-- Product image-->
                                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">Special Item</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            <span class="text-muted text-decoration-line-through">$20.00</span>
                                            $18.00
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Sale badge-->
                                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                    <!-- Product image-->
                                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">Sale Item</h5>
                                            <!-- Product price-->
                                            <span class="text-muted text-decoration-line-through">$50.00</span>
                                            $25.00
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">Popular Item</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                                <div class="bi-star-fill"></div>
                                            </div>
                                            <!-- Product price-->
                                            $40.00
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="product-info-section product-delivery" id="bookPolicy">
                        <section class="product-delivery-section">
                            <h3 class="section-title py-3" style="border-bottom: 2px solid lightgrey;">출고/배송 및 배송비안내</h3>
                            <div class="product-info-content">
                                <dl class="text-box">
                                    <dt class="text-title">출고안내</dt>
                                    <dd class="text-content">
                                        평일 기준으로 당일 오후 1시까지 결재완료를 기준으로 당일 출고됩니다.
                                        <br>※ 교과서 구매시 출고일정이 지연될 수도 있습니다.
                                        <br>
                                        평일 오후 1시 이후, 토,일·휴무일, 공휴일에 주문하신 경우에는 다음날 평일에 출고됩니다.
                                    </dd>
                                </dl>
                                <dl class="text-box">
                                    <dt class="text-title">배송기간안내</dt>
                                    <dd class="text-content">
                                        출고일로부터 2-5일 이내(토, 일 휴무일, 공휴일 제외) <br>
                                        단, 택배사 주문 폭주기간(설, 추석 명절기간)은 배송기간이 다소 차이가 있을 수 있으니 양해 바랍니다.
                                    </dd>
                                </dl>
                                <dl class="text-box">
                                    <dt class="text-title">배송비 안내</dt>
                                    <dd class="text-content ng-binding ng-hide" ng-show="isPartnersBook">
                                        배송비는 3만원 이상 구매 시 무료이고, 3만원 미만 주문 시 배송비(2,500원)를 부담하셔야 합니다.
                                    </dd>
                                    <dd class="text-content ng-binding" ng-show="!isPartnersBook">
                                        <!--                                                배송비는 1.5만원 이상 구매 시 무료이고, 1.5만원 미만 주문 시 배송비({{deliveryfee | number}}원)를 부담하셔야 합니다.-->
                                        15,000원 이상 구매 시 무료배송이고, 15,000원 미만 구매 시 2,500원 입니다. (제주&amp;도서산간지역 추가 3,000원)
                                    </dd>
                                </dl>
                            </div>
                        </section>
                        <section class="product-delivery-section">
                            <h3 class="section-title">취소/교환/반품 안내</h3>
                            <div class="product-info-content">
                                <dl class="text-box">
                                    <!-- <dt class="text-title">취소/교환/반품 안내</dt> -->
                                    <dd class="text-content">
                                        고객 변심 또는 오주문에 의한 취소/교환/반품시 배송비는 고객님 부담입니다. <br>
                                        제품 불량 및 오배송 등의 이유로 취소/교환/반품 하실 경우 배송비는 무료 입니다. <br>
                                        취소/교환/반품에 대한 요구는 제품 수령일로부터 7일 이내에 하셔야 합니다. <br>
                                        (영유아 카테고리 상품은 수령일로 부터 14일 이내 가능) <br>
                                        단, 고객 과실로 인해 제품의 가치가 훼손된 경우 취소/교환/반품이 불가합니다. (세트포장, 랩핑, 전용박스 개봉 등) <br>
                                        세트 판매 제품의 경우 부분취소/부분반품이 불가합니다.
                                    </dd>
                                </dl>
                            </div>
                        </section>
                    </div>

                </div>
            </div>
</section>


<script src="/resources/js/scripts.js"></script>
<script>
    if("${productDTO.discount != 0}") {
        document.getElementById("price").style.textDecoration = "line-through";
        document.getElementById("sell_price").innerText = "${productDTO.price}"
    }

    function goDelete(review_idx, product_idx) {
        const frm = document.getElementById("frmDelete");
        let confirm_flag = confirm("해당 문의글을 삭제하시겠습니까?");

        if(confirm_flag) {
            $.ajax({
                type: "POST",
                url: "/product/review/delete",
                data : {
                    review_idx : review_idx,
                    product_idx : product_idx,
                    type : "${productDTO.type}"
                },
                success :function(data) {
                    if(data != "N") {
                        alert("해당 후기를 삭제했습니다.");
                        window.location.reload(data);
                    }
                },
                error() {
                    alert("삭제 실패");
                }
            });
        }
    }

    function step() {
        const product_cnt = document.getElementById("product_cnt");
        let total_price = document.getElementById("total_price");
        let total_count = document.getElementById("total_count");

        total_count.innerText = "(" + product_cnt.value + ")";

        total_price.innerText = ${productDTO.price} * product_cnt.value;
    }

    function addCart(product_idx) {
        let product_cnt = document.getElementById("product_cnt").value;

        $.ajax({
            type: "POST",
            url: "/my/cart/add",
            data : {
                "CartDTO" :
            },
            success :function(data) {
                if(data != "N") {
                    alert("해당 후기를 삭제했습니다.");
                    window.location.reload(data);
                }
            },
            error() {
                alert("삭제 실패");
            }
        });
    }

</script>
<%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
