package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
    @PositiveOrZero
    private int member_idx;
    private String member_id;
    @NotBlank
    private String pwd;
    @NotBlank
    private String name;
    private String addr1;
    private String addr2;
    private int zipcode;
    @NotBlank
    private String phone_num;
    @NotBlank
    private String email;
    private String forever_yn;
    private String option;
    private int point;
    private int mileage;
    private String member_state;
    private String join_state;
    private LocalDate reg_date;
    private LocalDate leave_date;
}
