package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FaqDTO {
    @PositiveOrZero
    private int faq_idx;
    private String title;
    private String content;
    private String writer;
    private LocalDate reg_date;
    private LocalDate modify_date;
}
