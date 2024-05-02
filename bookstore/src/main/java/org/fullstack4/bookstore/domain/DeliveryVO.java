package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryVO {
    private int delivery_idx;
    private String tracking_num;
    private String delivery_company;
    private String receiver_name;
    private String receiver_phone_num;
    private String zipcode;
    private String receiver_addr;
    private String delivery_state;
    private LocalDate start_date;
    private LocalDate arrive_date;

    private String member_id;
    private int pay_idx;
}
