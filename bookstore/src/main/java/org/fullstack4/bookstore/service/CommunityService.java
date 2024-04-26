package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.FaqVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.FaqDTO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.dto.QnaDTO;

import java.util.List;

public interface CommunityService {

    // 공지사항
    List<NoticeDTO> noticeList();
    NoticeDTO noticeView(int notice_idx);

    // FAQ
    List<FaqDTO> faqList();
    FaqDTO faqView(int faq_idx);

    // QnA
    List<QnaDTO> qnaList();
    QnaDTO qnaView(int qna_idx);
}
