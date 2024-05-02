package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemDTO {
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

    public void setDiscount_price(int discount_price) {
        this.discount_price = (int)(price * ((double)(100-discount)/100));
    }
}
