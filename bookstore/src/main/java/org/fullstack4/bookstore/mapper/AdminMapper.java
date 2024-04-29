package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.PageRequestDTO;

import java.util.List;
import java.util.Map;

public interface AdminMapper {
    // 페이징
    int noticeTotalCount(PageRequestDTO pageRequestDTO);
    int faqTotalCount(PageRequestDTO pageRequestDTO);
    int qnaTotalCount(PageRequestDTO pageRequestDTO);
    List<NoticeVO> noticeListByPage(PageRequestDTO pageRequestDTO);
    List<FaqVO> faqListByPage(PageRequestDTO pageRequestDTO);
    List<QnaVO> qnaListByPage(PageRequestDTO pageRequestDTO);

    // 공지사항
    List<NoticeVO> noticeList();
    NoticeVO noticeView(int idx);
    int noticeRegist(NoticeVO noticeVO);
    int noticeDelete(int idx);
    int noticeFix(int idx);


    // FAQ
    List<FaqVO> faqList();
    FaqVO faqView(int idx);

    // QnA
    List<QnaVO> qnaList();
    QnaVO qnaView(int idx);

    // 회원
    List<MemberVO> memberList();

    // 도서
    List<ProductVO> productList();

    // 배송
    List<DeliveryVO> deliveryList();
    DeliveryVO deliveryView(int pay_idx);
    int deliveryModify(DeliveryVO deliveryVO);
}
