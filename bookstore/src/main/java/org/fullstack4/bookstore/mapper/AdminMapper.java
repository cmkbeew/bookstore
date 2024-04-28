package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.NoticeDTO;

import java.util.List;
import java.util.Map;

public interface AdminMapper {
    // 공지사항
    List<NoticeVO> noticeList();
    NoticeVO noticeView(int idx);

    // FAQ
    List<FaqVO> faqList();
    FaqVO faqView(int idx);

    // QnA
    List<QnaVO> qnaList();
    QnaVO qnaView(int idx);

}
