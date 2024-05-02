package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;

@ToString
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryListDTO {
    private int pay_idx;
    private LocalDate pay_date;
    private String member_id;
    private int product_cnt;
    private String delivery_state;
    private int tracking_num;

}
