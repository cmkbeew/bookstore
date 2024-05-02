package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDTO {
    // 결제 관련
    private int order_idx;
    private String pay_method;
    @NotBlank(message = "택배 회사를 선택하세요")
    private String delivery_company;
    private int pay_price;
    private LocalDate pay_date;
    private LocalDate pay_cancel_date;

    // 주문자 정보
    private String member_id;
    @NotBlank(message = "이름을 입력하세요.")
    private String name;
    @NotBlank(message = "휴대폰 번호를 입력하세요.")
    private String phone_num;
    @NotBlank(message = "이메일을 입력하세요.")
    @Pattern(regexp = "[a-z0-9]+@[a-z]+\\.[a-z]{2,3}", message = "이메일 형식에 맞추어 입력하세요.")
    private String email;

    // 수취자 정보
    @NotBlank(message = "받는 고객의 이름을 입력하세요.")
    private String receiver_name;
    @NotBlank(message = "받는 고객의 휴대폰 번호를 입력하세요.")
    private String receiver_phone_num;

    @NotBlank(message = "우편번호를 입력하세요.")
    private String zipcode;
    private String receiver_addr;

    @NotBlank(message = "주소를 입력하세요.")
    private String addr1;
    @NotBlank(message = "상세주소를 입력하세요.")
    private String addr2;

    private String order_code;

    public String getReceiver_addr() {
        return addr1 + " " + addr2;
    }
}
