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

    private final CommunityService communityService;
    private final AdminService adminService;


//    @GetMapping("/list")
//    public void listGET() {
//        log.info("===============================");
//        log.info("AdminController >> listGET()");
//        log.info("===============================");
//    }

//    @GetMapping("/member/list")
//    public void memberListGET() {
//        log.info("===============================");
//        log.info("AdminController >> memberListGET()");
//        log.info("===============================");
//    }
//    @GetMapping("/notice/list")
//    public void noticeListGET(Model model) {
//        log.info("===============================");
//        log.info("AdminController >> bbsListGET()");
//
//        List<NoticeDTO> noticeList = communityService.noticeList();
//
//        model.addAttribute("noticeList", noticeList);
//
//        log.info("===============================");
//    }

//    @GetMapping(value= {"/notice/list", "/faq/list", "/qna/list" })
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
        }

        if (bbsName.equals("faq")) {
            List<FaqDTO> faqList = adminService.faqList();
            model.addAttribute("bbsList", faqList);
        }

        if (bbsName.equals("qna")) {
            List<QnaDTO> qnaList = adminService.qnaList();
            model.addAttribute("bbsList", qnaList);
        }



        log.info("===============================");
    }




    @GetMapping("/notice/view")
    public void noticeViewGET(
            @RequestParam int notice_idx,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> bbsView()");

        NoticeDTO noticeDTO = communityService.noticeView(notice_idx);
        model.addAttribute("noticeDTO", noticeDTO);

        log.info("===============================");
    }

}
