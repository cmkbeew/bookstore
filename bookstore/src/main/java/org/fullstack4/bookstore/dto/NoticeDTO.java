package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
    private int notice_idx;
    private String title;
    private String member_id;
    private String content;
    private LocalDate reg_date;
    private String org_file_name;
    private String save_file_name;
    private String fix_state;
}
