package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.AdminService;
import org.fullstack4.bookstore.service.CommunityService;
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
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;
    private final CommunityService communityService;

    @GetMapping(path="/list")
    public void bbsListGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            @RequestParam String type,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> bbsListGET()");

        if (bindingResult.hasErrors()){
            log.info("AdminController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        if (type.equals("notice")) {
            PageResponseDTO<NoticeDTO> noticeList = adminService.noticeListByPage(pageRequestDTO);
            model.addAttribute("communityList", noticeList);
            model.addAttribute("bbsTitle", "공지사항");
        }

        if (type.equals("faq")) {
            PageResponseDTO<FaqDTO> faqList = adminService.faqListByPage(pageRequestDTO);
            model.addAttribute("communityList", faqList);
            model.addAttribute("bbsTitle", "FAQ");
        }

        if (type.equals("qna")) {
            PageResponseDTO<QnaDTO> qnaList = adminService.qnaListByPage(pageRequestDTO);
            model.addAttribute("communityList", qnaList);
            model.addAttribute("bbsTitle", "QnA");
        }
        log.info("===============================");
    }

    @GetMapping(path="/delete")
    public String bbsDeleteGET(
            @RequestParam (name="idx", defaultValue = "0") int idx,
            @RequestParam (name="type") String type,
            HttpServletRequest req
    ) {
        String referer = req.getHeader("Referer");
        log.info("bbsDeleteGET >> " + type);

        if (type.equals("notice")) {
            int result = adminService.noticeDelete(idx);

            if (result > 0) {
                return "redirect:/admin/list?type=notice";
            } else {
                return "referer";
            }
        }

        if (type.equals("faq")) {
            int result = adminService.faqDelete(idx);

            if (result > 0) {
                return "redirect:/admin/list?type=faq";
            } else {
                return "referer";
            }
        }

        return "referer";

    }

    @PostMapping (path="/delete")
    public String bbsDeletePOST(
            @RequestParam (name="idx", defaultValue = "0") int idx,
            HttpServletRequest req,
            @RequestParam String type
    ) {
            log.info("===============================");
            log.info("AdminController >> bbsDeletePOST()");
            String referer = req.getHeader("Referer");
            String[] delete_idx = req.getParameterValues("select");

        if (type.equals("notice")) {
            int result = 0;

            for (int i = 0; i < delete_idx.length; i++) {
                int intIdx = Integer.parseInt(delete_idx[i]);
                result = adminService.noticeDelete(intIdx);
            }
            if (result > 0) {
                return "redirect:" + referer;
            } else {
                return "redirect:/admin/list?type=notice&err=deleteErr";
            }
        }

        if (type.equals("faq")) {
            int result = 0;

            for (int i = 0; i < delete_idx.length; i++) {
                int intIdx = Integer.parseInt(delete_idx[i]);
                result = adminService.faqDelete(intIdx);
            }
            if (result > 0) {
                return "redirect:" + referer;
            } else {
                return "redirect:/admin/list?type=notice&err=deleteErr";
            }
        }

//
//        if (type.equals("qna")) {
//
//        }
        log.info("===============================");
//        return "redirect:/admin/list?type=notice";
        return "redirect:/admin/list?type=notice";

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

        String referer = req.getHeader("Referer");

        PageResponseDTO<NoticeDTO> noticeList = adminService.noticeListByPage(pageRequestDTO);
        model.addAttribute("communityList", noticeList);
        model.addAttribute("referer", referer);
        model.addAttribute("noticeDTO", noticeDTO);
        model.addAttribute("idx", idx);
//        model.addAttribute("totalCount", totalCount);


        // 이전글 다음글
        Map<String, NoticeDTO> noticeMap = communityService.noticeView(idx);

        noticeMap.get("noticeDTO").setContent(noticeMap.get("noticeDTO").getContent().replace("\r\n", "<br>"));

        model.addAttribute("dto", noticeMap.get("noticeDTO"));
        model.addAttribute("prevDTO", noticeMap.get("noticePrevDTO"));
        model.addAttribute("nextDTO", noticeMap.get("noticeNextDTO"));

        log.info("===============================");
    }

    @GetMapping(path="/notice/fix", params="idx")
    public String noticeFixGET(
            @RequestParam (name="idx", defaultValue = "0") int idx
    ) {
        log.info("===============================");
        log.info("AdminController >> noticeFixGET()");

        int result = adminService.noticeFix(idx);;

        if (result > 0) {
            log.info("===============================");
            return "redirect:/admin/list?type=notice";
        } else {
            return "redirect:/admin/list?type=notice&err=fixErr";
        }

    }


    @GetMapping("/notice/regist")
    public void noticeRegistGET() {
        log.info("===============================");
        log.info("AdminController >> noticeRegistGET()");
        log.info("===============================");
    }

    @PostMapping("/notice/regist")
    public String noticeRegistPOST(
            @RequestParam("file") MultipartFile multipartFile,
            @Valid NoticeDTO noticeDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("AdminController >> noticeRegistPOST()");
        log.info("===============================");

        log.info("errors: " + bindingResult.getAllErrors());
        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);
            return "redirect:/admin/notice/regist";
        }

        // 파일 등록
        String save_file_name = "";

        if (!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile);
        }
        noticeDTO.setOrg_file_name(multipartFile.getOriginalFilename());
        noticeDTO.setSave_file_name(save_file_name);


        int result = adminService.noticeRegist(noticeDTO);

        if (result > 0) {
            return "redirect:/admin/list?type=notice";
        }
        else {
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);
            return "redirect:/admin/notice/regist";
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

        // 이전글 다음글
        Map<String, FaqDTO> faqMap = communityService.faqView(idx);

        faqMap.get("faqDTO").setContent(faqMap.get("faqDTO").getContent().replace("\r\n", "<br>"));

        model.addAttribute("dto", faqMap.get("faqDTO"));
        model.addAttribute("prevDTO", faqMap.get("faqPrevDTO"));
        model.addAttribute("nextDTO", faqMap.get("faqNextDTO"));

        log.info("===============================");
    }

    @GetMapping("/faq/regist")
    public void faqRegistGET() {
        log.info("===============================");
        log.info("AdminController >> faqRegistGET()");
        log.info("===============================");
    }

    @PostMapping("/faq/regist")
    public String faqRegistPOST(
            @Valid FaqDTO faqDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("AdminController >> faqRegistPOST()");
        log.info("===============================");

        log.info("errors: " + bindingResult.getAllErrors());
        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("faqDTO", faqDTO);
            return "redirect:/admin/faq/regist";
        }

        int result = adminService.faqRegist(faqDTO);

        if (result > 0) {
            return "redirect:/admin/list?type=faq";
        }
        else {
            redirectAttributes.addFlashAttribute("faqDTO", faqDTO);
            return "redirect:/admin/faq/regist";
        }
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

        // 이전글 다음글
        Map<String, QnaDTO> qnaMap = communityService.qnaView(idx);

        model.addAttribute("dto", qnaMap.get("qnaDTO"));
        model.addAttribute("prevDTO", qnaMap.get("qnaPrevDTO"));
        model.addAttribute("nextDTO", qnaMap.get("qnaNextDTO"));

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
