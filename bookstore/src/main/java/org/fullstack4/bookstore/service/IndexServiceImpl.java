package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.FaqDTO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.dto.ProductDTO;
import org.fullstack4.bookstore.dto.QnaDTO;
import org.fullstack4.bookstore.mapper.IndexMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class IndexServiceImpl implements IndexServiceIf{
    private final ModelMapper modelMapper;
    private final IndexMapper indexMapper;
    @Override
    public List<ProductDTO> product_list(String type) {
        List<ProductDTO> productList = indexMapper.product_list(type).stream()
                .map(vo->modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());
        return productList;
    }

    @Override
    public List<ProductDTO> product_random(String type) {
        List<ProductDTO> randomList = indexMapper.product_random(type).stream()
                .map(vo->modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());
        return randomList;
    }

    @Override
    public List<NoticeDTO> main_notice() {
        List<NoticeDTO> randomList = indexMapper.main_notice().stream()
                .map(vo->modelMapper.map(vo, NoticeDTO.class))
                .collect(Collectors.toList());
        return randomList;
    }

    @Override
    public List<FaqDTO> main_faq() {
        List<FaqDTO> randomList = indexMapper.main_faq().stream()
                .map(vo->modelMapper.map(vo, FaqDTO.class))
                .collect(Collectors.toList());
        return randomList;
    }
}
