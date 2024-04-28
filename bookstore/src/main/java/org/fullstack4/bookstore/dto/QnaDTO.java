package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QnaDTO {
    private int idx;
    private String title;
    private String content;
    private String writer;
    private int read_cnt;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String reply_state;
}
