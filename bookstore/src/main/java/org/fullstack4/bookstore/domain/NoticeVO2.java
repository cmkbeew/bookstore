package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
    private int notice_idx;
    private String title;
    private String member_id;
    private String content;
    private LocalDate reg_date;
    private String org_file_name;
    private String save_file_name;
    private String fix_state;
}
