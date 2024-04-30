package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;
@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartListVO {
    private int cart_idx;
    private String or_member_id;
    private int product_idx;
    private int product_cnt;
    private LocalDate order_date;
    //    private int product_idx;
    private String product_name;
    private String publisher;
    private String author;
    private int display_price;
    private int price;
    private int discount;
}
