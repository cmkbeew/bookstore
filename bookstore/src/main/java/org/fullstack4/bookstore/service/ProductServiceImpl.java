package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.domain.ProductVO;
import org.fullstack4.bookstore.domain.ReviewVO;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.mapper.ProductMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ModelMapper modelMapper;
    private final ProductMapper productMapper;

    @Override
    public ProductPageResponseDTO<ProductDTO> productList(ProductPageRequestDTO productPageRequestDTO) {
        List<ProductVO> voList = productMapper.productList(productPageRequestDTO);

        List<ProductDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());

        for(ProductDTO productDTO : dtoList) {
            productDTO.setDisplay_price(productDTO.getPrice(), productDTO.getDiscount());
        }

        int total_count = productMapper.productTotalCount(productPageRequestDTO);

        ProductPageResponseDTO<ProductDTO> responseDTO = ProductPageResponseDTO.<ProductDTO>withAll()
                .productPageRequestDTO(productPageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int productTotalCount(ProductPageRequestDTO productPageRequestDTO) {
        return productMapper.productTotalCount(productPageRequestDTO);
    }

    @Override
    public ProductDTO productView(int product_idx, String type) {
        ProductVO productVO = productMapper.productView(product_idx, type);

        ProductDTO productDTO = modelMapper.map(productVO, ProductDTO.class);

        productDTO.setDisplay_price(productDTO.getPrice(), productDTO.getDiscount());

        return productDTO;
    }

    @Override
    public int productReviewRegist(ReviewDTO reviewDTO) {
        ReviewVO reviewVO = modelMapper.map(reviewDTO, ReviewVO.class);

        int result = productMapper.productReviewRegist(reviewVO);

        return result;
    }

    @Override
    public List<ReviewDTO> productReviewList(int product_idx) {
        List<ReviewVO> voList = productMapper.productReviewList(product_idx);
        List<ReviewDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, ReviewDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public ReviewDTO productReviewView(int product_idx, int review_idx) {
        ReviewVO reviewVO = productMapper.productReviewView(product_idx, review_idx);
        ReviewDTO reviewDTO = modelMapper.map(reviewVO, ReviewDTO.class);

        return reviewDTO;
    }

    @Override
    public int productReviewTotalCnt(int product_idx) {
        int total_cnt = productMapper.productReviewTotalCnt(product_idx);

        return total_cnt;
    }

    @Override
    public int productReviewModify(ReviewDTO reviewDTO) {
        ReviewVO reviewVO = modelMapper.map(reviewDTO, ReviewVO.class);

        int result = productMapper.productReviewModify(reviewVO);

        return result;
    }

    @Override
    public int productReviewDelete(int product_idx, int review_idx) {
        int result = productMapper.productReviewDelete(product_idx, review_idx);

        return result;
    }

    @Override
    public List<ProductDTO> relatedProductList(ProductDTO productDTO) {
        ProductVO productVO = modelMapper.map(productDTO, ProductVO.class);

        List<ProductVO> voList = productMapper.relatedProductList(productVO);

        List<ProductDTO> dtoList = voList.stream()
                                         .map(vo -> modelMapper.map(vo, ProductDTO.class))
                                         .collect(Collectors.toList());
        
        for(ProductDTO list : dtoList) {
            list.setDisplay_price(list.getPrice(), list.getDiscount());
        }
        
        return dtoList;
    }

    // 도서 관리 페이지
    @Override
    public List<ProductDTO> adminProductList() {
        List<ProductVO> voList = productMapper.adminProductList();
        List<ProductDTO> dtoList = voList.stream().map(vo -> modelMapper.map(vo, ProductDTO.class)).collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public ProductDTO adminProductView(int product_idx) {
        ProductVO productVO = productMapper.adminProductView(product_idx);

        ProductDTO productDTO = modelMapper.map(productVO, ProductDTO.class);

        productDTO.setDisplay_price(productDTO.getPrice(), productDTO.getDiscount());

        return productDTO;
    }

    @Override
    public int adminProductRegist(ProductDTO productDTO) {
        ProductVO productVO = modelMapper.map(productDTO, ProductVO.class);
        int result = productMapper.adminProductRegist(productVO);

        return result;
    }

    @Override
    public int adminProductModify(ProductDTO productDTO) {

        ProductVO productVO = modelMapper.map(productDTO, ProductVO.class);
        int result = productMapper.adminProductModify(productVO);

        return result;
    }

    @Override
    public int adminProductDelete(int product_idx) {
        int result = productMapper.adminProductDelete(product_idx);

        return result;
    }


}
