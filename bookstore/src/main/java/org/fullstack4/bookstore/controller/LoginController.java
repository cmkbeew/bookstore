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
import java.io.IOException;
import java.io.PrintWriter;


@Log4j2
@Controller
@RequestMapping(value = "/login")
@RequiredArgsConstructor
public class LoginController {
    private final LoginServiceIf loginServiceIf;

    @GetMapping("/login")
    public void loginGet(
            HttpServletRequest req
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
            @RequestParam(name = "member_id", defaultValue = "") String member_id,
            @RequestParam(name = "pwd", defaultValue = "") String pwd,
            Model model) {
        log.info("로그인 포스트");

        MemberDTO loginMemberDTO = loginServiceIf.login_info(member_id, pwd);

        model.addAttribute("member_id", member_id);
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session,
                       HttpServletResponse resp
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
    public void findIdGet() {
        log.info("아이디 찾기");
    }
    @PostMapping("/findId")
    public String findIdPost(
            @RequestParam(name = "name", defaultValue = "") String name,
            @RequestParam(name = "email", defaultValue = "") String email,
            RedirectAttributes redirectAttributes
    ) {
        String member_id = loginServiceIf.search_id(name,email);
        log.info(member_id);

        redirectAttributes.addFlashAttribute("member_id", member_id);
        return "redirect:/login/findIdResult";
    }
    @GetMapping("/findIdResult")
    public void findIdResult(
            HttpServletRequest req,
            @RequestParam(name = "member_id", defaultValue = "") String member_id
            ) {
        req.setAttribute("member_id", member_id);
        log.info(member_id);
    }
    @GetMapping("/findPwd")
    public void findPwdGet() {
        log.info("비밀번호 찾기");
    }
    @PostMapping("/findPwd")
    public String findPwdPost(
                            @RequestParam(name = "name", defaultValue = "") String name,
                            @RequestParam(name = "email", defaultValue = "") String email,
                            @RequestParam(name = "member_id", defaultValue = "") String member_id,
                            RedirectAttributes redirectAttributes) {
        log.info("=========================");
        int result = loginServiceIf.search_pwd(name, email, member_id);
        if (result > 0) {
            redirectAttributes.addAttribute("member_id", member_id);
            return "redirect:/login/findPwdResult";
        } else {
            return "/login/findPwd";
        }
    }
    @GetMapping("/findPwdResult")
    public void findPwdResult(HttpServletRequest req,
                              @RequestParam(name = "member_id", defaultValue = "") String member_id
    ) {
        req.setAttribute("member_id", member_id);
        log.info("비밀번호 찾기 결과");
    }
    @PostMapping("/findPwdResult")
    public String findPwdResultPost(
                                    @RequestParam(name = "member_id", defaultValue = "") String member_id,
                                    @RequestParam(name = "pwd", defaultValue = "") String pwd,
                                    HttpServletResponse resp) throws IOException {
        log.info("=========================");
        log.info("member_id: " + member_id);
        log.info("pwd: " + pwd);
        log.info("=========================");

        int result = loginServiceIf.change_pwd(member_id, pwd);

        if (result > 0) {
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('비밀번호가 변경되었습니다.\\n로그인 페이지로 이동합니다.');</script>");
            return "redirect:/login/login";
        } else {
            return "/login/findPwd";
        }
    }
}