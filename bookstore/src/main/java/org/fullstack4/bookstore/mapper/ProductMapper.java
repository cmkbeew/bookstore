package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.ProductVO;
import org.fullstack4.bookstore.dto.PageRequestDTO;

import java.util.List;

public interface ProductMapper {

    List<ProductVO> productList(PageRequestDTO pageRequestDTO, String category1);
    int productTotalCount(PageRequestDTO pageRequestDTO);
    ProductVO productView(int product_idx, String category1);
}
