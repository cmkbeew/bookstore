package org.fullstack4.bookstore.service;


import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.dto.CartDTO;
import org.fullstack4.bookstore.dto.CartListDTO;

import java.util.List;

public interface MyServiceIf {
    List<CartListDTO> cart_list(String member_id);

//    List<CartListDTO> cart_selcList(String member_id, int cart_idx);
    int total_cart (String member_id);
    void update_cnt(String cart_idx, int product_count, String or_member_id);

    int deleteCart (int idx);

    int cart_add(CartDTO cartDTO);
    List<QnaDTO> qna_list_all(String member_id);

    void order_item_insert(OrderItemDTO orderItemDTO);
    void order_insert(OrderDTO orderDTO);
    List<OrderDetailDTO> order_list(String delivery_state, String member_id);
    List<OrderDetailDTO> order_detail(String order_code);
    int orderCancelRequest(String member_id, String order_code, String delivery_state);
}
