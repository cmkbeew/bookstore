package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.ProductVO;
import org.fullstack4.bookstore.domain.ReviewVO;
import org.fullstack4.bookstore.dto.ProductDTO;
import org.fullstack4.bookstore.dto.ProductPageRequestDTO;
import org.fullstack4.bookstore.dto.ReviewDTO;

import java.util.List;

public interface ProductMapper {

    List<ProductVO> productList(ProductPageRequestDTO productPageRequestDTO);
    int productTotalCount(ProductPageRequestDTO productPageRequestDTO);
    ProductVO productView(int product_idx, String type);

    int productReviewRegist(ReviewVO reviewVO);
    List<ReviewVO> productReviewList(int product_idx);
    ReviewVO productReviewView(int product_idx, int review_idx);
    int productReviewTotalCnt(int product_idx);
    int productReviewModify(ReviewVO reviewVO);
    int productReviewDelete(int product_idx, int review_idx);

    // 도서 상세 페이지 관련 상품
    List<ProductVO> relatedProductList(ProductVO productVO);

    // 도서 관리 페이지
    List<ProductVO> adminProductList();
    ProductVO adminProductView(int product_idx);

}
