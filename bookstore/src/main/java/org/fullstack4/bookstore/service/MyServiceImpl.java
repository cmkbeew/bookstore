package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.CartListDTO;
import org.fullstack4.bookstore.mapper.MyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Log4j2
@Service
@RequiredArgsConstructor
public class MyServiceImpl implements MyServiceIf{
    private final ModelMapper modelMapper;
    private final MyMapper myMapper;
    @Override
    public List<CartListDTO> cart_list(String member_id) {
        log.info("====================================================");
        List<CartListDTO> cartDTOList = myMapper.cart_list(member_id).stream()
                .map(vo->modelMapper.map(vo, CartListDTO.class))
                .collect(Collectors.toList());
        cartDTOList.forEach(dto-> dto.setDisplay_price(dto.getPrice(),dto.getDiscount()));
        cartDTOList.forEach(dto-> System.out.println(dto.getDisplay_price()));
        log.info("MyServiceImpl >> cart_list(member_id) : " + cartDTOList);
        log.info("====================================================");
        return cartDTOList;
    }

    @Override
    public int deleteCart (int idx) {
        int result = myMapper.deleteCart(idx);
        return result;
    }


    @Override
    public void update_cnt(String cart_idx) {
        log.info("====================================================");
        myMapper.update_cnt(cart_idx);
        log.info("MyServiceImpl >> update_cnt(int cart_idx, int product_cnt) : " + cart_idx);
        log.info("====================================================");
    }
    @Override
    public void update_plus_cnt(String cart_idx) {
        myMapper.update_plus_cnt(cart_idx);
    }
}
