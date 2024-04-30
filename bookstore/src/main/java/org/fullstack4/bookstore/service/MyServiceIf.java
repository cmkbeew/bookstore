package org.fullstack4.bookstore.service;


import org.fullstack4.bookstore.domain.CartVO;
import org.fullstack4.bookstore.dto.CartDTO;
import org.fullstack4.bookstore.dto.CartListDTO;

import java.util.List;

public interface MyServiceIf {
    List<CartListDTO> cart_list(String member_id);

    int cart_add(CartDTO cartDTO);
}
