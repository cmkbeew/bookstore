package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;

@ToString
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class QnaDTO {
    private int qna_idx;
    private String title;
    private String content;
    private String writer;
    private int read_cnt;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String reply_state;
}
