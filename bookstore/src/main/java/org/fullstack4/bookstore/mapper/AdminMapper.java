package org.fullstack4.bookstore.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.PageRequestDTO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface AdminMapper {
    // 페이징
    int noticeTotalCount(PageRequestDTO pageRequestDTO);
    int faqTotalCount(PageRequestDTO pageRequestDTO);
    int qnaTotalCount(PageRequestDTO pageRequestDTO);
    int memberTotalCount(PageRequestDTO pageRequestDTO);
    List<NoticeVO> noticeListByPage(PageRequestDTO pageRequestDTO);
    List<FaqVO> faqListByPage(PageRequestDTO pageRequestDTO);
    List<QnaVO> qnaListByPage(PageRequestDTO pageRequestDTO);
    List<MemberVO> memberListByPage(PageRequestDTO pageRequestDTO);



    // 공지사항
    List<NoticeVO> noticeList();
    NoticeVO noticeView(int idx);
    int noticeRegist(NoticeVO noticeVO);
    int noticeModify(NoticeVO noticeVO);
    int noticeDelete(int idx);
//    int noticeListDelete(Integer[] idxArr);
    int noticeFix(int idx);


    // FAQ
    List<FaqVO> faqList();
    FaqVO faqView(int idx);
    int faqRegist(FaqVO faqVO);
    int faqModify(FaqVO faqVO);
    int faqDelete(int idx);



    // QnA
    List<QnaVO> qnaList();
    QnaVO qnaView(int idx);
    int qnaDelete(int idx);
    int qnaReplyRegist(QnaVO qnaVO);
    int qnaReplyModify(QnaVO qnaVO);
    int qnaReplyTotalCount(QnaVO qnaVO);
    int replyStateYtoN(int idx);
    int replyStateNtoY(int idx);


    // 회원
    List<MemberVO> memberList();

    // 도서
    List<ProductVO> productList();

    // 배송
    int deliveryUpdateState(@Param(value = "order_idx") ArrayList<Integer> order_idx, @Param(value = "delivery_state") String delivery_state);
}
