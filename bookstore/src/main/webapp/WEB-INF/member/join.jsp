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
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
    <meta name="description" content="">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
    <%--    헤더 css--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/styles.css" rel="stylesheet" />

    <link rel="stylesheet" href="/resources/css/login/style.css">
<%--    <link rel="stylesheet" href="/resources/css/mintybootstrap.min.css">--%>
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
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
</head>
<body style="background-color:#fdfdfd ">
<%@ include file="/WEB-INF/common/header.jsp" %>
<div class="content">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div>
                            <%--                            class="form-block"--%>
                            <div class="py-5 text-center">
                                <span class="material-symbols-outlined d-block mx-auto mb-4" style="font-size: 72px">edit_square</span>
                                <h2>Member Join</h2>
                                <p class="lead">회원가입을 위해 작성해주세요!</p>
                            </div>
                            <div>
                                <h4 class="mb-5">정보 입력</h4>
                                <form class="needs-validation" novalidate method="post" action="/member/join">
                                    <div class="row g-3">
                                        <div class="row" style="align-items: center">
                                            <div class="col-md-8 col-sm-12">
                                                <label for="member_id" class="small ifta-label">아이디</label>
                                                <input type="text" class="ifta-field" id="member_id" name="member_id"
                                                       placeholder="" value="${dto.member_id}" required>
                                            </div>
                                            <div class="col-md-4">
                                                <%--                                            <label for="zipcodebtn" class="form-label">우편번호</label>--%>
                                                <input type="button" class="btn btn-outline-primary col-12 mb-2" style="height: 70px" value="주소 찾기" name="idBtn"
                                                       id="idBtn" onclick="idbtnChek()">
                                            </div>
                                            <div class="invalid-feedback">
                                                사용할 아이디를 입력해주세요.
                                            </div>
                                            <div id="feedbackId" style="display:none;width:100%;margin-top:.15rem;font-size:.875em;color:#dc3545"></div>
                                        </div>
