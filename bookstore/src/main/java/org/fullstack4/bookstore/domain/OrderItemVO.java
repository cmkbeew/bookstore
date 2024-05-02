package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemVO {
    private int order_item_idx;
    private String order_code;
    private String member_id;
    private int product_idx;
    private String product_name;
    private int product_cnt;
    private LocalDate order_date;
    private int price;
    private int discount;
    private int discount_price;
    private int order_price;
}
