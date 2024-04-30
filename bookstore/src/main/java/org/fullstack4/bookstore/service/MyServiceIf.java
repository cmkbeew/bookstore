package org.fullstack4.bookstore.service;


import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.CartVO;
import org.fullstack4.bookstore.dto.CartDTO;
import org.fullstack4.bookstore.dto.CartListDTO;

import java.util.List;

public interface MyServiceIf {
    List<CartListDTO> cart_list(String member_id);
    void update_cnt(String cart_idx, int product_count, String or_member_id);

    int deleteCart (int idx);

    int cart_add(CartDTO cartDTO);
}