<%--                                        <div class="col-12 col-sm-12">--%>
<%--                                            <label for="member_id" class="small ifta-label">아이디</label>--%>
<%--                                            <input type="text" class="ifta-field" id="member_id" name="member_id"--%>
<%--                                                   placeholder="" value="${dto.member_id}" required>--%>
<%--                                        </div>--%>
<%--                                            <div class="invalid-feedback">--%>
<%--                                                사용할 아이디를 입력해주세요.--%>
<%--                                            </div>--%>
<%--                                            <div id="feedbackId" style="display:none;width:100%;margin-top:.15rem;font-size:.875em;color:#dc3545"></div>--%>
                                            <div class="idCk1" style="display:none;width:100%;margin-top:.15rem;font-size:.875em;color:#dc3545">사용 중인 아이디 입니다.</div>
                                            <div class="idCk2" style="display:none;width:100%;margin-top:.15rem;font-size:.875em;color:#56c2ff">사용 가능한 아이디 입니다.</div>
                                            <div id="div_err_display_member_id" style="display: none"></div>
                                        <div class="col-12 mt-3">
                                            <label for="name" class="small ifta-label">이름</label>
                                            <input type="text" class="ifta-field" id="name" name="name" placeholder=""
                                                   value="${dto.name}" required>
                                            <div class="invalid-feedback">
                                                이름을 입력해주세요.
                                            </div>
                                        </div>
                                        <div class="col-12 mt-3">
                                            <label for="pwd" class="small ifta-label">비밀번호</label>
                                            <input type="password" class="ifta-field" id="pwd" name="pwd" placeholder=""
                                                   value="" required>
                                            <div class="mb-4" style="display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#9a9a9a">
                                                영어 대문자 / 영어 소문자 / 특수문자 (@#$%^&~!) / 숫자 8~16자만 사용 가능합니다.
                                            </div>
                                            <div class="invalid-feedback">
                                                사용할 비밀번호를 입력해주세요.
                                            </div>
                                            <div id="feedbackPwd" style="display:none;width:100%;margin-top:.15rem;font-size:.875em;color:#dc3545"></div>
                                        </div>
                                        <div class="col-12 mt-3">
                                            <label for="pwd2" class="small ifta-label">비밀번호 재입력</label>
                                            <input type="password" class="ifta-field" id="pwd2" name="pwd2"
                                                   placeholder="" value="" required>
                                            <div class="invalid-feedback">
                                                비밀번호를 재입력해주세요.
                                            </div>
                                            <div id="pwdck" style="display: none;">
                                                비밀번호와 입력 비밀번호가 다릅니다.
                                            </div>
                                            <div id="div_err_display_pwd" style="display: none"></div>
                                        </div>
                                        <div class="col-12 mt-3">
                                            <label for="email" class="small ifta-label">이메일</label>
                                            <input type="email" class="ifta-field" id="email" name="email" value="${dto.email}"
                                                   placeholder="you@example.com" required>
                                            <div class="invalid-feedback">
                                                이메일을 형식에 맞게 입력해주세요.
                                            </div>
                                        </div>
                                        <div class="col-12 mt-3">
                                            <div class="row mt-3 mb-4 align-items-center justify-content-center">
                                                <div class="col-3"><label for="phone_num1" class="small ifta-label">전화번호</label>
                                                    <input type="tel" class="ifta-field" id="phone_num1" name="phone_num1" value="${dto.phone_num1}"
                                                           placeholder="010" maxlength="3" required>
                                                </div>
                                                <div class="col-1 align-middle">
                                                    <div class="py-2 fw-bold" style="padding:35px 20px 15px;width:100%;"><p style="font-size: 20px"><span class="material-symbols-outlined">remove</span></p></div> </div>
                                                <div class="col-3"><label for="phone_num2" class="small ifta-label">&nbsp;</label>
                                                    <input type="tel" class="ifta-field" id="phone_num2" name="phone_num2" value="${dto.phone_num2}"
                                                           placeholder="1111" maxlength="4" required>
                                                </div>
                                                <div class="col-1">
                                                    <div class="py-2 fw-bold" style="padding:35px 20px 15px;width:100%;"><p style="font-size: 20px"><span class="material-symbols-outlined">remove</span></p></p></div> </div>
                                                <div class="col-3"><label for="phone_num3" class="small ifta-label">&nbsp;</label>
                                                    <input type="tel" class="ifta-field" id="phone_num3" name="phone_num3" value="${dto.phone_num3}"
                                                           placeholder="1111" maxlength="4" required>
                                                </div>
                                                <div class="invalid-feedback">
                                                    전화번호 형식에 맞게 입력해주세요.
                                                </div>
                                            </div>
                                        </div>
                                            <div class="row" style="align-items: center">
                                            <div class="col-md-8 mt-3">
                                                <label for="zipcode" class="small ifta-label">우편번호</label>
                                                <input type="text" class="ifta-field" name="zipcode" id="zipcode"
                                                       placeholder="" value="${dto.zipcode}" required readonly>
                                                <div class="invalid-feedback">
                                                    주소를 작성해주세요.
                                                </div>
                                                <div id="div_err_display_zipcode" style="display: none"></div>
                                            </div>
                                            <div class="col-md-4">
                                                <%--                                            <label for="zipcodebtn" class="form-label">우편번호</label>--%>
                                                <input type="button" class="btn btn-outline-primary col-12 mb-2" style="height: 70px" value="주소 찾기" name="zipcodebtn"
                                                       id="zipcodebtn" onclick="addr()">
                                            </div>
                                            </div>
                                        <div class="col-12 mt-3">
                                            <label for="addr1" class="small ifta-label">주소1</label>
                                            <input type="text" class="ifta-field mb-0" name="addr1" id="addr1" placeholder="" value="${dto.addr1}"
                                                   required readonly>
                                            <small class="text-muted" >우편번호 찾기를 통해 주소를 입력해주세요.</small>
                                            <div class="invalid-feedback">
                                                우편번호 찾기를 통해 주소를 입력해주세요.
                                            </div>
                                            <div id="div_err_display_addr1" style="display: none"></div>
                                        </div>
                                        <div class="col-12 mt-3">
                                            <label for="addr2" class="small ifta-label">주소2</label>
                                            <!--<span class="text-muted">(선택사항)</span>-->
                                            <input type="text" class="ifta-field mb-0" name="addr2" id="addr2" placeholder="" value="${dto.addr2}"
                                                   required>
                                            <small class="text-muted">상세 주소를 입력해주세요.</small>
                                            <div class="invalid-feedback">
                                                주소를 작성해주세요.
                                            </div>
                                        </div>
                                            <hr class="my-2">
                                            <div class="col-12 mt-3">
                                                <p>평생회원 선택</p>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="forever_yn"
                                                           id="optionsRadios1" value="Y">
                                                    <label class="form-check-label" for="optionsRadios1">동의함</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="forever_yn"
                                                           id="optionsRadios2" value="N" checked>
                                                    <label class="form-check-label" for="optionsRadios2">동의 안함</label>
                                                </div>
                                                <br>
                                                <small>평생회원으로 가입하시면 천재교과서 회원 탈퇴시까지는 휴면회원으로 전환되지 않으며, 고객님의 개인정보가 탈퇴시까지
                                                    안전하게 보관됩니다.</small>
                                            </div>
                                            <hr class="my-2">
                                            <div class="col-12 mt-3 justify-content-between">
                                                <p class="form-check form-check-inline"><strong>[필수] 이용약관 동의</strong>
                                                </p>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="optionsCheck"
                                                           id="valueOptions1" value="Y" required >
                                                    <label class="form-check-label" for="optionsRadios1">동의함</label>
                                                </div>
                                            </div>
                                            <div>
                                                <label for="firstOp" class="form-label mt-4"></label>
                                                <textarea name="firstOp" id="firstOp" class="col-12 form-control mb-2"
                                                          cols="10" rows="12" style="font-size:1rem; overflow-y: scroll; resize:none;"
                                                          readonly>제1조(목적)
이 약관은 (주)천재교과서 회사(전자상거래 사업자)가 운영하는 (주)천재교과서 쇼핑몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.
※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

제2조(정의)
① “몰”이란 (주)천재교과서 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정)
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 (주)천재교과서 쇼핑몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경)
① “몰”은 다음과 같은 업무를 수행합니다.
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 “몰”이 정하는 업무
② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단)
① “몰”은 컴퓨터 등 정보통신설비의 보수점검.교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.

