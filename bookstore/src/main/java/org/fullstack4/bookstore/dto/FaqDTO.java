package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FaqDTO {
    private int idx;
    @NotBlank(message = "제목을 입력하세요.")
    @Length(min=1, max=50, message = "1~50자 이내로 입력하세요.")
    private String title;

    @NotBlank(message = "내용을 입력하세요.")
    private String content;
    private String writer;
    private LocalDate reg_date;
    private LocalDate modify_date;
}
