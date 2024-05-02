package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailVO {
    private int order_idx;
    private String pay_method;
    private String delivery_company;
    private int pay_price;
    private LocalDate pay_date;
    private LocalDate pay_cancel_date;
    private String member_id;
    private String name;
    private String phone_num;
    private String email;
    private String receiver_name;
    private String receiver_phone_num;
    private String zipcode;
    private String receiver_addr;
    private String order_code;
    private int order_item_idx;
    private String product_name;
    private int product_cnt;
    private int price;
    private int discount;
    private int discount_price;
    private int order_price;
}
