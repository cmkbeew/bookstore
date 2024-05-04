package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.ProductDTO;
import org.fullstack4.bookstore.dto.ProductPageRequestDTO;
import org.fullstack4.bookstore.dto.ProductPageResponseDTO;
import org.fullstack4.bookstore.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
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

    @GetMapping("/regist")
    public void adminProductRegistGET(
            @Valid ProductDTO productDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("AdminProductController >> registGET");

//        return "redirect:/admin/product/list";

    }

    @PostMapping("/regist")
    public String adminProductRegistPOST(
            @Valid ProductDTO productDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("AdminProductController >> registPOST");

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("productDTO", productDTO);
            return "redirect:/admin/product/regist";
        }

        int result = productService.adminProductRegist(productDTO);

        if (result > 0) {
            return "redirect:/admin/product/view?product_idx=" + productDTO.getProduct_idx();
        } else {
            redirectAttributes.addFlashAttribute("productDTO", productDTO);
            return "redirect:/admin/product/regist";
        }
    }

    @GetMapping("/modify")
    public void adminProductModifyGET(
            int product_idx,
            Model model
    ) {
        ProductDTO productDTO = productService.adminProductView(product_idx);
        model.addAttribute("productDTO", productDTO);
    }

    @PostMapping("modify")
    public String adminProductModifyPOST(
            @Valid ProductDTO productDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("productDTO", productDTO);

            return "redirect:/admin/product/modify?product_idx=" + productDTO.getProduct_idx();
        }

        int result = productService.adminProductModify(productDTO);

        if (result > 0) {
            return "redirect:/admin/product/view?product_idx=" + productDTO.getProduct_idx();
        } else {
            redirectAttributes.addFlashAttribute("productDTO", productDTO);

            return "redirect:/admin/product/modify?product_idx=" + productDTO.getProduct_idx();
        }
    }

    @PostMapping("/delete")
    public String adminProductDeletePOST(
            @RequestParam(name="product_idx", defaultValue = "0") int product_idx
    ) {
        int result = productService.adminProductDelete(product_idx);

        if (result > 0) {
            return "redirect:/admin/product/list";
        } else {
            return "redirect:/admin/product/list?err=deleteErr";
        }
    }

}
