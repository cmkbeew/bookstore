package org.fullstack4.bookstore.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequestMapping(value="/login")
public class LoginController {

    @GetMapping("/login")
    public void loginGet() {
        log.info("로그인 겟");
    }
    @PostMapping("/login")
    public void loginPost() {
        log.info("로그인 포스트");
    }

    @PostMapping("/logout")
    public void logout() {
        log.info("로그아웃");
    }

}
