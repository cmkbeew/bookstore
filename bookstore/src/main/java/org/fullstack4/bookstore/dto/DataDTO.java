package org.fullstack4.bookstore.dto;


import lombok.*;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DataDTO {
    private int data_idx;
    private String title;
    private String content;
    private String writer;
    private String org_file_name;
    private String save_file_name;
    private LocalDate reg_date;
    private LocalDate modify_date;
}
