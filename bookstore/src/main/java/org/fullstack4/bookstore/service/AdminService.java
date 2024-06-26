package org.fullstack4.bookstore.service;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.*;

import java.util.ArrayList;
import java.util.List;

public interface AdminService {
    // 페이징
    int noticeTotalCount(PageRequestDTO pageRequestDTO);
    int faqTotalCount(PageRequestDTO pageRequestDTO);
    int qnaTotalCount(PageRequestDTO pageRequestDTO);
    int memberTotalCount(PageRequestDTO pageRequestDTO);
    PageResponseDTO<NoticeDTO> noticeListByPage(PageRequestDTO pageRequestDTO);
    PageResponseDTO<FaqDTO> faqListByPage(PageRequestDTO pageRequestDTO);
    PageResponseDTO<QnaDTO> qnaListByPage(PageRequestDTO pageRequestDTO);
    PageResponseDTO<MemberDTO> memberListByPage(PageRequestDTO pageRequestDTO);


    // 공지사항
    List<NoticeDTO> noticeList();
    NoticeDTO noticeView(int idx);
    int noticeRegist(NoticeDTO noticeDTO);
    int noticeModify(NoticeDTO noticeDTO);
    int noticeDelete(int idx);
//    int noticeListDelete(String[] idxArr);
    int noticeFix(int idx);


    // FAQ
    List<FaqDTO> faqList();
    FaqDTO faqView(int idx);
    int faqRegist(FaqDTO faqDTO);
    int faqModify(FaqDTO faqDTO);
    int faqDelete(int idx);

    // QnA
    List<QnaDTO> qnaList();
    QnaDTO qnaView(int idx);

    int qnaDelete(int idx);
    int qnaReplyRegist(QnaDTO qnaDTO);
    int qnaReplyModify(QnaDTO qnaDTO);

    int qnaReplyTotalCount(QnaDTO qnaDTO);

    // 회원
    List<MemberDTO> memberList();


    // 도서
    List<ProductDTO> productList();

    // 배송
    int deliveryUpdateState(ArrayList<Integer> order_idx, String delivery_state);
}
