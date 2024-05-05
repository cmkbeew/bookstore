<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-04-26
  Time: 오전 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>admin >> productModify</title>

    <%--    해당 템플릿 css--%>
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/carousel.css" rel="stylesheet">
    <link href="/resources/css/admin/styles.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <link rel="stylesheet" href="/resources/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.green.css">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
    <script src="https://cdn.tiny.cloud/1/l7s9qc136p4pmwyuszv8b1a5nh66vdir4b84oksbknriidxl/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body style="background-color: #eeeeee; padding-bottom: 0px;">
<%@ include file="/WEB-INF/common/header.jsp"%>
<div class="d-flex" id="wrapper">
    <%@ include file="/WEB-INF/common/adminSidebar.jsp"%>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper" style="min-height: 80vh;">
        <button class="btn btn-primary" id="sidebarToggle">
            <span class="material-symbols-outlined" style="display: block;">arrow_back</span>
            <span class="material-symbols-outlined" style="display: none;">arrow_forward</span>
        </button>
        <!-- Page content-->
        <div class="container" style="margin-bottom: 5rem;">
            <div class="row">
                <div class="col-md-12">
                    <form name="modifyFrm" id="modifyFrm" method="post" action="/admin/product/modify" enctype="multipart/form-data">
                        <input type="hidden" name="product_idx" id="product_idx" value="${productDTO.product_idx}"/>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0" style="text-align: center;">도서상품 수정</h5>
                            </div>
                            <div class="row text-left">
                                <div class="full-width site-content col-md-12">
                                    <div>
                                        <table class="table no-wrap user-table mb-0 text-lg-start">
                                            <tr class="table-light">
                                                <th style="width: 120px; vertical-align: middle;">교재명</th>
                                                <td>
                                                    <input type="text" name="product_name" id="product_name" class="form-control" value="${productDTO.product_name}" placeholder="교재명"/>
                                                    <div id="div_err_product_name" style="display: none"></div>
                                                </td>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">출판사</th>
                                                <td>
                                                    <input type="text" name="publisher" id="publisher" class="form-control" value="${productDTO.publisher}" placeholder="출판사"/>
                                                    <div id="div_err_publisher" style="display: none"></div>
                                                </td>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">저자</th>
                                                <td>
                                                    <input type="text" name="author" id="author" class="form-control" value="${productDTO.author}" placeholder="저자"/>
                                                    <div id="div_err_author" style="display: none"></div>
                                                </td>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">쪽수</th>
                                                <td>
                                                    <input type="text" name="page_cnt" id="page_cnt" class="form-control" value="${productDTO.page_cnt}" placeholder="쪽수"/>
                                                    <div id="div_err_page_cnt" style="display: none"></div>
                                                </td>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">가격</th>
                                                <td>
                                                    <input type="text" name="price" id="price" class="form-control" value="${productDTO.price}" placeholder="가격"/>
                                                    <div id="div_err_price" style="display: none"></div>
                                                </td>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">소득공제여부</th>
                                                <td class="input-group">
                                                    <div class="control control--radio my-0">
                                                        <label class="form-check-label" for="tax_y">가능
                                                            <input class="form-check-input va-middle" type="radio" name="tax_yn" id="tax_y" value="Y"
                                                                    <c:out value="${productDTO.tax_yn == 'Y' ? 'checked' : ''}"/>/>
                                                            <div class="control__indicator2"></div>
                                                        </label>
                                                    </div>
                                                    <div class="control control--radio ms-3 my-0">
                                                        <label class="form-check-label" for="tax_n">불가능
                                                            <input class="form-check-input va-middle" type="radio" name="tax_yn" id="tax_n" value="N"
                                                                    <c:out value="${productDTO.tax_yn == 'N' ? 'checked' : ''}"/>/>
                                                            <div class="control__indicator2"></div>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">출판일</th>
                                                <td>
                                                    <input type="date" name="publish_date" id="publish_date" class="form-control" value="${productDTO.publish_date}"/>
                                                    <div id="div_err_publish_date" style="display: none"></div>
                                                </td>
                                            </tr>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">유형</th>
                                                <td class="input-group">
                                                    <div class="control control--radio my-0">
                                                        <label class="form-check-label" for="type_0">유아
                                                            <input class="form-check-input va-middle" type="radio" name="type" id="type_0" value="유아"
                                                                    <c:out value="${productDTO.type == '유아' ? 'checked' : ''}"/>/>
                                                            <div class="control__indicator2"></div>
                                                        </label>
                                                    </div>
                                                    <div class="control control--radio ms-3 my-0">
                                                        <label class="form-check-label" for="type_1">초등
                                                            <input class="form-check-input va-middle" type="radio" name="type" id="type_1" value="초등"
                                                                    <c:out value="${productDTO.type == '초등' ? 'checked' : ''}"/>/>
                                                            <div class="control__indicator2"></div>
                                                        </label>
                                                    </div>
                                                    <div class="control control--radio ms-3 my-0">
                                                        <label class="form-check-label" for="type_2">중등
                                                            <input class="form-check-input va-middle" type="radio" name="type" id="type_2" value="중등"
                                                                    <c:out value="${productDTO.type == '중등' ? 'checked' : ''}"/>/>
                                                            <div class="control__indicator2"></div>
                                                        </label>
                                                    </div>
                                                    <div class="control control--radio ms-3 my-0">
                                                        <label class="form-check-label" for="type_3">고등
                                                            <input class="form-check-input va-middle" type="radio" name="type" id="type_3" value="고등"
                                                                    <c:out value="${productDTO.type == '고등' ? 'checked' : ''}"/>/>
                                                            <div class="control__indicator2"></div>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">학년</th>
                                                <td>
                                                    <input type="text" name="grade" id="grade" class="form-control" value="${productDTO.grade}" placeholder="학년"/>
                                                    <div id="div_err_grade" style="display: none"></div>
                                                </td>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">과목</th>
                                                <td>
                                                    <input type="text" name="subject" id="subject" class="form-control" value="${productDTO.subject}" placeholder="과목"/>
                                                    <div id="div_err_subject" style="display: none"></div>
                                                </td>
                                            </tr>
                                            <tr class="table-light">
                                                <th style="width: 120px;" class="va-middle">할인율</th>
                                                <td>
                                                    <input type="text" name="discount" id="discount" class="form-control" value="${productDTO.discount}" placeholder="할인율"/>
                                                    <div id="div_err_discount" style="display: none"></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="p-3" style="min-height: 20vh;">
                                        <textarea name="product_content" id="product_content" placeholder="내용을 입력하세요.">
                                            ${productDTO.product_content}
                                        </textarea>
                                        <div id="div_err_product_content" style="display: none"></div>
                                    </div>
                                    <table class="table no-wrap user-table mb-0 text-lg-start">
                                        <tr class="table-light">
                                            <th style="width: 120px; vertical-align: middle;">
                                                첨부파일
                                                <span class="material-symbols-outlined web_font">attach_file</span>
                                            </th>
                                            <td><input type="file" name="file" class="form-control" /></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="mt-md-2">
                            <div>
                                <button type="reset" class="btn btn-outline-primary me-2">초기화</button>
                                <button type="submit" class="btn btn-primary me-2">완료</button>
                                <button type="button" class="btn btn-outline-danger me-2" onclick="location.href='/admin/product/list'">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp"%>
<script>
    tinymce.init({
        selector: 'textarea',
    });

    const serverValidResult = {};
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red;'>${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
</script>
</body>
</html>
