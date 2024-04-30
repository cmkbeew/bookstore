package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.CartListVO;

import java.util.List;

public interface MyMapper {
    List<CartListVO> cart_list(String member_id);

}
