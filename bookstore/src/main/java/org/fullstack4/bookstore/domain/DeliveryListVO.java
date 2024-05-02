package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryListVO {
    private int pay_idx;
    private LocalDate pay_date;
    private String member_id;
    private String product_name;
    private int product_cnt;
    private String delivery_state;
    private String tracking_num;

}
