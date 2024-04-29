package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.AdminService;
import org.fullstack4.bookstore.service.CommunityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;

    @GetMapping(path="/list", params = "bbsName")
    public void bbsListGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            @RequestParam String bbsName,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> bbsListGET()");

        if (bindingResult.hasErrors()){
            log.info("AdminController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        if (bbsName.equals("notice")) {
            PageResponseDTO<NoticeDTO> bbsPagingList = adminService.noticeListByPage(pageRequestDTO);
            model.addAttribute("bbsPagingList", bbsPagingList);
            model.addAttribute("bbsTitle", "공지사항");
            model.addAttribute("bbsName", "notice");
        }

        if (bbsName.equals("faq")) {
            PageResponseDTO<FaqDTO> bbsPagingList = adminService.faqListByPage(pageRequestDTO);
            model.addAttribute("bbsPagingList", bbsPagingList);
            model.addAttribute("bbsTitle", "FAQ");
            model.addAttribute("bbsName", "faq");
        }

        if (bbsName.equals("qna")) {
            PageResponseDTO<QnaDTO> bbsPagingList = adminService.qnaListByPage(pageRequestDTO);
            model.addAttribute("bbsPagingList", bbsPagingList);
            model.addAttribute("bbsTitle", "QnA");
            model.addAttribute("bbsName", "qna");
        }
        log.info("===============================");
    }


    // 공지사항
    @GetMapping(path="/notice/view", params="idx")
    public void noticeViewGET(
            @RequestParam int idx,
            HttpServletRequest req,
            PageRequestDTO pageRequestDTO,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> bbsViewGET()");
        NoticeDTO noticeDTO = adminService.noticeView(idx);
//        int totalCount = adminService.noticeTotalCount(pageRequestDTO);
//        NoticeDTO2 noticeDTO2 = adminService.prevNotice(idx);

//        log.info("prev!! : " + noticeDTO2);

        String referer = req.getHeader("Referer");

        model.addAttribute("referer", referer);
        model.addAttribute("noticeDTO", noticeDTO);
        model.addAttribute("idx", idx);
//        model.addAttribute("totalCount", totalCount);

        log.info("===============================");
    }
    @GetMapping("/notice/regist")
    public void noticeRegistGET() {
        log.info("===============================");
        log.info("AdminController >> noticeRegistGET()");
        log.info("===============================");
    }

    @PostMapping("/notice/regist")
    public String noticeRegistPOST(
            @Valid NoticeDTO noticeDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("AdminController >> noticeRegistPOST()");
        log.info("===============================");


        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);
            return "redirect:/admin/notice/regist";
        }

        int result = adminService.noticeRegist(noticeDTO);

        if (result > 0) {
            return "redirect:/admin/list?bbsName=notice";
        }
        else {
            return "/admin/notice/regist";
        }
    }



    // FAQ
    @GetMapping(path="/faq/view", params="idx")
    public void faqViewGET(
            @RequestParam int idx,
            HttpServletRequest req,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> faqViewGET()");
        FaqDTO faqDTO = adminService.faqView(idx);

        String referer = req.getHeader("Referer");

        model.addAttribute("referer", referer);
        model.addAttribute("faqDTO", faqDTO);

        log.info("===============================");
    }


    // QnA
    @GetMapping(path="/qna/view", params="idx")
    public void qnaViewGET(
            @RequestParam int idx,
            HttpServletRequest req,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> qnaViewGET()");

        QnaDTO qnaDTO = adminService.qnaView(idx);
        String referer = req.getHeader("Referer");

        model.addAttribute("referer", referer);
        model.addAttribute("qnaDTO", qnaDTO);

        log.info("qnaDTO : " + qnaDTO.toString());
        log.info("===============================");
    }


    // 회원
    @GetMapping("/member/list")
    public void memberListGET(Model model) {
        log.info("===============================");
        log.info("AdminController >> memberListGET()");

        List<MemberDTO> memberList = adminService.memberList();
        model.addAttribute("memberList", memberList);

        log.info("===============================");
    }

    // 도서
    @GetMapping("/product/list")
    public void productListGET(Model model) {
        log.info("===============================");
        log.info("AdminController >> productListGET()");

        List<ProductDTO> productList = adminService.productList();
        model.addAttribute("productList", productList);

        log.info("productList : " + productList.toString());
        log.info("===============================");
    }



    // 배송
    @GetMapping("/delivery/list")
    public void deliveryListGET(Model model) {
        log.info("===============================");
        log.info("AdminController >> deliveryListGET()");

        List<DeliveryDTO> deliveryList = adminService.deliveryList();
        model.addAttribute("deliveryList", deliveryList);

        log.info("deliveryList : " + deliveryList.toString());
        log.info("===============================");
    }

    @GetMapping(path="/delivery/view", params="idx")
    public void deliveryViewGET(
            @RequestParam int idx,
            HttpServletRequest req,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> deliveryViewGET()");
        DeliveryDTO deliveryDTO = adminService.deliveryView(idx);
        String referer = req.getHeader("Referer");

        model.addAttribute("referer", referer);
        model.addAttribute("deliveryDTO", deliveryDTO);

        log.info("===============================");
    }

    @GetMapping(path="/delivery/modify", params="idx")
    public void deliveryModifyGET(
            @RequestParam int idx,
            HttpServletRequest req,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> deliveryModifyGET()");
        DeliveryDTO deliveryDTO = adminService.deliveryView(idx);
        String referer = req.getHeader("Referer");

        model.addAttribute("referer", referer);
        model.addAttribute("deliveryDTO", deliveryDTO);

        log.info("===============================");
    }

//    @PostMapping(path="/delivery/modify", params="idx")
//    public String deliveryModifyPOST(
//            @Valid DeliveryDTO deliveryDTO,
//             BindingResult bindingResult,
//             RedirectAttributes redirectAttributes
//    ) {
//        log.info("===============================");
//        log.info("AdminController >> deliveryModifyPOST()");
//        log.info("deliveryDTO : " + deliveryDTO.toString());
//        log.info("===============================");
//
//        if(bindingResult.hasErrors()) {
//            log.info("Errors");
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("deliveryDTO", deliveryDTO);
//            return "redirect:/admin/modify?idx="+deliveryDTO.getPay_idx();
//        }
//
//        int result = adminService.deliveryModify(deliveryDTO);
//        log.info("result : " + result);
//        log.info("===============================");
//
//        if (result > 0) {
//            return "redirect:/admin/view?idx="+deliveryDTO.getPay_idx();
//        }
//        else {
//            return "/admin/modify?idx="+deliveryDTO.getPay_idx();
//        }
//    }

}
