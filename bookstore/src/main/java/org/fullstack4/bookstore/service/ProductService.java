package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.ProductVO;
import org.fullstack4.bookstore.domain.ReviewVO;
import org.fullstack4.bookstore.dto.*;

import java.util.List;

public interface ProductService {
    ProductPageResponseDTO<ProductDTO> productList(ProductPageRequestDTO productPageRequestDTO);
    int productTotalCount(ProductPageRequestDTO productPageRequestDTO);
    ProductDTO productView(int product_idx, String type);

    int productReviewRegist(ReviewDTO reviewDTO);
    List<ReviewDTO> productReviewList(int product_idx);
    ReviewDTO productReviewView(int product_idx, int review_idx);
    int productReviewTotalCnt(int product_idx);
    int productReviewModify(ReviewDTO reviewDTO);
    int productReviewDelete(int product_idx, int review_idx);
}
