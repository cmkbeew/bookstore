<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <meta name="description" content="">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
    <%--    헤더 css--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="/resources/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">


    <link rel="stylesheet" href="/resources/css/login/style.css">
    <link rel="stylesheet" href="/resources/css/mintybootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/mintybootstrap.css">
    <link rel="stylesheet" href="/resources/css/ifta.css">
    <title>회원가입</title>
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
</head>
<body style="background-color:#fdfdfd ">
<%@ include file="/WEB-INF/common/header.jsp" %>
<div class="content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="form-block">
                            <%--                            class="form-block"--%>
                            <div class="py-5 text-center">
                                <span class="material-symbols-outlined d-block mx-auto mb-4" style="font-size: 72px">edit_square</span>
                                <h2>Modify Information</h2>
                                <p class="lead">회원 정보 수정</p>
                            </div>
                            <div>
                                <form class="needs-validation" novalidate method="post" action="/member/modify">
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label for="member_id" class="small ifta-label">아이디</label>
                                            <input type="text" class="ifta-field" id="member_id" name="member_id"
                                                   placeholder="" value="${memberDTO.member_id}" readonly>
                                            <div class="invalid-feedback">
                                                사용할 아이디를 입력해주세요.
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <label for="name" class="small ifta-label">이름</label>
                                            <input type="text" class="ifta-field" id="name" name="name" placeholder=""
                                                   value="${memberDTO.name}" readonly>
                                            <div class="invalid-feedback">
                                                이름을 입력해주세요.
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <label for="email" class="small ifta-label">이메일</label>
                                            <input type="email" class="ifta-field" id="email" name="email" value="${memberDTO.email}"
                                                   placeholder="you@example.com" required>
                                            <div class="invalid-feedback">
                                                이메일을 형식에 맞게 입력해주세요.
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="row mt-3 mb-4 align-items-center justify-content-center">
                                                <div class="col-3"><label for="phone_num1" class="small ifta-label">전화번호</label>
                                                    <input type="tel" class="ifta-field" id="phone_num1" name="phone_num1"
                                                           placeholder="010" maxlength="3" value="${memberDTO.phone_num1}" required>
                                                </div>
                                                <div class="col-1 align-middle">
                                                    <div class="py-2 fw-bold" style="padding:35px 20px 15px;width:100%;"><p style="font-size: 20px"><span class="material-symbols-outlined">remove</span></p></div> </div>
                                                <div class="col-3"><label for="phone_num2" class="small ifta-label">&nbsp;</label>
                                                    <input type="tel" class="ifta-field" id="phone_num2" name="phone_num2"
                                                           placeholder="1111" maxlength="4" value="${memberDTO.phone_num2}" required>
                                                </div>
                                                <div class="col-1">
                                                    <div class="py-2 fw-bold" style="padding:35px 20px 15px;width:100%;"><p style="font-size: 20px"><span class="material-symbols-outlined">remove</span></p></p></div> </div>
                                                <div class="col-3"><label for="phone_num3" class="small ifta-label">&nbsp;</label>
                                                    <input type="tel" class="ifta-field" id="phone_num3" name="phone_num3"
                                                           placeholder="1111" maxlength="4" value="${memberDTO.phone_num3}" required>
                                                </div>
                                                <div class="invalid-feedback">
                                                    전화번호 형식에 맞게 입력해주세요.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <label for="zipcode" class="small ifta-label">우편번호</label>
                                            <input type="text" class="ifta-field" name="zipcode" id="zipcode"
                                                   placeholder="" value="${memberDTO.zipcode}" required readonly>
                                            <div class="invalid-feedback">
                                                주소를 작성해주세요.
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <%--                                            <label for="zipcodebtn" class="form-label">우편번호</label>--%>
                                            <input type="button" class="btn btn-outline-primary col-12" value="주소 찾기" name="zipcodebtn"
                                                   id="zipcodebtn" onclick="addr()">

                                        </div>
                                        <div class="col-12">
                                            <label for="addr1" class="small ifta-label">주소1</label>
                                            <input type="text" class="ifta-field mb-0" name="addr1" id="addr1" placeholder=""
                                                   value="${memberDTO.addr1}" required readonly>
                                            <small class="text-muted" >우편번호 찾기를 통해 주소를 입력해주세요.</small>
                                            <div class="invalid-feedback">
                                                우편번호 찾기를 통해 주소를 입력해주세요.
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <label for="addr2" class="small ifta-label">주소2</label>
                                            <!--<span class="text-muted">(선택사항)</span>-->
                                            <input type="text" class="ifta-field mb-0" name="addr2" id="addr2" placeholder=""
                                                   value="${memberDTO.addr2}" required>
                                            <small class="text-muted">상세 주소를 입력해주세요.</small>
                                        </div>
                                        <div class="row mt-3 mb-4">
                                            <hr class="my-2">
                                            <div class="col-12 mt-3">
                                                <p>평생회원 선택</p>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="forever_yn"
                                                           id="optionsRadios1" value="Y" <c:if test="${memberDTO.forever_yn eq 'Y'}">checked</c:if>>
                                                    <label class="form-check-label" for="optionsRadios1">동의함</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="forever_yn"
                                                           id="optionsRadios2" value="N" <c:if test="${memberDTO.forever_yn eq 'N'}">checked</c:if>>
                                                    <label class="form-check-label" for="optionsRadios2">동의 안함</label>
                                                </div>
                                                <br>
                                                <small>평생회원으로 가입하시면 천재교과서 회원 탈퇴시까지는 휴면회원으로 전환되지 않으며, 고객님의 개인정보가 탈퇴시까지
                                                    안전하게 보관됩니다.</small>
                                            </div>

                                            <hr class="my-2">
                                            <div class="col-12 mt-3 justify-content-between">
                                                <p class="form-check form-check-inline"><strong>[선택] 이용약관 동의</strong>
                                                </p>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="option"
                                                           id="option" value="${memberDTO.option}" <c:if test="${memberDTO.option eq 'Y'}">checked</c:if>>
                                                    <label class="form-check-label" for="option">동의함</label>
                                                </div>
                                            </div>
                                            <div>
                                                <label for="firstEx3" class="form-label mt-4"></label>
                                                <textarea name="firstEx" id="firstEx3" class="col-12 form-control mb-2"
                                                          cols="10" rows="8" style="font-size:1rem; overflow-y: scroll; resize:none;"
                                                          readonly>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.

