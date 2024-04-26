package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FaqVO {
    private int faq_idx;
    private String title;
    private String content;
    private String writer;
    private LocalDate reg_date;
    private LocalDate modify_date;
}
