package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.*;

import java.util.List;

public interface AdminService {
    // 페이징
    int noticeTotalCount(PageRequestDTO pageRequestDTO);
    int faqTotalCount(PageRequestDTO pageRequestDTO);
    int qnaTotalCount(PageRequestDTO pageRequestDTO);
    PageResponseDTO<NoticeDTO> noticeListByPage(PageRequestDTO pageRequestDTO);
    PageResponseDTO<FaqDTO> faqListByPage(PageRequestDTO pageRequestDTO);
    PageResponseDTO<QnaDTO> qnaListByPage(PageRequestDTO pageRequestDTO);


    // 공지사항
    List<NoticeDTO> noticeList();
    NoticeDTO noticeView(int idx);
    int noticeRegist(NoticeDTO noticeDTO);


    // FAQ
    List<FaqDTO> faqList();
    FaqDTO faqView(int idx);

    // QnA
    List<QnaDTO> qnaList();
    QnaDTO qnaView(int idx);

    // 회원
    List<MemberDTO> memberList();


    // 도서
    List<ProductDTO> productList();

    // 배송
    List<DeliveryDTO> deliveryList();
    DeliveryDTO deliveryView(int pay_idx);

    int deliveryModify(DeliveryDTO deliveryDTO);



}
