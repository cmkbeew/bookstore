package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.*;

import java.util.List;
import java.util.Map;

public interface AdminMapper {

//    // 게시글 총 갯수
//    int noticeTotalCount(PageRequestDTO pageRequestDTO);
//    int faqTotalCount(PageRequestDTO pageRequestDTO);

    // 공지사항
    List<NoticeVO> noticeList();
    NoticeVO noticeView(int idx);
//    NoticeVO2 prevNotice(int idx);


    // FAQ
    List<FaqVO> faqList();
    FaqVO faqView(int idx);

    // QnA
    List<QnaVO> qnaList();
    QnaVO qnaView(int idx);

    // 회원
    List<MemberVO> memberList();

    // 도서

    // 배송
    List<DeliveryVO> deliveryList();
    DeliveryVO deliveryView(int pay_idx);
}
