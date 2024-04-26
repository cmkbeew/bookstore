package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;

@ToString
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FaqDTO {
    private int faq_idx;
    private String title;
    private String content;
    private String writer;
    private LocalDate reg_date;
    private LocalDate modify_date;
}
