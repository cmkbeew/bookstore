package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.CartVO;
import org.fullstack4.bookstore.domain.DeliveryVO;
import org.fullstack4.bookstore.domain.PaymentVO;
import org.fullstack4.bookstore.dto.CartDTO;
import org.fullstack4.bookstore.dto.CartListDTO;
import org.fullstack4.bookstore.dto.DeliveryDTO;
import org.fullstack4.bookstore.dto.PaymentDTO;
import org.fullstack4.bookstore.dto.QnaDTO;
import org.fullstack4.bookstore.mapper.CommunityMapper;
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

    @Override
    public int paymentInsert(PaymentDTO paymentDTO) {
        PaymentVO paymentVO = modelMapper.map(paymentDTO, PaymentVO.class);

        int paymentResult = myMapper.paymentInsert(paymentVO);

        return paymentResult;
    }

    @Override
    public PaymentDTO paymentSelect(int cart_idx) {
        PaymentVO paymentVO = myMapper.paymentSelect(cart_idx);

        PaymentDTO paymentDTO = modelMapper.map(paymentVO, PaymentDTO.class);

        return paymentDTO;
    }

    @Override
    public int deliveryInsert(DeliveryDTO deliveryDTO) {
        DeliveryVO deliveryVO = modelMapper.map(deliveryDTO, DeliveryVO.class);

        int paymentResult = myMapper.deliveryInsert(deliveryVO);

        return paymentResult;
    }
    public List<QnaDTO> qna_list_all(String member_id) {
        List<QnaDTO> QnaDTOList = myMapper.qna_list_all(member_id).stream()
                .map(vo->modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());
        return QnaDTOList;
    }
}
