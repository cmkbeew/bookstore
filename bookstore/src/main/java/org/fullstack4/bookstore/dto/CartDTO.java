package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;

@ToString
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {
    private int cart_idx;
    private String or_member_id;
    private int product_idx;
    private int product_cnt;
    private LocalDate order_date;
}
