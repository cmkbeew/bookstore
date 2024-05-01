package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentVO {
    // 결제 관련
    private int pay_idx;
    private String pay_method;
    private int pay_price;
    private LocalDate pay_date;
    private LocalDate pay_cancel_date;

    // 주문자 정보
    private String member_id;
    private String name;
    private String phone_num;
    private String email;

    // 수취자 정보
    private String receiver_name;
    private String receiver_phone_num;
    private String receiver_addr;

    // 상품 정보
    private int cart_idx;
    private int product_idx;
    private String product_name;
    private int product_cnt;
}
