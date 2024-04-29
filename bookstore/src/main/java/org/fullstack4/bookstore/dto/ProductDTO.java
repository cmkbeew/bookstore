package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;

@ToString
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    private int product_idx;
    private String product_name;
    private String publisher;
    private String author;
    private int page_cnt;
    private int price;
    private LocalDate publish_date;
    private String category1;
    private String category2;
    private int discount;
    private String tax_yn;
    private LocalDate reg_date;
}
