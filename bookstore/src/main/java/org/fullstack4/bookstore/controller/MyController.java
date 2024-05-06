package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.MyServiceIf;
import org.fullstack4.bookstore.util.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

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
    public void orderGet(String delivery_state, String member_id, Model model) {
        List<OrderDetailDTO> orderList = myServiceIf.order_list(delivery_state, member_id);

        model.addAttribute("delivery_state", delivery_state);
        model.addAttribute("orderList", orderList);
    }

    @GetMapping("/orderDetail")
    public void orderPost(String order_code, String delivery_state, Model model) {
        List<OrderDetailDTO> orderDetailDTO = myServiceIf.order_detail(order_code);

        int total_price = orderDetailDTO.stream().mapToInt(OrderDetailDTO::getOrder_price).sum();
        int shipping = 2500;
        if(total_price >= 15000) {
            shipping = 0;
        }

        model.addAttribute("order_code", order_code);
        model.addAttribute("delivery_state", delivery_state);
        model.addAttribute("total_price", total_price);
        model.addAttribute("shipping", shipping);
        model.addAttribute("orderDetailDTO", orderDetailDTO);
    }

    //    @PostMapping("/orderCancelRequest")
//    public String orderCancelRequest(String member_id, String order_code, String delivery_state, Model model) throws UnsupportedEncodingException {
//        int updateToCancel = myServiceIf.orderCancelRequest(member_id, order_code, delivery_state);
//
//        model.addAttribute("updateToCancel", updateToCancel);
//
//        delivery_state = URLEncoder.encode(delivery_state, "utf-8");
//        return "redirect:/my/orderDetail?member_id=" + member_id + "&delivery_state=" + delivery_state + "&order_code=" + order_code;
//    }
    @PostMapping("/orderCancelRequest")
    public String orderCancelRequest(String member_id, String order_code, String delivery_state, Model model) throws UnsupportedEncodingException {
        int result = myServiceIf.orderCancelRequest(member_id, order_code, delivery_state);

        delivery_state = URLEncoder.encode(delivery_state, "utf-8");
        if(result > 0) {
            return "redirect:/my/order?member_id=" + member_id + "&delivery_state=" + delivery_state;
        } else {
            return "redirect:/my/orderDetail?member_id=" + member_id + "&delivery_state=" + delivery_state + "&order_code=" + order_code;
        }
    }

    @GetMapping("/cart")
    public void cartGet(CartListDTO cartListDTO,
                        @RequestParam(name="member_id", defaultValue = "") String member_id,
                        Model model,
//                        HttpServletResponse resp,
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
    public String addCart(@RequestBody CartDTO cartDTO,
                          CartListDTO cartListDTO,
                          HttpServletRequest req,
                          HttpServletResponse resp){
        HttpSession session = req.getSession();
        String member_id = session.getAttribute("member_id").toString();
        int result = myServiceIf.cart_add(cartDTO);
        if(result > 0) {
            int total_cart = myServiceIf.total_cart(member_id);
            CookieUtil.setCookies(resp,"cartCnt",Integer.toString(total_cart),60*60*24,"","/");
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
    public String paymentInsert(@Valid OrderDTO orderDTO,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                OrderItemDTO orderItemDTO,
                                String same_check) throws UnsupportedEncodingException {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("orderDTO", orderDTO);
            redirectAttributes.addFlashAttribute("same_check", same_check);

            return "redirect:/my/payment?member_id=" + orderDTO.getMember_id();
        }
        Random rand = new Random();
        int createNum = 0;
        String strNum = "";
        String resultNum = "";
        for(int i=0; i< 10; i++) {
            createNum = rand.nextInt(9);
            strNum = Integer.toString(createNum);
            resultNum += strNum;
        }
        orderItemDTO.setOrder_code(resultNum);
        orderDTO.setOrder_code(resultNum);

        List<CartListDTO> cartList = myServiceIf.cart_list(orderDTO.getMember_id());

        for(int i=0; i<cartList.size(); i++) {
            orderItemDTO.setProduct_idx(cartList.get(i).getProduct_idx());
            orderItemDTO.setProduct_name(cartList.get(i).getProduct_name());
            orderItemDTO.setProduct_cnt(cartList.get(i).getProduct_cnt());
            orderItemDTO.setPrice(cartList.get(i).getPrice());
            orderItemDTO.setDiscount(cartList.get(i).getDiscount());
            orderItemDTO.setDiscount_price(cartList.get(i).getPrice());
            orderItemDTO.setOrder_price(cartList.get(i).getDisplay_price());

            myServiceIf.order_item_insert(orderItemDTO);
            // 결제한 목록 카트 삭제
            myServiceIf.deleteCart(cartList.get(i).getCart_idx());
        }
        // 결제 정보 넣기
        myServiceIf.order_insert(orderDTO);

        String deliverState = URLEncoder.encode("배송전", "utf-8");
        return "redirect:/my/order?member_id=" + orderDTO.getMember_id() + "&delivery_state=" + deliverState;
    }

    @PostMapping("/paymentNow")
    public String payNow(
            CartDTO cartDTO,
            HttpSession session
    ) {

        myServiceIf.cart_add(cartDTO);

        return "redirect:/my/payment?member_id=" + session.getAttribute("member_id");
    }
}