단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.

선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.
                                                </textarea>
                                            </div>
                                        </div>
                                        <hr class="my-2">
                                    </div>
                                    <button class="w-100 btn btn-primary btn-lg mt-3" type="submit">수정하기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script src="/resources/js/form-validation.js"></script>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<%--<script src="/resources/js/bootstrap.min.js"></script>--%>
<%--<script src="/resources/js/main.js"></script>--%>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v55bfa2fee65d44688e90c00735ed189a1713218998793"
        integrity="sha512-FIKRFRxgD20moAo96hkZQy/5QojZDAbyx0mQ17jEGHCJc/vi0G2HXLtofwD7Q3NmivvP9at5EVgbRqOaOQb+Rg=="
        data-cf-beacon='{"rayId":"879d448bbc1a29e5","version":"2024.4.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
        crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"--%>
<%--        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"--%>
<%--        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"--%>
<%--        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"--%>
<%--        crossorigin="anonymous"></script>--%>

<script>
    function addr() {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("addr1").value = data.roadAddress;
            }
        }).open();
    }

    let optBtn = document.getElementById("option")

    optBtn.addEventListener("click", (e) => {
        if (optBtn.value == "N") {
            optBtn.value = "Y"
            console.log(optBtn.value);
        } else {
            optBtn.value = 'N';
            console.log(optBtn.value);
        }
    });
</script>


</body>
</html>


