package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.dto.*;

public interface ProductService {
    ProductPageResponseDTO<ProductDTO> productList(ProductPageRequestDTO productPageRequestDTO);
    int productTotalCount(ProductPageRequestDTO productPageRequestDTO);
    ProductDTO productView(int product_idx, String type);
}
