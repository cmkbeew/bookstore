package org.fullstack4.bookstore.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.CartListDTO;
import org.fullstack4.bookstore.dto.DeliveryListDTO;
import org.fullstack4.bookstore.dto.ProductDTO;
import org.fullstack4.bookstore.dto.QnaDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;


@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class MyServiceTests {
    @Autowired(required = false)
    private MyServiceIf myServiceIf;

    @Test
    public void test_cartList(){
        CartListDTO cartListDTO = CartListDTO.builder()
                .or_member_id("jy")
                .build();
        log.info(myServiceIf.cart_list(cartListDTO.getOr_member_id()));
    }

    @Test
    public void bbs_List(){
        QnaDTO bbsListDTO = QnaDTO.builder()
                .writer("%")
                .build();
        log.info(myServiceIf.qna_list_all(bbsListDTO.getWriter()));
    }

    @Test
    public void bbs_List11(){
        DeliveryListDTO bbsListDTO = DeliveryListDTO.builder()
                .member_id("test")
                .build();
        log.info(myServiceIf.recent_order(bbsListDTO.getMember_id()));
    }

}