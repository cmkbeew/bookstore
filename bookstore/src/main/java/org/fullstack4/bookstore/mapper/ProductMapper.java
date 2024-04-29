package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.ProductVO;
import org.fullstack4.bookstore.dto.ProductPageRequestDTO;

import java.util.List;

public interface ProductMapper {

    List<ProductVO> productList(ProductPageRequestDTO productPageRequestDTO);
    int productTotalCount(ProductPageRequestDTO productPageRequestDTO);
    ProductVO productView(int product_idx, String type);
}
