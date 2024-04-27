package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO2 {
    private int idx;
    private String title;
    private String writer;
    private String content;
    private LocalDate reg_date;
    private String org_file_name;
    private String save_file_name;
    private String fix_state;
}
