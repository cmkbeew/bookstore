package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.dto.*;

import java.util.List;

public interface AdminService {
    // 공지사항
    List<NoticeDTO2> noticeList();
    NoticeDTO2 noticeView(int idx);

    // FAQ
    List<FaqDTO2> faqList();
    FaqDTO2 faqView(int idx);

    // QnA
    List<QnaDTO2> qnaList();
    QnaDTO2 qnaView(int idx);
}
