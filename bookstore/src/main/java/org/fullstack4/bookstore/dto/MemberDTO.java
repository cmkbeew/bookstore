package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
//    @PositiveOrZero
    private int member_idx;
    @NotBlank
    @Pattern(regexp = "^[a-z0-9]{4,16}", message = "4~16자의 영어, 숫자만 입력 가능합니다.")
    private String member_id;
    @NotBlank
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}", message = "8~16자의 영어, 특수기호만 입력 가능합니다.")
    private String pwd;
    private String name;
    @NotBlank
    private String addr1;
    private String addr2;
    @NotBlank
    private String zipcode;
    private String phone_num1;
    private String phone_num2;
    private String phone_num3;
    private String phone_num;
    @NotBlank
//    @Pattern(regexp = "\"[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\\\\w+\\\\.)+\\\\w+$\"", message = "email@email.com 형식으로 입력해주세요")
    private String email;
    @NotBlank
    private String forever_yn;
    private String option;
    private int point;
    private int mileage;
    private String member_state;
    private String join_state;
    private LocalDate reg_date;
    private LocalDate leave_date;
    public void setPhoneNum (String f, String s, String t) {
        this.phone_num = f+"-"+s+"-"+t;
    }
}

