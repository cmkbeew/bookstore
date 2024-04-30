package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
    private int product_idx;
    private String product_name;
    private String product_content;
    private String publisher;
    private String author;
    private int page_cnt;
    private int price;
    private LocalDate publish_date;
    private String type;
    private String grade;
    private String subject;
    private int discount;
    private String tax_yn;
    private LocalDate reg_date;
}
