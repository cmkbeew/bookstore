package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.CartDTO;
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
import java.util.Map;

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
                        @RequestParam(name="member_id", defaultValue = "") String member_id,
                        Model model,
                        HttpSession session
                        ) {
        log.info("장바구니");
//        String member_id = session.getAttribute("member_id").toString();
        log.info("member Id : " + member_id);
        List<CartListDTO> cartList = myServiceIf.cart_list(member_id);
        log.info("cartList : " +  cartList);
        model.addAttribute("cartList", cartList);


    }
    @PostMapping("/updateCnt")
    @ResponseBody
    public String updateCnt(@RequestParam(name = "cart_idx") String cart_idx,
                          @RequestParam(name = "product_cnt") int product_cnt,
                          @RequestParam(name = "or_member_id") String or_member_id) {
        log.info("cart_idx : " + cart_idx);
        log.info("product_cnt : " + product_cnt);

        myServiceIf.update_cnt(cart_idx, product_cnt, or_member_id);

        return "/my/cart?member_id=" + or_member_id;
    }

    @PostMapping("deleteCart")
    public String deleteCart(@RequestParam(name="")
                             HttpServletRequest req,HttpSession Session,
                             RedirectAttributes redirectAttributes) {
        String memberId = Session.getAttribute("member_id").toString();
        String[] delete_idx = req.getParameterValues("select");
        int result = 0;

        for( int i = 0 ; i < delete_idx.length; i++) {
            int intIdx = Integer.parseInt(delete_idx[i]);
            result = myServiceIf.deleteCart(intIdx);
        }
        if (result > 0) {
            return "redirect:/my/cart?member_id="+memberId;
        } else {
            redirectAttributes.addFlashAttribute("error", "삭제되지 않았습니다.");
            return "redirect:/my/cart?member_id"+memberId;
        }
    }

    @PostMapping("/cart/add")
    @ResponseBody
    public String addCart(@RequestBody CartDTO cartDTO) {
        int result = myServiceIf.cart_add(cartDTO);

        if(result > 0) {
            return "Y";
        } else {
            return "N";
        }
    }

    @GetMapping("/cartModify")
    public void cartModifyGet() {
        log.info("장바구니수정");
    }
    @GetMapping("/qna")
    public void qnaGet() {
        log.info("질문 목록");
    }


    @GetMapping("/payment")
    public void cartPay(@RequestParam(name="member_id") String member_id,
                        Model model) {
        // 장바구니 전체 리스트
        List<CartListDTO> cartList = myServiceIf.cart_list(member_id);
        model.addAttribute("cartList", cartList);
    }
}