제6조(회원가입)
① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.
④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.

제7조(회원 탈퇴 및 자격 상실 등)
① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.
② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
1. 가입 신청 시에 허위 내용을 등록한 경우
2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
③ “몰”이 회원 자격을 제한.정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.
④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제8조(회원에 대한 통지)
① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.

제9조(구매신청)
① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
1. 재화 등의 검색 및 선택
2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
3. 약관내용, 청약철회권이 제한되는 서비스, 배송료.설치비 등의 비용부담과 관련한 내용에 대한 확인
4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
6. 결제방법의 선택
② “몰”이 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유·이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 처리위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.

제10조 (계약의 성립)
① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우
② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.

제11조(지급방법)
“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체
2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3. 온라인무통장입금
4. 전자화폐에 의한 결제
5. 수령 시 대금지급
6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제
8. 기타 전자적 지급 방법에 의한 대금 지급 등

제12조(수신확인통지.구매신청 변경 및 취소)
① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.

제13조(재화 등의 공급)
① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의.과실이 없음을 입증한 경우에는 그러하지 아니합니다.

제14조(환급)
“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.

제15조(청약철회 등)
① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.
② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

제16조(청약철회 등의 효과)
① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.
② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.
④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.

제17조(개인정보보호)
① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.
② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.
③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.
④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.

제18조(“몰“의 의무)
① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화.용역을 제공하는데 최선을 다하여야 합니다.
② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
③ “몰”이 상품이나 용역에 대하여 「표시.광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시.광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제19조(회원의 ID 및 비밀번호에 대한 의무)
① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.

제20조(이용자의 의무)
이용자는 다음 행위를 하여서는 안 됩니다.
1. 신청 또는 변경시 허위 내용의 등록
2. 타인의 정보 도용
3. “몰”에 게시된 정보의 변경
4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위

