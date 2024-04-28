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
<<<<<<< HEAD
    List<NoticeVO2> noticeList();
    NoticeVO2 noticeView(int idx);
//    NoticeVO2 prevNotice(int idx);


=======
    List<NoticeVO> noticeList();
    NoticeVO noticeView(int idx);
>>>>>>> hk

    // FAQ
    List<FaqVO> faqList();
    FaqVO faqView(int idx);

    // QnA
    List<QnaVO> qnaList();
    QnaVO qnaView(int idx);

    // 회원

    // 도서

    // 배송
}
