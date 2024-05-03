package org.fullstack4.bookstore.dto;

import lombok.*;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@ToString
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    @PositiveOrZero
    private int product_idx;

    @NotBlank(message="상품명을 입력하세요.")
    @Length(min=1, max=50, message = "1~50자 이내로 입력하세요.")
    private String product_name;

    @NotBlank(message = "내용을 입력하세요.")
    private String product_content;

    @NotBlank(message = "출판사를 입력하세요.")
    @Length(min=1, max=50, message = "1~50자 이내로 입력하세요.")
    private String publisher;

    @NotBlank(message = "저자를 입력하세요.")
    @Length(min=1, max=50, message = "1~50자 이내로 입력하세요.")
    private String author;

    private int page_cnt;
    private int price;

    private LocalDate publish_date;

    @NotBlank(message = "유형을 입력하세요.")
    @Length(min=1, max=50, message = "1~50자 이내로 입력하세요.")
    private String type;

    @NotBlank(message = "학년을 입력하세요.")
    @Length(min=1, max=50, message = "1~50자 이내로 입력하세요.")
    private String grade;

    @NotBlank(message = "과목을 입력하세요.")
    @Length(min=1, max=50, message = "1~20자 이내로 입력하세요.")
    private String subject;

    @Builder.Default
    private int discount=0;
    private String tax_yn;
    private LocalDate reg_date;

    private int display_price;

    public void setDisplay_price (int price, int discount) {
        this.display_price = (int)(price * ((double)(100-discount)/100));
    }
}
