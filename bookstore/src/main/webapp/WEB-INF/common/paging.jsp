<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<body>
<nav aria-label="Page navigation example">
    <ul class="pagination" style="justify-content: center">
        <li class="page-item <c:if test="${list.prev_page_flag ne true}">disabled</c:if> ">
            <a class="page-link"
               href="<c:choose>
                            <c:when test="${list.prev_page_flag}">
                                ${list.linkParams}&page=${list.page_block_start - 1}
                            </c:when>
                            <c:otherwise>
                                ${list.linkParams}&page=1
                            </c:otherwise>
                        </c:choose>"
               aria-label="Previous"
               data-num="<c:choose>
                                <c:when test="${list.prev_page_flag}">
                                    ${list.page_block_start - 1}
                                </c:when>
                                <c:otherwise>
                                    1
                                </c:otherwise>
                            </c:choose>"
            >
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>

        <c:forEach begin="${list.page_block_start}" end="${list.page_block_end}" var="page_num">
            <li class="page-item <c:if test="${list.page == page_num}">active</c:if>" >
                <a class="page-link" data-num="${page_num}"
                   href="<c:choose>
                                <c:when test="${list.page == page_num}">#</c:when>
                                <c:otherwise>
                                    ${list.linkParams}&page=${page_num}
                                </c:otherwise>
                            </c:choose>">
                        ${page_num}
                </a>
            </li>
        </c:forEach>

        <li class="page-item <c:if test="${list.next_page_flag ne true}">disabled</c:if>" >
            <a class="page-link"
               href="<c:choose>
                            <c:when test="${list.next_page_flag}">
                                ${list.linkParams}&page=${list.page_block_end + 1}
                            </c:when>
                            <c:otherwise>
                                ${list.page_block_end}
                            </c:otherwise>
                        </c:choose>"
               aria-label="Next"
               data-num="<c:choose>
                                 <c:when test="${list.next_page_flag}">
                                    ${list.page_block_end + 1}
                                 </c:when>
                                 <c:otherwise>
                                    ${list.page_block_end}
                                 </c:otherwise>
                             </c:choose>">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>
</body>
</html>
