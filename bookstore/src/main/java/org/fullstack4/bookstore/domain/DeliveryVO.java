package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryVO {
    private int pay_idx;
    private String delivery_company;
    private String company_tel;
    private String tracking_num;
    private String delivery_state;
    private LocalDate start_date;
    private LocalDate arrive_date;
}
