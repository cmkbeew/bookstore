package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
    private int idx;
    private String title;
    private String content;
    private String writer;
    private LocalDate reg_date;
    private String org_file_name;
    private String save_file_name;
    private String fix_state;
}
