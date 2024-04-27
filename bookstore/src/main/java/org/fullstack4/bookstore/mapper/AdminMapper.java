package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.PageRequestDTO;

import java.util.List;
import java.util.Map;

public interface AdminMapper {

//    // 게시글 총 갯수
//    int noticeTotalCount(PageRequestDTO pageRequestDTO);
//    int faqTotalCount(PageRequestDTO pageRequestDTO);

    // 공지사항
    List<NoticeVO2> noticeList();
    NoticeVO2 noticeView(int idx);
//    NoticeVO2 prevNotice(int idx);



    // FAQ
    List<FaqVO2> faqList();
    FaqVO2 faqView(int idx);

    // QnA
    List<QnaVO2> qnaList();
    QnaVO2 qnaView(int idx);

    // 회원

    // 도서

    // 배송
}
