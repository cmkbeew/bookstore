package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.dto.*;

import java.util.List;

public interface AdminService {

//    // 게시글 총 갯수
//    int noticeTotalCount(PageRequestDTO pageRequestDTO);
//    int faqTotalCount(PageRequestDTO pageRequestDTO);

    // 공지사항
    List<NoticeDTO> noticeList();
    NoticeDTO noticeView(int idx);
<<<<<<< HEAD
=======
//    NoticeDTO2 prevNotice(int idx);
>>>>>>> yh

    // FAQ
    List<FaqDTO> faqList();
    FaqDTO faqView(int idx);

    // QnA
    List<QnaDTO> qnaList();
    QnaDTO qnaView(int idx);
<<<<<<< HEAD
=======

    // 회원
    List<MemberDTO> memberList();


    // 도서


    // 배송
    List<DeliveryDTO> deliveryList();
    DeliveryDTO deliveryView(int idx);
}
