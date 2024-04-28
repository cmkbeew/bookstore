package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.AdminService;
import org.fullstack4.bookstore.service.CommunityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;

    @GetMapping(path="/list", params = "bbsName")
    public void bbsListGET(
            @RequestParam String bbsName,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> bbsListGET()");
        log.info(bbsName);

        if (bbsName.equals("notice")) {
            List<NoticeDTO> noticeList = adminService.noticeList();
            model.addAttribute("bbsList", noticeList);
            model.addAttribute("bbsTitle", "공지사항");
            model.addAttribute("bbsName", "notice");
        }

        if (bbsName.equals("faq")) {
            List<FaqDTO> faqList = adminService.faqList();
            model.addAttribute("bbsList", faqList);
            model.addAttribute("bbsTitle", "FAQ");
            model.addAttribute("bbsName", "faq");
        }

        if (bbsName.equals("qna")) {
            List<QnaDTO> qnaList = adminService.qnaList();
            model.addAttribute("bbsList", qnaList);
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

        log.info("===============================");
    }


    // 회원
    @GetMapping("/member/list")
    public void memberListGET(Model model) {
        log.info("===============================");
        log.info("AdminController >> memberListGET()");

        List<MemberDTO> memberList = adminService.memberList();
        model.addAttribute("memberList", memberList);

        log.info("memberList : " + memberList.toString());
        log.info("===============================");
    }

    // 도서


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

}
