package org.fullstack4.bookstore.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.ProductVO;
import org.fullstack4.bookstore.dto.PageRequestDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class ProductMapperTests {
    @Autowired(required = false)
    ProductMapper productMapper;

    @Autowired(required = false)
    PageRequestDTO pageRequestDTO;

    @Test
    public void testProductList() {
        List<ProductVO> productList = productMapper.productList(pageRequestDTO, "초등");

        log.info("productList : " + productList);
    }
}
