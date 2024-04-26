package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.fullstack4.bookstore.service.LoginServiceIf;
import org.fullstack4.bookstore.util.CookieUtil;
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
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Log4j2
@Controller
@RequestMapping(value = "/login")
@RequiredArgsConstructor
public class LoginController {
    private final LoginServiceIf loginServiceIf;

    @GetMapping("/login")
    public void loginGet(
            Model model,
            HttpServletRequest req,
            HttpSession session
    ) {
        log.info("로그인 겟");
        String id = CookieUtil.getCookieInfo(req, "id");
        String save_id = CookieUtil.getCookieInfo(req, "save_id");
        String auto_login = CookieUtil.getCookieInfo(req,"auto_login");
        req.setAttribute("id", id);
        req.setAttribute("save_id", save_id);
        req.setAttribute("auto_login", auto_login);
    }

    @PostMapping("/login")
    public String loginPost(
            @Valid MemberDTO memberDTO,
            BindingResult bindingResult,
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            @RequestParam(name = "pwd", defaultValue = "") String pwd,
            @RequestParam(name = "save_id", defaultValue = "") String save_id,
            @RequestParam(name = "auto_login", defaultValue = "") String auto_login,
//            @RequestParam(name = "return_url", defaultValue = "/", required = false) String return_url,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpServletResponse resp,
            HttpServletRequest req,
            HttpSession session) {
        log.info("로그인 포스트");
        log.info("pwd" + pwd);
        log.info("member_id" + member_id);
        System.out.println("save_id"+save_id);
        System.out.println("auto_login"+auto_login);
        MemberDTO loginMemberDTO = loginServiceIf.login_info(member_id, pwd);
        System.out.println("loginMemberDTO"+loginMemberDTO);

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/login/login";
        }
        session = req.getSession();
        if (loginMemberDTO != null) {
//            암호화 복호화 고도화 시 추가
            if(save_id.equals("on")) {
                System.out.println("save_id.equals");
                CookieUtil.setCookies(resp, "id", member_id, 60 * 60 * 24, "", "/");
                CookieUtil.setCookies(resp, "save_id", save_id, 60 * 60 * 24, "", "/");
            }
            if(auto_login.equals("on")) {
                System.out.println("auto_login.equals");
                CookieUtil.setCookies(resp, "id", member_id, 60 * 60 * 24, "", "/");
                CookieUtil.setCookies(resp, "auto_login", auto_login, 60 * 60 * 24, "", "/");
            }
//            (member_id.isEmpty() || member_id == null) &&
            if((save_id.isEmpty() || !save_id.equals("on")) &&  (auto_login.isEmpty() || !auto_login.equals("on"))) {
                CookieUtil.setCookies(resp, "id","" , 0, "", "/");
                CookieUtil.setCookies(resp, "save_id","" , 0, "", "/");
                CookieUtil.setCookies(resp, "auto_login", "", 0, "", "/");
            }
        session.setAttribute("member_id", member_id);
        model.addAttribute("member_id", member_id);
        return "redirect:/";
        } else {
            return "/login/login";
        }
    }

    @PostMapping("/guest")
    public String guestPost(
            @Valid MemberDTO memberDTO,
            BindingResult bindingResult,
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            @RequestParam(name = "pwd", defaultValue = "") String pwd,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpServletResponse resp,
            HttpServletRequest req) {
        log.info("로그인 포스트");

        MemberDTO loginMemberDTO = loginServiceIf.login_info(member_id, pwd);

        model.addAttribute("member_id", member_id);
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session,
                       HttpServletResponse resp,
                       HttpServletRequest req
    ) {
        log.info("로그아웃");
        session.invalidate();
        CookieUtil.setCookies(resp, "auto_login", "", 0, "", "/");
        return "redirect:/";
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
