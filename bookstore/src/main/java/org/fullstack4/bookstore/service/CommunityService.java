package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.FaqVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.*;

import java.util.List;

public interface CommunityService {

    // 공지사항
    List<NoticeDTO> noticeList();
    NoticeDTO noticeView(int notice_idx);

    // FAQ
    PageResponseDTO<FaqDTO> faqList(PageRequestDTO pageRequestDTO);
    int faqTotalCount(PageRequestDTO requestDTO);
    FaqDTO faqView(int faq_idx);

    // QnA
    List<QnaDTO> qnaList();
    QnaDTO qnaView(int qna_idx);
}
