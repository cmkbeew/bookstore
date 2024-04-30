package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QnaDTO {
    private int idx;
    private int ref;

    @NotBlank(message = "제목을 입력하세요.")
    @Length(min = 1, max = 50, message = "1~50자 이내로 입력하세요.")
    private String title;

    @NotBlank(message = "내용을 입력하세요.")
    private String content;

    @NotBlank(message = "작성자를 입력하세요.")
    private String writer;
    private int read_cnt;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String reply_state;
}
