package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.PageRequestDTO;
import org.fullstack4.bookstore.dto.PageResponseDTO;
import org.fullstack4.bookstore.dto.ProductDTO;
import org.fullstack4.bookstore.dto.QnaDTO;
import org.fullstack4.bookstore.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;

    @GetMapping("/list")
    public void productList(PageRequestDTO pageRequestDTO, String type, Model model) {
        log.info("pageRequestDTO : " + pageRequestDTO);
        log.info("type : " + type);

        PageResponseDTO<ProductDTO> productList = productService.productList(pageRequestDTO, type);
        log.info("productList : " + productList);

        model.addAttribute("type", type);
        model.addAttribute("productList", productList);
    }

    @GetMapping("/view")
    public void productView(int product_idx, String type, Model model) {
        ProductDTO productDTO = productService.productView(product_idx, type);

        model.addAttribute("productDTO", productDTO);
    }
}
