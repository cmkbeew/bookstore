package org.fullstack4.bookstore.service;


import org.fullstack4.bookstore.dto.CartListDTO;

import java.util.List;

public interface MyServiceIf {
    List<CartListDTO> cart_list(String member_id);

}
