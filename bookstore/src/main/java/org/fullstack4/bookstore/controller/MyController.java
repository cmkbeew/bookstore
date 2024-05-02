package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.MyServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
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
    public void orderGet(@RequestParam(name="member_id", defaultValue = "") String member_id,
                         Model model) {
        log.info("결제내역페이지");
        List<DeliveryListDTO> deliveryList = myServiceIf.recent_order(member_id);
        log.info(deliveryList);
        model.addAttribute("deliveryList",deliveryList);


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
        List<CartListDTO> cartList = myServiceIf.cart_list(member_id);

        int total_price = cartList.stream().mapToInt(CartListDTO::getDisplay_price).sum();

        // 배송비
        int shipping = 2500;
        if(total_price >= 15000) {
            shipping = 0;
        }
        model.addAttribute("cartList", cartList);
        model.addAttribute("shipping", shipping);
        model.addAttribute("total_price", total_price);
    }

    @PostMapping("/updateCnt")
    @ResponseBody
    public String updateCnt(@RequestParam(name = "cart_idx") String cart_idx,
                          @RequestParam(name = "product_cnt") int product_cnt,
                          @RequestParam(name = "or_member_id") String or_member_id) {

        myServiceIf.update_cnt(cart_idx, product_cnt, or_member_id);

        return "/my/cart?member_id=" + or_member_id;
    }

    @PostMapping("deleteCart")
    public String deleteCart(
                             HttpServletRequest req,HttpSession Session,
                             RedirectAttributes redirectAttributes) {
        String memberId = Session.getAttribute("member_id").toString();
        String[] delete_idx = req.getParameterValues("select");
        log.info(Arrays.toString(delete_idx));
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
    public void qnaGet(QnaDTO qnaDTO,
                       @RequestParam(name="member_id", defaultValue = "") String member_id,
                       Model model) {
        log.info("myController >> qnaGet()");
        List<QnaDTO> qnaList = myServiceIf.qna_list_all(member_id);
        log.info("qnaList : " +  qnaList);
        model.addAttribute("qnaList", qnaList);

    }

    @GetMapping("/payment")
    public void cartPay(@RequestParam(name="member_id") String member_id,
                        CartDTO cartDTO,
                        ProductDTO productDTO,
                        HttpServletRequest req,
                        Model model) {
        String[] select_idx = req.getParameterValues("select");
        log.info(cartDTO);
        log.info("select Idx : " + Arrays.toString(select_idx));


//        List<CartListDTO> cartList ;
//        if( select_idx.length < 1) {
//            // 장바구니 전체 리스트
//             cartList = myServiceIf.cart_list(member_id);
//        } else {
//            for(int i = 0; i< select_idx.length < i++) {
//                cartList = myServiceIf.cart_selcList(member_id, select_idx[i]);
//            }
//        }
        List<CartListDTO> cartList= myServiceIf.cart_list(member_id);

        // 주문 금액 합계
        int total_price = cartList.stream().mapToInt(CartListDTO::getDisplay_price).sum();

        // 배송비
        int shipping = 2500;
        if(total_price >= 15000) {
            shipping = 0;
        }

        model.addAttribute("cartList", cartList);
        model.addAttribute("total_price", total_price);
        model.addAttribute("shipping", shipping);
    }

    @PostMapping("/payment")
    public String paymentInsert(PaymentDTO paymentDTO, DeliveryDTO deliveryDTO, int[] cart_idx) {
        System.out.println("paymentDTO : " + paymentDTO);
        System.out.println("deliveryDTO : " + deliveryDTO);
        System.out.println("cart_idx[] : " + cart_idx);
        List<CartListDTO> cartList = myServiceIf.cart_list(paymentDTO.getMember_id());
        log.info("cartList : " + cartList);
        for(int i=0; i<cartList.size(); i++) {
            log.info(cartList.get(i).getCart_idx());
            paymentDTO.setPay_price(cartList.get(i).getDisplay_price());
            paymentDTO.setCart_idx(cartList.get(i).getCart_idx());
            paymentDTO.setProduct_idx(cartList.get(i).getProduct_idx());
            paymentDTO.setProduct_name(cartList.get(i).getProduct_name());
            paymentDTO.setProduct_cnt(cartList.get(i).getProduct_cnt());

            // 결제 내역 추가
            myServiceIf.paymentInsert(paymentDTO);
            // 장바구니번호로 결제 내용 불러오기
            PaymentDTO dto = myServiceIf.paymentSelect(cartList.get(i).getCart_idx());
            // 배송 내역에 넣을 결제번호 세팅
            deliveryDTO.setPay_idx(dto.getPay_idx());
            // 배송 내역 추가
            myServiceIf.deliveryInsert(deliveryDTO);
            // 장바구니 삭제
            myServiceIf.deleteCart(cartList.get(i).getCart_idx());
        }

        return "redirect:/my/order?member_id=" + paymentDTO.getMember_id();
    }

    @PostMapping("/paymentNow")
    public String payNow(
            CartDTO cartDTO,
            HttpSession session
    ) {

        myServiceIf.cart_add(cartDTO);

        return "redirect:/my/payment?member_id="+session.getAttribute("member_id");
    }
}
