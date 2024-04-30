package org.fullstack4.bookstore.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.CartListVO;
import org.fullstack4.bookstore.domain.CartVO;
import org.fullstack4.bookstore.dto.CartDTO;

import java.util.List;

public interface MyMapper {
    List<CartListVO> cart_list(String member_id);

    int cart_add(CartVO cartVO);
    int find_idx(@Param("product_idx") int product_idx, @Param("or_member_id") String or_member_id);
    int cart_cnt_update(CartVO cartVO);
}
