package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/login")
@RequiredArgsConstructor
public class LoginController {
    //    private final BbsServiceIf bbsServiceIf;
//    private final BbsReplyServiceIf bbsReplyServiceIf;
    @GetMapping("/login")
    public void view() {
        log.info("===============================");
        log.info("LoginController >> login");
        log.info("===============================");
    }
}
