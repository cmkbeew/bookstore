package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.ProductVO;
import org.fullstack4.bookstore.dto.ProductPageRequestDTO;
import org.fullstack4.bookstore.dto.ProductPageResponseDTO;
import org.fullstack4.bookstore.dto.ProductDTO;
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

        return productDTO;
    }
}
