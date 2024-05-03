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

    // 도서 상세 페이지 관련 상품
    List<ProductDTO> relatedProductList(ProductDTO productDTO);


    // 도서 관리 페이지
    List<ProductDTO> adminProductList();
    ProductDTO adminProductView(int product_idx);
    int adminProductRegist(ProductDTO productDTO);
    int adminProductModify(ProductDTO productDTO);
    int adminProductDelete(int product_idx);


}
