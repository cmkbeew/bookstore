package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.dto.*;

import java.util.List;

public interface AdminService {
    // 공지사항
    List<NoticeDTO> noticeList();
    NoticeDTO noticeView(int idx);

    // FAQ
    List<FaqDTO> faqList();
    FaqDTO faqView(int idx);

    // QnA
    List<QnaDTO> qnaList();
    QnaDTO qnaView(int idx);
}
