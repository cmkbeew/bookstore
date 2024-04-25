package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value = "/admin")
@RequiredArgsConstructor
public class AdminController {
    @GetMapping("/memberList")
    public void list() {
        log.info("===============================");
        log.info("AdminController >> memberList");
        log.info("===============================");
    }
}
