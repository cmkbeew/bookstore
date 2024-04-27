package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO2 {
    private int idx;
    private String title;
    private String writer;
    private String content;
    private LocalDate reg_date;
    private String org_file_name;
    private String save_file_name;
    private String fix_state;
}
