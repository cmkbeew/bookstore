package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.CartListVO;

import java.util.List;

public interface MyMapper {
    List<CartListVO> cart_list(String member_id);
    void update_cnt(String cart_idx);
    void update_plus_cnt(String cart_idx);
    int deleteCart (int idx);


}
