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

    <%--  header 부트스트랩  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <%-- list 부트스트랩   --%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex py-h" id="wrapper">
    <%--    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>--%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper">
        <%--        <button class="btn btn-primary" id="sidebarToggle">--%>
        <%--            <i class="fa fa-arrow-left" aria-hidden="true" style="display: block;"></i>--%>
        <%--            <i class="fa fa-arrow-right" aria-hidden="true" style="display: none;"></i>--%>
        <%--        </button>--%>
        <!-- Page content-->
        <div class="container py-h">
            <div class="row">
                <div class="col-md-3"style="background-color: #e4f3ef">
                    <%@ include file="/WEB-INF/common/sidebar.jsp"%>
                </div>
                <div class="col-md-9">
<%--                    <section class="h-100 h-custom" style="background-color: #eee;">--%>
                        <div class="container py-5 h-100">
<%--                            <div class="row d-flex justify-content-center align-items-center h-100">--%>
                                <div class="col">
                                    <div class="card">
                                        <div class="card-body p-4">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <h5 class="mb-3"><a href="#!" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                                    <hr>
                                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                                        <div>
                                                            <p class="mb-1">Shopping cart</p>
                                                            <p class="mb-0">You have ${model.cartList} items in your cart</p>
                                                        </div>
                                                    </div>
                                                    <c:forEach items="${cartList}" var="list" varStatus="status">
                                                        <div class="card mb-3">
                                                            <div class="card-body">
                                                                <div class="d-flex justify-content-between">
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <div><label class="control control--checkbox">
                                                                            <input type="checkbox" name="select" id="select${list.product_name}" value="">
                                                                            <div class="control__indicator"></div>
                                                                        </label></div>
                                                                        <div>
                                                                            <img
                                                                                src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                                                                class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                                                        </div>
                                                                        <div class="ms-3">
                                                                            <h5>${list.product_name}</h5>
                                                                            <p class="small mb-0">${list.publisher}</p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex flex-row align-items-center">
                                                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                                                id="minus${list.cart_idx}" onclick="this.parentNode.querySelector('input[type=number]').stepDown(); cntBook(current${status.index})">
                                                                            <span class="material-symbols-outlined">remove</span>
                                                                        </button>

                                                                        <input id="form${list.cart_idx}" min="1" name="quantity" value="1" type="number"
                                                                               class="form-control form-control-sm" style="width:50px; text-align: center"/>
                                                                        <input type="hidden" name=current${status.index} value="${list.cart_idx}"/ >



                                                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2" value
                                                                                id="plus${list.cart_idx}" onclick="this.parentNode.querySelector('input[type=number]').stepUp(); cntBook(current${status.index})">
                                                                            <span class="material-symbols-outlined">add</span>
                                                                        </button>
                                                                        <div style="width: 100px;">
                                                                            <c:choose>
                                                                                <c:when test="${list.display_price eq list.price}">
                                                                                    <p class="small mb-0">정가 : ${list.price}</p>
<%--                                                                                    <p class="small mb-0">정가 : ${list.price}</p>--%>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <p class="small mb-0"><del>정가 : ${list.price}</del></p>
                                                                                    <p class="small mb-0">판매가 : ${list.display_price}</p>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </div>
                                                                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="card mb-3">
                                                        <div class="card-body">
                                                            <div class="d-flex justify-content-center">
<%--                                                                <div class="d-flex flex-row align-items-center">--%>
<%--                                                                    <div class="ms-3">--%>
<%--                                                                        <h5>ㄴㄹㄴㄹ</h5>--%>
<%--                                                                        <p class="small mb-0">ㄴㅇㄹㄴㅇㄹㄴㅇㄹ</p>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="d-flex flex-row align-items-center">--%>
<%--                                                                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"--%>
<%--                                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">--%>
<%--                                                                        <span class="material-symbols-outlined">remove</span>--%>
<%--                                                                    </button>--%>

                                                                    <input id="total_value" min="1" name="quantity" value="1" type="number"
                                                                           class="form-control form-control-sm" style="width:50px; text-align: center"/>

<%--                                                                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2" value--%>
<%--                                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">--%>
<%--                                                                        <span class="material-symbols-outlined">add</span>--%>
<%--                                                                    </button>--%>
<%--                                                                    <div style="width: 100px;">--%>

<%--                                                                    </div>--%>
                                                                    <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
<%--                                                                </div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-around">
                                                    <button type="button" class="btn btn-outline-danger btn-circle btn-lg btn-circle col-3">삭제하기</button>
                                                    <button type="button" class="btn btn-outline-primary btn-circle btn-lg btn-circle col-4">선택 상품 주문하기</button>
                                                    <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle col-4">전체 상품 주문하기</button>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                            </div>
                        </div>

                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
<script>
    function cntBook(idx){
            var url = 'deletingBook.do?bookname=' + idx.value;



    function idbtnChek() {
        let id = $('#member_id').val();
        $.ajax({
            url:'/my/updateCnt',
            type:'post',
            data:{member_id : id},
            success:function(cnt){
                if(cnt == 0){
                    $('.idCk1').css("dispaly","none");
                    $('.idCk2').css("display","block");
                } else {
                    $('.idCk2').css("dispaly","none");
                    $('.idCk1').css("display","block");
                    $('#member_id').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
    }
</script>
</body>
</html>
