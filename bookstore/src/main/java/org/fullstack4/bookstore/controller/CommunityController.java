package org.fullstack4.bookstore.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping("/community")
public class CommunityController {

    @GetMapping("/notice/list")
    public void noticeList() {
        log.info("notice list GET");
    }
}
