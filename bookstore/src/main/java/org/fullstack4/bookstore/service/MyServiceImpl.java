package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.mapper.CommunityMapper;
import org.fullstack4.bookstore.mapper.MyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class MyServiceImpl implements MyServiceIf{
    private final ModelMapper modelMapper;
    private final MyMapper myMapper;
    private final CommunityMapper communityMapper;
    @Override
    public List<CartListDTO> cart_list(String member_id) {
        List<CartListDTO> cartDTOList = myMapper.cart_list(member_id).stream()
                .map(vo->modelMapper.map(vo, CartListDTO.class))
                .collect(Collectors.toList());

        cartDTOList.forEach(dto-> dto.setDisplay_price(dto.getPrice(),dto.getDiscount()));

        return cartDTOList;
    }

    @Override
    public void update_cnt(String cart_idx, int product_count, String or_member_id) {
        myMapper.update_cnt(cart_idx, product_count, or_member_id);
    }

    @Override
    public int deleteCart(int cart_idx) {
        int result = myMapper.deleteCart(cart_idx);

        return result;
    }

    @Override
    public int cart_add(CartDTO cartDTO) {
        CartVO cartVO = modelMapper.map(cartDTO, CartVO.class);

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

    public List<QnaDTO> qna_list_all(String member_id) {
        List<QnaDTO> QnaDTOList = myMapper.qna_list_all(member_id).stream()
                .map(vo->modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());
        return QnaDTOList;
    }

    @Override
    public List<DeliveryListDTO> recent_order(String member_id) {
        List<DeliveryListDTO> orderList = myMapper.recent_order(member_id).stream()
                .map(vo->modelMapper.map(vo, DeliveryListDTO.class))
                .collect(Collectors.toList());
        return orderList;
    }

    @Override
    public void order_item_insert(OrderItemDTO orderItemDTO) {
        OrderItemVO orderItemVO = modelMapper.map(orderItemDTO, OrderItemVO.class);

        myMapper.order_item_insert(orderItemVO);
    }

    @Override
    public void order_insert(OrderDTO orderDTO) {
        OrderVO orderVO = modelMapper.map(orderDTO, OrderVO.class);

        myMapper.order_insert(orderVO);
    }

    @Override
    public List<OrderDetailDTO> order_list() {
        List<OrderDetailVO> voList = myMapper.order_list();

        List<OrderDetailDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, OrderDetailDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public List<OrderDetailDTO> order_detail(String order_code) {
        List<OrderDetailVO> voList = myMapper.order_detail(order_code);

        List<OrderDetailDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, OrderDetailDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    @Transactional
    public int orderDelete(String member_id, String order_code) {
        int orderResult = myMapper.orderDelete(member_id, order_code);
        int orderItemResult = myMapper.orderItemDelete(member_id, order_code);

        return orderResult;
    }

}
