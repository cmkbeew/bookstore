package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
    private int cart_idx;
    private String or_member_id;
    private int product_idx;
    private int product_cnt;
    private LocalDate order_date;
}
