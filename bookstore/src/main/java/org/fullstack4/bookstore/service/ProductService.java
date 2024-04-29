package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.dto.PageRequestDTO;
import org.fullstack4.bookstore.dto.PageResponseDTO;
import org.fullstack4.bookstore.dto.ProductDTO;

public interface ProductService {
    PageResponseDTO<ProductDTO> productList(PageRequestDTO pageRequestDTO, String category1);
    int productTotalCount(PageRequestDTO pageRequestDTO);
    ProductDTO productView(int product_idx, String category1);
}
