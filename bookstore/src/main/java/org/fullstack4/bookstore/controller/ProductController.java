package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.ProductDTO;
import org.fullstack4.bookstore.dto.ProductPageRequestDTO;
import org.fullstack4.bookstore.dto.ProductPageResponseDTO;
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
    public void productList(ProductPageRequestDTO productPageRequestDTO, Model model) {
        ProductPageResponseDTO<ProductDTO> productList = productService.productList(productPageRequestDTO);

        model.addAttribute("productList", productList);
    }

    @GetMapping("/view")
    public void productView(String type, int product_idx, Model model) {
        ProductDTO productDTO = productService.productView(product_idx, type);

        model.addAttribute("productDTO", productDTO);
    }
}
