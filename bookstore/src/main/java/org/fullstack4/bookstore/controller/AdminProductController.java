package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.ProductService;
import org.fullstack4.bookstore.util.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping(value="/admin/product")
@RequiredArgsConstructor
public class AdminProductController {
    private final ProductService productService;

    @GetMapping("list")
    public void adminProductListGET(
            @Valid ProductPageRequestDTO productPageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model
    ) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        ProductPageResponseDTO<ProductDTO> adminProductListByPage = productService.adminProductListByPage(productPageRequestDTO);
        List<ProductDTO> adminProductList = productService.adminProductList();

        log.info("adminProductListByPage" + adminProductListByPage);

        model.addAttribute("adminProductListByPage", adminProductListByPage);
        model.addAttribute("adminProductList", adminProductList);

    }


    @GetMapping("/view")
    public void adminProductViewGET(
            @RequestParam int product_idx,
            Model model
    ) {
        Map<String, ProductDTO> adminProductMap = productService.adminProductView(product_idx);
        adminProductMap.get("adminProductDTO").setProduct_content(adminProductMap.get("adminProductDTO").getProduct_content().replace("\r\n", "<br"));

        model.addAttribute("dto", adminProductMap.get("adminProductDTO"));
        model.addAttribute("prevDTO", adminProductMap.get("adminProductPrevDTO"));
        model.addAttribute("nextDTO", adminProductMap.get("adminProductNextDTO"));
    }

    @GetMapping("/regist")
    public void adminProductRegistGET() {
        log.info("===============================");
        log.info("AdminProductController >> registGET");
        log.info("===============================");

    }

    @PostMapping("/regist")
    public String adminProductRegistPOST(
            @RequestParam("file") MultipartFile multipartFile,
            @Valid ProductDTO productDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("productDTO", productDTO);
            return "redirect:/admin/product/regist";
        }

        // 파일 등록
        String save_file_name = "";

        if (!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile, "product");
        }
        productDTO.setOrg_file_name(multipartFile.getOriginalFilename());
        productDTO.setSave_file_name(save_file_name);

        int result = productService.adminProductRegist(productDTO);

        if (result > 0) {
            return "redirect:/admin/product/list";
        } else {
            redirectAttributes.addFlashAttribute("productDTO", productDTO);
            return "redirect:/admin/product/regist";
        }
    }

    @GetMapping("/modify")
    public void adminProductModifyGET(
            @RequestParam int product_idx,
            Model model
    ) {
        log.info("modify");
        ProductDTO productDTO = productService.adminProductModifyGet(product_idx);
        model.addAttribute("productDTO", productDTO);
    }


    @PostMapping("modify")
    public String adminProductModifyPOST(
            @RequestParam("file") MultipartFile multipartFile,
            @Valid ProductDTO productDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("productDTO", productDTO);

            return "redirect:/admin/product/modify?product_idx=" + productDTO.getProduct_idx();
        }

        ProductDTO dto = productService.adminProductModifyGet(productDTO.getProduct_idx());
        String save_file_name = "";

        // 수정 파일 있을 때 저장 및 기존 파일 삭제
        if(!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile, "product");

            FileUploadUtil.deleteFile(dto.getSave_file_name(), "product");
        }

        productDTO.setOrg_file_name(multipartFile.getOriginalFilename());
        productDTO.setSave_file_name(save_file_name);

        int result = productService.adminProductModify(productDTO);

        if (result > 0) {
            return "redirect:/admin/product/view?product_idx=" + productDTO.getProduct_idx();
        } else {
            redirectAttributes.addFlashAttribute("productDTO", productDTO);

            return "redirect:/admin/product/modify?product_idx=" + productDTO.getProduct_idx();
        }
    }

    // list에서 checkbox로 삭제
    @PostMapping(path = "/list/delete")
    public String bbsDeletePOST(
            HttpServletRequest req
    ) {
        String[] delete_idx = req.getParameterValues("select");
        String referer = req.getHeader("Referer");

            int result = 0;

            for (int i = 0; i < delete_idx.length; i++) {
                int intIdx = Integer.parseInt(delete_idx[i]);
                result = productService.adminProductDelete(intIdx);
            }
            if (result > 0) {
                return "redirect:" + referer;
            } else {
                return "redirect:/admin/product/list?err=deleteErr";
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
