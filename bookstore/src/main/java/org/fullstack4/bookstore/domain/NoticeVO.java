package org.fullstack4.bookstore.domain;

import lombok.*;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
    private int idx;
    private String title;
    private String content;
    private String writer;
    private LocalDate reg_date;
    private String org_file_name;
    private String save_file_name;
    private int fix_state;
}
