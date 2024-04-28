package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.FaqVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.*;

import java.util.List;
import java.util.Map;

public interface CommunityService {

    // 공지사항
    PageResponseDTO<NoticeDTO> noticeList(PageRequestDTO pageRequestDTO);
    int noticeTotalCount(PageRequestDTO pageRequestDTO);
    NoticeDTO noticeView(int notice_idx);

    // FAQ
    PageResponseDTO<FaqDTO> faqList(PageRequestDTO pageRequestDTO);
    int faqTotalCount(PageRequestDTO requestDTO);
//    FaqDTO faqView(int faq_idx);
    Map<String, FaqDTO> faqView(int faq_idx);

    // QnA
    PageResponseDTO<QnaDTO> qnaList(PageRequestDTO pageRequestDTO);
    int qnaTotalCount(PageRequestDTO requestDTO);
    QnaDTO qnaView(int qna_idx);
    int qnaRegist(QnaDTO qnaDTO);

}
