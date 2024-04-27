package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.NoticeVO2;
import org.fullstack4.bookstore.dto.*;

import java.util.List;

public interface AdminService {

//    // 게시글 총 갯수
//    int noticeTotalCount(PageRequestDTO pageRequestDTO);
//    int faqTotalCount(PageRequestDTO pageRequestDTO);

    // 공지사항
    List<NoticeDTO2> noticeList();
    NoticeDTO2 noticeView(int idx);
//    NoticeDTO2 prevNotice(int idx);

    // FAQ
    List<FaqDTO2> faqList();
    FaqDTO2 faqView(int idx);

    // QnA
    List<QnaDTO2> qnaList();
    QnaDTO2 qnaView(int idx);
}
