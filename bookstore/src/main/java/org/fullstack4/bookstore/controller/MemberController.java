package org.fullstack4.bookstore.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value = "/member")
public class MemberController {
    @GetMapping("/join")
    public void joinGet() {
        log.info("회원가입 페이지");
    }

    @GetMapping("/modify")
    public void modifyGet() {
        log.info("회원가입 페이지 get");
    }
    @PostMapping("/modify")
    public void modifyPost() {
        log.info("회원가입 페이지 post");
    }
    @GetMapping("/view")
    public void viewGet() {
        log.info("회원가입 페이지");
    }
}