제21조(연결“몰”과 피연결“몰” 간의 관계)
① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.
② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.

제22조(저작권의 귀속 및 이용제한)
① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.
② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.

제23조(분쟁해결)
① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치.운영합니다.
② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.

제24조(재판권 및 준거법)
① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
부 칙(시행일) 이 약관은 2020년 7월 15일부터 시행합니다. 부 칙(시행일) 이 약관은 2020년 7월 15일부터 시행합니다.
                                                </textarea>
                                            </div>
                                            <hr class="my-2">

                                            <div class="col-12 mt-3 justify-content-between">
                                                <p class="form-check form-check-inline "><strong>[필수] 이용약관 동의</strong>
                                                </p>
                                                <div class="form-check form-check-inline col-6">
                                                    <input class="form-check-input" type="checkbox" name="optionsCheck"
                                                           id="secOp" value="secOp" required>
                                                    <label class="form-check-label" for="optionsRadios1">동의함</label>
                                                </div>

                                            </div>
                                            <div>
                                                <label for="firstEx2" class="form-label mt-4"></label>
                                                <textarea name="firstEx" id="firstEx2" class="col-12 form-control mb-2"
                                                          cols="10" rows="12" style="font-size:1rem; overflow-y: scroll; resize:none;"
                                                          readonly>1. 처리하는 개인정보 항목 및 처리 목적
1) 회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 『개인정보 보호법』 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정 입니다. 또한 본질적인 서비스 제공을 위한 『필수동의』와 고객 각각의 기호와 필요에 맞는 서비스를 제공하기 위한 『선택동의』로 구분되어 다음의 정보를 처리하고 있으며, 『선택동의』를 하지 않은 경우에도 서비스 이용 제한은 없습니다.
구분  개인정보 항목 처리 목적
회원가입    [필수] 아이디, 비밀번호, 이름, 휴대전화, 이메일
[선택] 주소, 일반 전화번호    - 이용자의 식별 및 회원서비스 제공
- 서비스 이용, 주문 및 거래정보에 대한 공지 및 상담
- 마케팅 활용 및 광고성 정보 전달
- 서비스 이용 내역 분석
SNS 계정 가입   [필수 – 네이버] 이름, 이메일주소, 휴대폰번호
[필수 – 카카오] 카카오계정 이메일, 프로필정보(닉네임)    - 이용자의 식별 및 회원서비스 제공
- 서비스 이용, 주문 및 거래정보에 대한 공지 및 상담
- 마케팅 활용 및 광고성 정보 전달
- 서비스 이용 내역 분석
회원, 비회원 구매 시    [필수 – 수취인정보] 수취인명, 주소, 휴대폰번호, 이메일주소
[필수 – 계좌이체] 예금주명    - 구매물품 배송, 고객과 체결한 계약의 이행
- 민원사항의 상담 및 처리
비회원 구매 시    [필수] 주문자명, 주문조회 비밀번호    비회원 주문 내역 조회 시 본인확인
현금영수증 신청 시  [필수] 개인 휴대폰번호   현금영수증 발급
고객만족센터 1:1 문의   [필수] 작성자 이름, 상담내용, 비밀번호(비밀글 작성 시)   고객상담, 상담 처리, 진행사항 및 결과 통보
자동생성정보  IP주소, 쿠키, 접속일시, 기타 서비스 이용기록 서비스 이용기록 및 통계분석

 2) 회사는 다음과 같은 방법으로 개인정보를 수집할 수 있으며 개인식별이 가능한 개인정보를 수집하는 경우에는 고객으로부터 동의를 받습니다. 고객이 동의 버튼을 클릭하거나, 내 정보 수정 등을 통해 추가로 수집하는 개인정보를 기재한 후 저장할 경우 개인정보 수집에 동의한 것으로 봅니다.
 ① 홈페이지, 모바일앱, 서면, 팩스, 전화, 고객센터 문의하기, 이벤트 응모
 ② 서비스 이용 과정에서 자동으로 생성되는 정보
