package org.fullstack4.bookstore.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.*;

import java.util.List;

public interface MyMapper {
    List<CartListVO> cart_list(String member_id);
//    List<CartListVO> cart_selcList(@Param("member_id") String member_id, @Param("cart_idx") int cart_idx);
    int total_cart (String member_id);
    void update_cnt(@Param("cart_idx") String cart_idx, @Param("product_count") int product_count, @Param("or_member_id") String or_member_id);
//    void update_plus_cnt(String cart_idx);
    int deleteCart (int cart_idx);


    int cart_add(CartVO cartVO);
    int find_idx(@Param("product_idx") int product_idx, @Param("or_member_id") String or_member_id);
    int cart_cnt_update(CartVO cartVO);

    List<QnaVO> qna_list_all(String member_id);

    void order_item_insert(OrderItemVO orderItemVO);
    void order_insert(OrderVO orderVO);
    List<OrderDetailVO> order_list(@Param(value="delivery_state") String delivery_state, @Param(value = "member_id") String member_idc);
    List<OrderDetailVO> order_detail(String order_code);

    int orderCancelRequest(@Param(value = "member_id") String member_id, @Param(value = "order_code") String order_code, @Param(value = "delivery_state") String delivery_state);
}
