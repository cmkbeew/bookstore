package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.CartListDTO;
import org.fullstack4.bookstore.mapper.MyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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
}
