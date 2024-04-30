package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.ProductDTO;
import org.fullstack4.bookstore.dto.ProductPageRequestDTO;
import org.fullstack4.bookstore.dto.ProductPageResponseDTO;
import org.fullstack4.bookstore.dto.ReviewDTO;
import org.fullstack4.bookstore.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

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

        // 후기 리스트
        List<ReviewDTO> reviewList = productService.productReviewList(product_idx);

        // 후기 count TODO: 후기 페이징
        int review_total_cnt = productService.productReviewTotalCnt(product_idx);

        // 관련 상품 4개
        List<ProductDTO> relatedProductList = productService.relatedProductList(productDTO);

        model.addAttribute("productDTO", productDTO);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("relatedProductList", relatedProductList);
    }

    @GetMapping("/review/regist")
    public void productReview(String type, int product_idx, Model model) {
        model.addAttribute("type", type);
        model.addAttribute("product_idx", product_idx);
    }

    @PostMapping("/review/regist")
    public String productReview(@Valid ReviewDTO reviewDTO,
                                BindingResult bindingResult,
                                String type,
                                RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {
        type = URLEncoder.encode(type, "UTF-8");

        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("reviewDTO", reviewDTO);

            return "redirect:/product/review/regist?type=" + type + "&product_idx=" + reviewDTO.getProduct_idx();
        }

        int result = productService.productReviewRegist(reviewDTO);

        if(result > 0) {
            return "redirect:/product/view?type=" + type + "&product_idx=" + reviewDTO.getProduct_idx();
        } else {
            redirectAttributes.addFlashAttribute("reviewDTO", reviewDTO);

            return "redirect:/product/review/regist?type=" + type + "&product_idx=" + reviewDTO.getProduct_idx();
        }
    }

    @GetMapping("/review/modify")
    public void productReviewModify(String type, int product_idx, int review_idx, Model model) {
        ReviewDTO reviewDTO = productService.productReviewView(product_idx, review_idx);

        model.addAttribute("type", type);
        model.addAttribute("reviewDTO", reviewDTO);
    }

    @PostMapping("/review/modify")
    public String productReviewModify(@Valid ReviewDTO reviewDTO,
                                      BindingResult bindingResult,
                                      String type,
                                      RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {
        type = URLEncoder.encode(type, "UTF-8");

        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("reviewDTO", reviewDTO);

            return "redirect:/product/review/modify?type=" + type + "&product_idx=" + reviewDTO.getProduct_idx() + "&review_idx=" + reviewDTO.getReview_idx();
        }

        int result = productService.productReviewModify(reviewDTO);

        if(result > 0) {
            return "redirect:/product/view?type=" + type + "&product_idx=" + reviewDTO.getProduct_idx();
        } else {
            redirectAttributes.addFlashAttribute("reviewDTO", reviewDTO);

            return "redirect:/product/review/modify?type=" + type + "&product_idx=" + reviewDTO.getProduct_idx() + "&review_idx=" + reviewDTO.getReview_idx();
        }
    }

    @PostMapping("/review/delete")
    @ResponseBody
    public String productReviewDelete(int product_idx, int review_idx, String type) throws UnsupportedEncodingException {
        type = URLEncoder.encode(type, "UTF-8");

        int result = productService.productReviewDelete(product_idx, review_idx);



        if(result > 0) {
            return "/product/view?type=" + type + "&product_idx=" + product_idx + "#bookReview";
        } else {
            return "N";
        }
    }
}