수집 및 이용 목적  수집항목    보유기간
서비스 이용기록 및 통계분석, 부정이용 방지, 개인정보 침해사고 대비  IP주소, 쿠키, 접속 일시, 서비스 이용기록   회원탈퇴 시 또는 법정 의무 보관기간
(쿠키는 브라우저 종료 시 또는 로그아웃 시 만료)

3) 회사는 통계 작성, 과학적 연구, 공익적 기록보존 등을 위하여 개인정보를 가명처리하여 활용할 수 있습니다.


2. 개인정보의 처리 및 보유기간

1) 회사는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유 합니다. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
개인정보 유형 보유목적    관련 근거   보유기간
회원정보    이용자 식별 및 서비스 제공, 서비스 이용에 대한 공지 및 상담 정보주체 동의 탈퇴 후 지체없이 파기
서비스 이용 및 상담, 소비자 불만, 분쟁처리에 관한 기록    전자상거래 등에서의 소비자보호에 관한 법률 3년
결제정보
(회원, 비회원)   주문 상품의 결제 및 환불, 배송  정보주체 동의 법정 의무 보관기간
계약 또는 청약 철회에 관한 기록  전자상거래 등에서의 소비자보호에 관한 법률 5년
기타 서비스  부정 이용자 식별   통신비밀보호법 3개월
현금영수증 발급, 제세공과금 처리  소득세법    5년

2) 다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시 까지 처리 및 보유합니다.
① 이용요금의 정산, 소송이나 분쟁 등 기타 필요한 경우
② 관계 법령의 규정에 의하여 보존할 필요가 있는 경우
관련법령    보유항목    보유기간
전자상거래 등에서의 소비자 보호에 관한 법률 및 동법 시행령   계약 또는 청약 철회에 관한 기록  5년
대금결제 및 재화 등의 공급에 관한 기록  5년
소비자의 불만 또는 분쟁처리에 관한 기록  3년
표시∙광고에 관한 기록    6개월
통신비밀보호법 및 동법 시행령    인터넷 로그기록, 접속지 추적자료  3개월
※ 개인정보 유효기간제에 따라 1년(고객이 별도로 요청한 경우 그 기간) 동안 서비스를 이용하지 않은 회원의 개인정보는 별도 분리하여 안전하게 관리 됩니다. 단, 회원가입 시 “평생회원” 가입에 동의한 회원정보는 개인정보 유효기간제에 적용되지 않고 회원 탈퇴 시까지 파기되지 않습니다.

                                                </textarea>
                                            </div>
                                            <hr class="my-2">
                                            <div class="col-12 mt-3 justify-content-between">
                                                <p class="form-check form-check-inline"><strong>[선택] 이용약관 동의</strong>
                                                </p>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" name="option"
                                                           id="option" value="${dto.option}" <c:if test="${not empty dto.option && dto.option eq 'Y'}">checked</c:if>>
                                                    <label class="form-check-label" for="option">동의함</label>
                                                </div>
                                                <div id="div_err_display_option" style="display: none"></div>
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
                                    <div id="div_err"></div>
                                    <button class="w-100 btn btn-primary btn-lg mt-3" type="submit">가입하기</button>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/form-validation.js"></script>
<%--<script src="/resources/js/jquery-3.3.1.min.js"></script>--%>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/main.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v55bfa2fee65d44688e90c00735ed189a1713218998793"
        integrity="sha512-FIKRFRxgD20moAo96hkZQy/5QojZDAbyx0mQ17jEGHCJc/vi0G2HXLtofwD7Q3NmivvP9at5EVgbRqOaOQb+Rg=="
        data-cf-beacon='{"rayId":"879d448bbc1a29e5","version":"2024.4.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
        crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.4.1.min.js"--%>
<%--        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"--%>
<%--        crossorigin="anonymous"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

<script>
    function addr() {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("addr1").value = data.roadAddress;
            }
        }).open();
    }
</script>


<%--<script src="/resources/js/bootstrap.bundle.min.js"></script>--%>

