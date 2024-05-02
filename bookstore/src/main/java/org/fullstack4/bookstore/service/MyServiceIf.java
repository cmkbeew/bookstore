package org.fullstack4.bookstore.service;


import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.CartVO;
import org.fullstack4.bookstore.domain.PaymentVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.dto.CartDTO;
import org.fullstack4.bookstore.dto.CartListDTO;

import java.util.List;

public interface MyServiceIf {
    List<CartListDTO> cart_list(String member_id);

//    List<CartListDTO> cart_selcList(String member_id, int cart_idx);
    void update_cnt(String cart_idx, int product_count, String or_member_id);

    int deleteCart (int idx);

    int cart_add(CartDTO cartDTO);
    int paymentInsert(PaymentDTO paymentDTO);
    PaymentDTO paymentSelect(int cart_idx);

    int deliveryInsert(DeliveryDTO deliveryDTO);
    List<QnaDTO> qna_list_all(String member_id);
    List<DeliveryListDTO> recent_order(String member_id);
}
