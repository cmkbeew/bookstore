package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO {
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
    private String addr1;
    private String addr2;

    // 상품 정보
    private int cart_idx;
    private int product_idx;
    private String product_name;
    private int product_cnt;


    public String getReceiver_addr() {
        return addr1 + " " + addr2;
    }

}
