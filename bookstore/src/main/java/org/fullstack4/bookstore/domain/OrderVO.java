package org.fullstack4.bookstore.domain;

import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
    // 결제 관련
    private int order_idx;
    private String pay_method;
    private String delivery_company;
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
    private String zipcode;
    private String receiver_addr;

    private String addr1;
    private String addr2;

    private String order_code;
}
