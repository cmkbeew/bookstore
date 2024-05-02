package org.fullstack4.bookstore.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.CartListDTO;
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
public class IndexServiceTests {


        @Autowired(required = false)
        private IndexServiceIf indexServiceIf;
    @Test
    public void product_List(){
        ProductDTO bbsListDTO = ProductDTO.builder()
                .type("초등")
                .build();
        log.info(indexServiceIf.product_list(bbsListDTO.getType()));
    }
}
