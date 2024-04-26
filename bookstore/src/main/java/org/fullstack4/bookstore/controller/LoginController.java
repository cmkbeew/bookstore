package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.HelloServlet;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.fullstack4.bookstore.service.LoginServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value="/login")
@RequiredArgsConstructor
public class LoginController {
    private final LoginServiceIf loginServiceIf;
    @GetMapping("/login")
    public void loginGet() {
        log.info("로그인 겟");
    }
    @PostMapping("/login")
    public String loginPost(
            @Valid MemberDTO memberDTO,
            BindingResult bindingResult,
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            @RequestParam(name = "pwd", defaultValue = "") String pwd,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpServletResponse resp,
            HttpServletRequest req) {
        log.info("로그인 포스트");
        MemberDTO loginMemberDTO = loginServiceIf.login_info(member_id,pwd);
        model.addAttribute("member_id", member_id);
        return "redirect:/";
    }

    @PostMapping("/logout")
    public void logout() {
        log.info("로그아웃");
    }

    @GetMapping("/find")
    public void findGet() {
        log.info("계정찾기 페이지");
    }
    @GetMapping("/findId")
    public void findId() {
        log.info("아이디 찾기");
    }
    @GetMapping("/findPwd")
    public void findPwd() {
        log.info("비밀번호 찾기");
    }

}
