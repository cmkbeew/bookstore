package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.service.CommunityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {

    private final CommunityService communityService;

    @GetMapping("/notice/list")
    public void noticeList(Model model) {
        List<NoticeDTO> noticeList = communityService.noticeList();

        model.addAttribute("noticeList", noticeList);
    }

    @GetMapping("/notice/view")
    public void noticeView(@RequestParam int notice_idx, Model model) {
        NoticeDTO noticeDTO = communityService.noticeView(notice_idx);

        model.addAttribute("noticeDTO", noticeDTO);
    }
}
