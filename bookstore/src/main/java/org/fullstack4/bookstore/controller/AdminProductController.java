package org.fullstack4.bookstore.controller;

//import com.sun.org.apache.xpath.internal.operations.Mod;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin/product")
@RequiredArgsConstructor
public class AdminProductController {
    private final ProductService productService;

    @GetMapping("/list")
    public void adminProductListGET(
            ProductPageRequestDTO productPageRequestDTO,
            Model model
    ) {
        ProductPageResponseDTO<ProductDTO> adminProductListByPage = productService.productList(productPageRequestDTO);
        List<ProductDTO> adminProductList = productService.adminProductList();

        model.addAttribute("adminProductListByPage", adminProductListByPage);
        model.addAttribute("adminProductList", adminProductList);
    }


    @GetMapping("/view")
    public void adminProductViewGET(
            @RequestParam int product_idx,
            Model model
    ) {
        List<ProductDTO> adminProductList = productService.adminProductList();
        model.addAttribute("adminProductList", adminProductList);
        ProductDTO productDTO = productService.adminProductView(product_idx);
        model.addAttribute("productDTO", productDTO);

        log.info("adminProductList" + adminProductList);
        log.info("productDTO" + productDTO);

    }


}
