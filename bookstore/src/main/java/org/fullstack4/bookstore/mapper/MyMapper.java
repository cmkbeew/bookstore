package org.fullstack4.bookstore.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.CartListVO;
import org.fullstack4.bookstore.domain.CartVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.CartDTO;

import java.util.List;

public interface MyMapper {
    List<CartListVO> cart_list(String member_id);
    void update_cnt(@Param("cart_idx") String cart_idx, @Param("product_count") int product_count, @Param("or_member_id") String or_member_id);
//    void update_plus_cnt(String cart_idx);
    int deleteCart (int idx);


    int cart_add(CartVO cartVO);
    int find_idx(@Param("product_idx") int product_idx, @Param("or_member_id") String or_member_id);
    int cart_cnt_update(CartVO cartVO);

    List<QnaVO> qna_list_all(String member_id);
}
