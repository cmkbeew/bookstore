package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import org.fullstack4.bookstore.domain.ProductVO;
import org.fullstack4.bookstore.dto.PageRequestDTO;
import org.fullstack4.bookstore.dto.PageResponseDTO;
import org.fullstack4.bookstore.dto.ProductDTO;
import org.fullstack4.bookstore.dto.QnaDTO;
import org.fullstack4.bookstore.mapper.ProductMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ModelMapper modelMapper;
    private final ProductMapper productMapper;

    @Override
    public PageResponseDTO<ProductDTO> productList(PageRequestDTO pageRequestDTO, String type) {
        String category1 = getType(type);

        List<ProductVO> voList = productMapper.productList(pageRequestDTO, category1);

        List<ProductDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());

        int total_count = productMapper.productTotalCount(pageRequestDTO);

        PageResponseDTO<ProductDTO> responseDTO = PageResponseDTO.<ProductDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int productTotalCount(PageRequestDTO pageRequestDTO) {
        return productMapper.productTotalCount(pageRequestDTO);
    }

    @Override
    public ProductDTO productView(int product_idx, String type) {
        String category1 = getType(type);

        ProductVO productVO = productMapper.productView(product_idx, category1);

        ProductDTO productDTO = modelMapper.map(productVO, ProductDTO.class);

        return productDTO;
    }

    public String getType(String type) {
        if(type.equals("child")) {
            type = "유아";
        } else if(type.equals("element")) {
            type = "초등";
        } else if(type.equals("middle")) {
            type = "중등";
        } else if(type.equals("high")) {
            type = "고등";
        } else {
            type = "유아";
        }

        return type;
    }
}
