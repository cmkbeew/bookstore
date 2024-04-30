package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;

@ToString
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class CartListDTO {
    private int cart_idx;
    private int goods_cnt;
    private String or_member_id;
    private LocalDate order_date;
    //    private int product_idx;
    private String product_name;
    private String publisher;
    private String author;
    private int display_price;
    private int price;
    private int discount;

    public void setDisplay_price (int price, int discount) {
        this.display_price = (int)(price * ((double)(100-discount)/100));
    }
}
