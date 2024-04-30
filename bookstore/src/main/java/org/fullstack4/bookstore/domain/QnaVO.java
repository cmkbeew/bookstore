package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class QnaVO {
    private int idx;
    private int ref;
    private String title;
    private String content;
    private String writer;
    private int read_cnt;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String reply_state;
}
