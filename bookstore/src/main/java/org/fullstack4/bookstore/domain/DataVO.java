package org.fullstack4.bookstore.domain;


import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DataVO {
    private int data_idx;
    private String title;
    private String content;
    private String writer;
    private String org_file_name;
    private String save_file_name;
    private LocalDate reg_date;
    private LocalDate modify_date;
}
