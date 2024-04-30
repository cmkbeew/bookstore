package org.fullstack4.bookstore.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.CartListDTO;
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
}