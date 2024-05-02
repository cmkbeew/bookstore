package org.fullstack4.bookstore.service;


import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.dto.CartDTO;
import org.fullstack4.bookstore.dto.CartListDTO;

import java.util.List;

public interface MyServiceIf {
    List<CartListDTO> cart_list(String member_id);
    void update_cnt(String cart_idx, int product_count, String or_member_id);

    int deleteCart (int idx);

    int cart_add(CartDTO cartDTO);
    List<QnaDTO> qna_list_all(String member_id);
    List<DeliveryListDTO> recent_order(String member_id);

    void order_item_insert(OrderItemDTO orderItemDTO);
    void order_insert(OrderDTO orderDTO);
    List<OrderDetailDTO> order_list();
    List<OrderDetailDTO> order_detail(String order_code);
    int orderDelete(@Param(value = "member_id") String member_id, @Param(value = "order_code") String order_code);
}
