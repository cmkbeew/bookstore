package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.NoticeDTO;

import java.util.List;
import java.util.Map;

public interface AdminMapper {
    // 공지사항
    List<NoticeVO2> noticeList();
    NoticeVO2 noticeView(int idx);

    // FAQ
    List<FaqVO2> faqList();
    FaqVO2 faqView(int idx);

    // QnA
    List<QnaVO2> qnaList();
    QnaVO2 qnaView(int idx);

}
