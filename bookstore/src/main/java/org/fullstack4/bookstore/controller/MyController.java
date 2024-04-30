package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.CartListDTO;
import org.fullstack4.bookstore.service.MyServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/my")
@RequiredArgsConstructor
public class MyController {

    private final MyServiceIf myServiceIf;

    @GetMapping("/my")
    public void myGet() {
        log.info("마이페이지 목록");
    }

    @GetMapping("/order")
    public void orderGet() {
        log.info("결제내역페이지");

    }
    @PostMapping("/order")
    public void orderPost() {
        log.info("결제내역페이지");
    }

    @GetMapping("/cart")
    public void cartGet(CartListDTO cartListDTO,
//                        @RequestParam(name="member_id", defaultValue = "") String member_id,
                        Model model,
                        HttpSession session
                        ) {
        log.info("장바구니");
        String member_id = session.getAttribute("member_id").toString();
        log.info("member Id : " + member_id);
        List<CartListDTO> cartList = myServiceIf.cart_list(member_id);
        log.info("cartList : " +  cartList);
        model.addAttribute("cartList", cartList);


    }
    @PostMapping("/updateCnt")
    @ResponseBody
    public int updateCnt(
            @RequestParam(name = "member_id", defaultValue = "") String member_id
    ) {
//        int result = memberServiceIf.idCheck(member_id);
        return 0;
    }

    @PostMapping("/cart/add")
    public String addCart() {
        return null;
    }

    @GetMapping("/cartModify")
    public void cartModifyGet() {
        log.info("장바구니수정");
    }
    @GetMapping("/qna")
    public void qnaGet() {
        log.info("질문 목록");
    }
    
}
