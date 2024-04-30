package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.CartVO;
import org.fullstack4.bookstore.dto.CartDTO;
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

    @Override
    public void update_cnt(String cart_idx) {

    }

    @Override
    public void update_plus_cnt(String cart_idx) {

    }

    @Override
    public int deleteCart(int idx) {
        return 0;
    }

    @Override
    public int cart_add(CartDTO cartDTO) {
        CartVO cartVO = modelMapper.map(cartDTO, CartVO.class);

        // TODO : 기존 데이터에 member와 idx 있으면 수량 + 해주는 update / idx 없으면 장바구니 추가하는 insert
        int findIdx = myMapper.find_idx(cartVO.getProduct_idx(), cartVO.getOr_member_id());

        int result = 0;

        // 기존 장바구니에 member와 idx 있을 때 수량 +
        if(findIdx > 0) {
            result = myMapper.cart_cnt_update(cartVO);
        } else { // 기존 장바구니에 member와 idx 없을 때 데이터 추가
            result = myMapper.cart_add(cartVO);
        }
        return result;
    }
}
