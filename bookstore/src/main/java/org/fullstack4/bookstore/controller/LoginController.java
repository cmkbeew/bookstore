package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.LoginDTO;
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
            HttpServletRequest req,
            @RequestParam(name = "error", defaultValue = "") String error,
            Model model
    ) {
        log.info("로그인 겟");
        String id = CookieUtil.getCookieInfo(req, "id");
        String save_id = CookieUtil.getCookieInfo(req, "save_id");
        String auto_login = CookieUtil.getCookieInfo(req,"auto_login");
        req.setAttribute("id", id);
        req.setAttribute("save_id", save_id);
        req.setAttribute("auto_login", auto_login);
        req.setAttribute("error", error);
    }

    @PostMapping("/login")
    public String loginPost(
            @Valid LoginDTO loginDTO,
            BindingResult bindingResult,
            @RequestParam(name = "return_url", defaultValue = "/", required = false) String return_url,
            RedirectAttributes redirectAttributes,
            HttpServletResponse resp,
            HttpServletRequest req,
            HttpSession session) {
        log.info("로그인 포스트");
        if(loginDTO.getSave_id() == null) {
            loginDTO.setSave_id("");
        }
        if(loginDTO.getAuto_login() == null) {
            loginDTO.setAuto_login("");
        }
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", "비밀번호 아이디를 다시 체크 해주세요.");
            return "redirect:/login/login";
        }
        MemberDTO loginMemberDTO = loginServiceIf.login_info(loginDTO);
        System.out.println("loginMemberDTO" + loginMemberDTO);

        session = req.getSession();
        if (loginMemberDTO != null) {
            // TODO :암호화 복호화 고도화 시 추가
            if(loginDTO.getSave_id().equals("on")) {
                System.out.println("save_id.equals");
                CookieUtil.setCookies(resp, "id", loginDTO.getMember_id(), 60 * 60 * 24, "", "/");
                CookieUtil.setCookies(resp, "save_id", loginDTO.getSave_id(), 60 * 60 * 24, "", "/");
            }
            if(loginDTO.getAuto_login().equals("on")) {
                System.out.println("auto_login.equals");
                CookieUtil.setCookies(resp, "id",loginDTO.getMember_id(), 60 * 60 * 24, "", "/");
                CookieUtil.setCookies(resp, "auto_login", loginDTO.getSave_id(), 60 * 60 * 24, "", "/");
            }
            if((loginDTO.getSave_id().isEmpty() || !loginDTO.getSave_id().equals("on")) &&  (loginDTO.getAuto_login().isEmpty() || !loginDTO.getAuto_login().equals("on"))) {
                CookieUtil.setCookies(resp, "id","" , 0, "", "/");
                CookieUtil.setCookies(resp, "save_id","" , 0, "", "/");
                CookieUtil.setCookies(resp, "auto_login", "", 0, "", "/");
            }

            session.setAttribute("member_id", loginDTO.getMember_id());
            session.setAttribute("name", loginMemberDTO.getName());
            session.setAttribute("phone_num", loginMemberDTO.getPhone_num());
            session.setAttribute("email", loginMemberDTO.getEmail());
            session.setAttribute("zipcode", loginMemberDTO.getZipcode());
            session.setAttribute("addr1", loginMemberDTO.getAddr1());
            session.setAttribute("addr2", loginMemberDTO.getAddr2());

//        model.addAttribute("member_id", member_id);
            return "redirect:/";
        } else {
            redirectAttributes.addFlashAttribute("errors", "비밀번호 아이디를 다시 체크 해주세요.");
            redirectAttributes.addFlashAttribute("dto", loginDTO);
            return "redirect:/login/login";
        }
    }
    @PostMapping("/guest")
    public String guestPost(){
//            @RequestParam(name = "member_id", defaultValue = "") String member_id,
//            @RequestParam(name = "pwd", defaultValue = "") String pwd,
//            Model model) {
//        log.info("로그인 포스트");
//
//        MemberDTO loginMemberDTO = loginServiceIf.login_info(member_id, pwd);
//
//        model.addAttribute("member_id", member_id);
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
            RedirectAttributes redirectAttributes,
            HttpServletResponse resp,
            Model model,
            PrintWriter out) throws IOException {

        String member_id = loginServiceIf.search_id(name,email);
        if(member_id == null) {
            out = resp.getWriter();
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            out.println("<script>alert('조건에 맞는 회원정보가 없습니다.'); window.location.href='/login/findId'</script>");
            out.close();
        }
        redirectAttributes.addAttribute("member_id", member_id);
//        model.addAttribute("member_id", member_id);

        return "redirect:/login/findIdResult";
    }
    @GetMapping("/findIdResult")
    public void findIdResult(
            HttpServletRequest req,
            Model model,
            @RequestParam(name = "member_id", defaultValue = "") String member_id
            ) {
//        req.setAttribute("member_id", member_id);
//        model.addAttribute("member_id", member_id);
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
                                    HttpServletResponse resp,
                                    PrintWriter out) throws IOException {
        log.info("=========================");
        log.info("member_id: " + member_id);
        log.info("pwd: " + pwd);
        log.info("=========================");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        out = resp.getWriter();

        int result = loginServiceIf.change_pwd(member_id, pwd);

        if (result > 0) {
            out.println("<script>alert('비밀번호가 변경되었습니다.\\n로그인 페이지로 이동합니다.'); window.location.href='/login/login'</script>");
            out.close();
            return "redirect:/login/login";
        } else {
            return "/login/findPwd";
        }
    }
}