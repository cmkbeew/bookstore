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

    <title>admin >> community</title>

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
<body style="background-color: #eeeeee; padding-bottom: 0px;">
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
            <form id="frmSearch" name="frmSearch" method="get" action="/admin/list">
                <input type="hidden" name="type" value="${communityList.type}"/>
                <div class="d-flex justify-content-center align-items-center">
                    <div class="mx-2 my-3">
                        <select class="form-select form-select-lg" name="search_date" id="search_date">
                            <option value="all">전체</option>
                            <option value="day" <c:if test="${communityList.search_date == 'day'}">selected</c:if>>하루</option>
                            <option value="week" <c:if test="${communityList.search_date == 'week'}">selected</c:if>>일주일</option>
                            <option value="month"<c:if test="${communityList.search_date == 'month'}">selected</c:if>>한달</option>
                        </select>
                    </div>
                    <div class="mx-2 my-3">
                        <select class="form-select form-select-lg" name="search_type" id="search_type">
                            <option value="">전체</option>
                            <option value="title" <c:if test="${communityList.search_type == 'title'}">selected</c:if>>제목</option>
                            <option value="writer"<c:if test="${communityList.search_type == 'writer'}">selected</c:if>>작성자</option>
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
                    <form name="deleteFrm" id="deleteFrm" method="post" action="/admin/delete">
                        <input type="hidden" name="type" value="${communityList.type}"/>
                        <h5>총 <span class="text-primary">${communityList.total_count}</span>개</h5>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title mb-0 text-center">${bbsTitle}</h5>
                            </div>
                            <div class="table-responsive px-1 pb-4">
                                <table class="table no-wrap user-table mb-0 table-hover px-1 pb-4">
                                    <thead>
                                    <tr class="table-light">
                                        <th scope="col" class="border-0 text-uppercase font-medium pl-4" style="vertical-align: middle;">
                                            <label class="control control--checkbox">
                                                <input type="checkbox" name="selectAll" id="selectAll" value="">
                                                <div class="control__indicator"></div>
                                            </label>
                                        </th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">제목</th>
                                        <c:if test="${communityList.type == 'notice'}">
                                            <th scope="col" class="border-0 text-uppercase font-medium">첨부파일명</th>
                                        </c:if>
                                        <th scope="col" class="border-0 text-uppercase font-medium">작성자</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">작성일</th>
                                        <c:if test="${communityList.type == 'qna'}">
                                            <th scope="col" class="border-0 text-uppercase font-medium">조회수</th>
                                        </c:if>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${!empty communityList && communityList.total_count > 0}">
                                            <c:forEach items="${communityList.dtoList}" var="list">
                                                <tr>
                                                    <td class="pl-4" style="width: 80px;">
                                                        <label class="control control--checkbox">
                                                            <input type="checkbox" name="select" class="selectOne" id="select${list.idx}" value="${list.idx}">
                                                            <div class="control__indicator"></div>
                                                        </label>
                                                    </td>
                                                    <td style="max-width: 300px;">
                                                        <a href="/admin/${communityList.type}/view?idx=${list.idx}" style="max-width: 100%; display: block; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
                                                            <c:if test="${communityList.type == 'notice'}">
                                                                <c:choose>
                                                                    <c:when test="${list.fix_state < 0}">
                                                                        <span style="font-weight: bold">${list.title}</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span>${list.title}</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <c:if test="${list.org_file_name != null && list.org_file_name != ''}">
                                                                    <span class="material-symbols-outlined web_font">attach_file</span>
                                                                </c:if>
                                                            </c:if>

                                                            <c:if test="${communityList.type == 'faq'}">
                                                                <span>${list.title}</span>
                                                            </c:if>
                                                            <c:if test="${communityList.type == 'qna'}">
                                                                <span>
                                                                    <c:if test="${list.ref < list.idx}">
                                                                        <span class="material-symbols-outlined">prompt_suggestion</span>
                                                                    </c:if>
                                                                    ${list.title}
                                                                </span>
                                                            </c:if>
                                                        </a>
                                                    </td>
                                                    <c:if test="${communityList.type == 'notice'}">
                                                        <td>
                                                            <a href="/admin/${communityList.type}/view?idx=${list.idx}">
                                                            <c:out value="${!empty list.org_file_name ? list.org_file_name : '첨부파일 없음'}" />
                                                            </a>
                                                        </td>
                                                    </c:if>
                                                    <td><a href="/admin/${communityList.type}/view?idx=${list.idx}">${list.writer}</a></td>
                                                    <td><a href="/admin/${communityList.type}/view?idx=${list.idx}">${list.reg_date}</a></td>
                                                    <c:if test="${communityList.type == 'qna'}">
                                                        <td style="width: 100px;"><a href="/admin/${communityList.type}/view?idx=${list.idx}">${list.read_cnt}</a></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td class="text-center" colspan="5">해당하는 게시글이 없습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div style="display: flex; justify-content: space-between; margin-top: 4px;">
                            <div>
                                <button type="submit" id="deleteBtn" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="goDelete()">
                                    <span class="material-symbols-outlined">delete</span>
                                </button>
                                <c:if test="${communityList.type == 'notice'}">
                                    <button id="fixBtn" type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2">
                                        <span class="material-symbols-outlined">keep</span>
                                    </button>
                                </c:if>
                                <c:if test="${communityList.type != 'qna'}">
                                    <button type="button" class="btn btn-primary btn-circle btn-lg btn-circle ml-2" onclick="location.href='/admin/${communityList.type}/regist'">
                                        <span class="material-symbols-outlined">edit</span>
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </form>
                    <nav aria-label="Page navigation example pagination">
                        <ul class="pagination justify-content-center">
                            <li class="page-item
                            <c:if test="${communityList.prev_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${communityList.prev_page_flag}">${communityList.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${communityList.prev_page_flag}">${communityList.linkParams}&page=${communityList.page_block_start-1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="${communityList.page_block_start}" end="${communityList.page_block_end}" var="page_num">
                                <li class="page-item<c:if test="${communityList.page == page_num}"> active</c:if> ">
                                    <a class="page-link" data-num="${page_num}"
                                       href="<c:choose><c:when test="${communityList.page == page_num}">#</c:when><c:otherwise>${communityList.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item
                            <c:if test="${communityList.next_page_flag ne true}"> disabled</c:if>">
                                <a class="page-link"
                                   data-num="<c:choose><c:when test="${communityList.next_page_flag}">${communityList.page_block_end+1}</c:when><c:otherwise>${communityList.page_block_end}</c:otherwise></c:choose>"
                                   href="<c:choose><c:when test="${communityList.next_page_flag}">${communityList.linkParams}&page=${communityList.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>" aria-label="Next">
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
            // console.log(idx.includes(e.target.parentNode.children[0].value));
            //
            // if (selectOneDOMList[i].checked && idx.includes(e.target.parentNode.children[0].value)) {
            //     idx.pop()
            // }

            if (selectOneDOMList[i].checked) {
                idx.push(e.target.parentNode.children[0].value);
            }
            console.log(idx);

            //
            //     if (idx.includes(e.target.parentNode.children[0].value)) {
            //         idx.pop()
            //     } else {
            //         idx.push(e.target.parentNode.children[0].value);
            //     }
            // }

            // //체크박스 삭제
            // String[] arrIdx = idxList.split(",");
            // Integer[] newArr = Stream.of(arrIdx).mapToInt(Integer::parseInt).boxed().toArray(Integer[]::new);
            // qnaServiceIf.deleteQnaCommu(newArr);
            //
            // log.info("idxList : " + idxList);
            // return "sdf";

        }, false)
    }


    fixBtn.addEventListener("click", function (e) {
        console.log(idx.length);
        let linkParam = idx[0];

        for (let i = 1; i < idx.length; i++) {
            linkParam += '+' + idx[i]
        }

        location.href = "/admin/notice/fix?idx=" + linkParam;

    }, false)

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
