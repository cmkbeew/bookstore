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
    private String org_file_name;
    private String save_file_name;

    public void setDisplay_price (int price, int discount) {
        this.display_price = (int)(price * ((double)(100-discount)/100));
    }

    public int getDisplay_price() {
        return display_price * product_cnt;
    }
}
