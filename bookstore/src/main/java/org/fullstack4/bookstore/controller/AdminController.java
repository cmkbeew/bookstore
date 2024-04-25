package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.service.CommunityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminController {

    private final CommunityService communityService;

    @GetMapping("/memberList")
    public void memberListGET() {
        log.info("===============================");
        log.info("AdminController >> memberListGET()");
        log.info("===============================");
    }
    @GetMapping("/bbsList")
    public void bbsListGET(Model model) {
        log.info("===============================");
        log.info("AdminController >> bbsListGET()");

        List<NoticeDTO> noticeList = communityService.noticeList();

        model.addAttribute("noticeList", noticeList);

        log.info("===============================");
    }
}
