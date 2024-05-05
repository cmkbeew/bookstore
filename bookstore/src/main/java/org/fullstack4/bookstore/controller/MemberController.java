package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.core.config.plugins.validation.constraints.Required;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.fullstack4.bookstore.service.LoginServiceIf;
import org.fullstack4.bookstore.service.MemberServiceIf;
import org.fullstack4.bookstore.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value = "/member")
@RequiredArgsConstructor
public class MemberController {
    @Autowired
    private final MemberServiceIf memberServiceIf;
    private final LoginServiceIf loginServiceIf;

    @GetMapping("/join")
    public void joinGet() {
        log.info("회원가입 페이지");
    }

    @PostMapping("/join")
    public String joinPost(@Valid MemberDTO memberDTO,
                           BindingResult bindingResult,
                           Model model, RedirectAttributes redirectAttributes) {
        log.info("=========================");
        log.info("member_option" + memberDTO.getOption());
        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("dto", memberDTO);
            return "redirect:/member/join";
        }
        memberDTO.setPhoneNum(memberDTO.getPhone_num1(), memberDTO.getPhone_num2(), memberDTO.getPhone_num3());
        int result = memberServiceIf.join(memberDTO);
        if (result > 0) {
            return "redirect:/login/login";
        } else {
            return "/";
        }
    }
    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(
            @RequestParam(name = "member_id", defaultValue = "") String member_id
    ) {
        int result = memberServiceIf.idCheck(member_id);
        return result;
    }

    @GetMapping("/view")
    public void viewGet(@RequestParam(name = "member_id", defaultValue = "") String member_id,
                        Model model) {
        log.info("=========================");
        log.info("MemberController >> viewGet()");
        log.info("=========================");
        MemberDTO memberDTO = memberServiceIf.info_view(member_id);
        log.info("memberDTO >>" + memberDTO);
        model.addAttribute("memberDTO", memberDTO);
    }

    @GetMapping("/modify")
    public void modifyGet(@RequestParam(name = "member_id", defaultValue = "") String member_id,
                          Model model) {
        log.info("=========================");
        log.info("MemberController >> viewGet()");
        log.info("=========================");
        MemberDTO memberDTO = memberServiceIf.info_view(member_id);
        String[] arrPhoneNum = (memberDTO.getPhone_num() != null ? memberDTO.getPhone_num().split("-") : null);
        if (arrPhoneNum != null && arrPhoneNum.length == 3) {
            memberDTO.setPhone_num1(arrPhoneNum[0]);
            memberDTO.setPhone_num2(arrPhoneNum[1]);
            memberDTO.setPhone_num3(arrPhoneNum[2]);
        }
        log.info("memberDTO >>" + memberDTO);
        model.addAttribute("memberDTO", memberDTO);
    }

    @PostMapping("/modify")
    public String modifyPost(MemberDTO memberDTO,
                             HttpServletRequest req) {
        HttpSession session = req.getSession();
        String member_id = session.getAttribute("member_id").toString();
        session.getAttribute("user_id");
        log.info("=========================");
        log.info("MemberController >> modifyPost()");
        log.info("=========================");

        memberDTO.setPhoneNum(memberDTO.getPhone_num1(), memberDTO.getPhone_num2(), memberDTO.getPhone_num3());

        log.info("membercontroller >> memberDTO" + memberDTO);
        log.info("forever : " + memberDTO.getForever_yn());

        if(memberDTO.getOption() == null) {
            memberDTO.setOption("N");
        }

        int result = memberServiceIf.info_modify(memberDTO);

        if (result > 0) {
            return "redirect:/member/view?member_id="+member_id;
        } else {
            return "/member/modify?member_id="+member_id;
        }
    }
    @GetMapping("/modifyPwd")
    public void modifyPwdGet(@RequestParam(name = "member_id", defaultValue = "") String member_id,
                             RedirectAttributes redirectAttributes,
                             Model model) {
        log.info("=========================");
        log.info("MemberController >> modifyGet()");
        log.info("=========================");
        String pwd = memberServiceIf.curr_pwd(member_id);
        model.addAttribute("nowPwd", pwd);
        redirectAttributes.addAttribute("member_id",member_id);
        log.info("pwd : " + pwd);
    }

    @PostMapping("/modifyPwd")
    public String modifyPwdPost(@RequestParam(name = "member_id", defaultValue = "") String member_id,
                              @RequestParam(name = "pwd", defaultValue = "") String pwd,
                              HttpServletResponse resp) throws IOException {
        log.info("=========================");
        log.info("member_id: " + member_id);
        log.info("pwd: " + pwd);
        log.info("=========================");

        int result = loginServiceIf.change_pwd(member_id, pwd);

        if (result > 0) {
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('비밀번호가 변경되었습니다.');</script>");
            return "redirect:/member/view?member_id="+member_id;
        } else {
            return "/member/modifyPwd";
        }
    }
    @PostMapping("delete")
    public String deletePost(@RequestParam(name="member_id", defaultValue = "0") String member_id,
                           HttpSession session,
                           HttpServletResponse resp,
                           HttpServletRequest req,
                           Model model) {
        log.info("=========================");
        log.info("MemberController >> deletePost()");
        log.info("=========================");
        int result=memberServiceIf.delete_member(member_id);
        log.info("=========================");
        if(result > 0 ){
            session.invalidate();
            Cookie[] cookies = req.getCookies();
            if(cookies != null) {
                CookieUtil.setDeleteCookie(resp, "save_id", "", 0, "", "/");
                CookieUtil.setDeleteCookie(resp, "auto_login", "", 0, "", "/");
                CookieUtil.setDeleteCookie(resp, "id", "", 0, "", "/");
            }
            return "redirect:/";
        } else {
            return "/member/view?member_id="+member_id;
        }
    }
}

