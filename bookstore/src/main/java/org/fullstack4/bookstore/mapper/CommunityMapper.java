package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.FaqVO;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.PageRequestDTO;

import java.util.List;

public interface CommunityMapper {

    // 공지사항
    List<NoticeVO> noticeList(PageRequestDTO pageRequestDTO);
    int noticeTotalCount(PageRequestDTO pageRequestDTO);
    NoticeVO noticeView(int notice_idx);

    // FAQ
    List<FaqVO> faqList(PageRequestDTO pageRequestDTO);
    int faqTotalCount(PageRequestDTO requestDTO);
    FaqVO faqView(int faq_idx);
    FaqVO faqPrev(int faq_idx);
    FaqVO faqNext(int faq_idx);

    // QnA
    List<QnaVO> qnaList(PageRequestDTO pageRequestDTO);
    int qnaTotalCount(PageRequestDTO requestDTO);
    QnaVO qnaView(int qna_idx);
    int qnaRegist(QnaVO qnaVO);

}
