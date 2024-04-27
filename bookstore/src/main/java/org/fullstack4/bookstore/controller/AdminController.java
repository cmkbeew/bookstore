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
            List<NoticeDTO2> noticeList = adminService.noticeList();
            model.addAttribute("bbsList", noticeList);
            model.addAttribute("bbsName", "notice");
        }

        if (bbsName.equals("faq")) {
            List<FaqDTO2> faqList = adminService.faqList();
            model.addAttribute("bbsList", faqList);
            model.addAttribute("bbsName", "faq");
        }

        if (bbsName.equals("qna")) {
            List<QnaDTO2> qnaList = adminService.qnaList();
            model.addAttribute("bbsList", qnaList);
            model.addAttribute("bbsName", "qna");
        }
        log.info("===============================");
    }


    @GetMapping(path="/notice/view", params="idx")
    public void noticeViewGET(
            @RequestParam int idx,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> bbsViewGET()");
        NoticeDTO2 noticeDTO = adminService.noticeView(idx);
        model.addAttribute("noticeDTO", noticeDTO);

        log.info("===============================");
    }

    @GetMapping(path="/faq/view", params="idx")
    public void faqViewGET(
            @RequestParam int idx,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> faqViewGET()");
        FaqDTO2 faqDTO = adminService.faqView(idx);
        model.addAttribute("faqDTO", faqDTO);

        log.info("===============================");
    }

    @GetMapping(path="/qna/view", params="idx")
    public void qnaViewGET(
            @RequestParam int idx,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> qnaViewGET()");
        QnaDTO2 qnaDTO = adminService.qnaView(idx);
        model.addAttribute("qnaDTO", qnaDTO);

        log.info("===============================");
    }



    @GetMapping("/member/list")
    public void memberListGET() {
        log.info("===============================");
        log.info("AdminController >> memberListGET()");
        log.info("===============================");
    }



}
