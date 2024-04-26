package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.FaqVO;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.domain.QnaVO;

import java.util.List;

public interface CommunityMapper {

    // 공지사항
    List<NoticeVO> noticeList();
    NoticeVO noticeView(int notice_idx);

    // FAQ
    List<FaqVO> faqList();
    FaqVO faqView(int faq_idx);

    // QnA
    List<QnaVO> qnaList();
    QnaVO qnaView(int qna_idx);
}
