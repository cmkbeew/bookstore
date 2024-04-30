package org.fullstack4.bookstore.domain;

import lombok.*;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
    private int review_idx;
    private String title;
    private String content;
    private String writer;
    private String grade;
    private LocalDate reg_date;
    private LocalDate modify_date;

    private int product_idx;
}