<%--<script src="/resources/js/form-validation.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"--%>
<%--        crossorigin="anonymous"></script>--%>
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
-->
<script>
    let member_id = document.getElementById("member_id");
    let pwd1 = document.getElementById("pwd");
    let pwd2 = document.getElementById("pwd2");
    let optBtn = document.getElementById("option")
    let p1 = document.getElementById("phone_num1");
    let p2 = document.getElementById("phone_num2");
    let p3 = document.getElementById("phone_num3");
    let idCk = document.getElementById("idCk");

    const idcheck = /^[a-z0-9_]{4,20}$/;
    const pwdCheck = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[@#$%^&~!]).*$/;
    //validator 체크
    member_id.addEventListener("input", (e) => {
        if (!(idcheck).test(member_id.value)) {
            e.preventDefault();
            e.stopPropagation();
            document.getElementById("feedbackId").style.display = "block";
            document.getElementById("feedbackId").innerText = "규칙에 맞는 아이디를 입력해주세요."
        }
        if (member_id.value.length < 1 || (idcheck).test(member_id.value)) {
            document.getElementById("feedbackId").style.display = "none";
        }
    })
    pwd1.addEventListener("input", (e) => {
        if (!(pwdCheck).test(pwd1.value)) {
            e.preventDefault();
            e.stopPropagation();
            document.getElementById("feedbackPwd").style.display = "block";
            document.getElementById("feedbackPwd").innerText = "규칙에 맞는 비밀번호를 입력해주세요."
        }
        if (pwd1.value.length < 1 || (pwdCheck).test(pwd1.value)) {
            document.getElementById("feedbackPwd").style.display = "none";
        }
    })
    // 비밀번호 동일 체크
    pwd1.addEventListener("input", (e) => {
        if (pwd1.value == pwd2.value) {
            document.getElementById("pwdck").style.display = "none";
        }
    });
    pwd2.addEventListener("input", (e) => {
        console.log("chang2")
        if (pwd1.value != pwd2.value) {
            document.getElementById("pwdck").style = "display:block;width:100%;margin-top:.25rem;font-size:.875em;color:#dc3545";
            console.log("chang2222")
        }
        if (pwd2.value === "" || pwd1.value == pwd2.value) {
            document.getElementById("pwdck").style.display = "none";
        }
    });
    // 옵션 선택 여부 체크
    optBtn.addEventListener("click", (e) => {
        if (optBtn.value == "N") {
            optBtn.value = "Y"
            console.log(optBtn.value);
        } else {
            optBtn.value = 'N';
            console.log(optBtn.value);
        }
    });
    // 전화번호 다음 칸 이동
    p1.addEventListener("input", () => {
        if (p1.value.length === 3) {
            p2.focus();
        }
    });
    p2.addEventListener("input", () => {
        if (p2.value.length === 4) {
            p3.focus();
        }
    });
    const serverValidResult = {};
    <c:forEach items="${errors}" var="err">
    if (document.getElementById("div_err_${err.getField()}") != null) {
        document.getElementById("div_err_${err.getField()}").innerHTML = "<div style='width:100%;margin-bottom:.25rem;font-size:.875em;color:#dc3545'>${err.getField()}필드는 공백일 수 없습니다.</div>";
        document.getElementById("div_err_${err.getField()}").style.display = "block";
    }
    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>
    console.log(serverValidResult);


    function idbtnChek() {
        let id = $('#member_id').val();
        $.ajax({
            url:'/member/idCheck',
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

    // member_id.addEventListener("input" ,(e)=>{
    //     let id = $('#member_id').val();
    //     $.ajax({
    //         url:'/member/idCheck',
    //         type:'post',
    //         data:{id : id},
    //         success:function(cnt){
    //             if(cnt == 0){
    //                 $('.idCk1').css("dispaly","none");
    //                 $('.idCk2').css("display","block");
    //
    //             } else {
    //                 $('.idCk2').css("dispaly","none");
    //                 $('.idCk1').css("display","block");
    //                 $('#member_id').val('');
    //             }
    //         },
    //         error:function(){
    //             alert("에러입니다");
    //         }
    //     });
    // });
</script>


</body>
</html>


