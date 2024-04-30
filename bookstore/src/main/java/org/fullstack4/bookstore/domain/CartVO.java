package org.fullstack4.bookstore.domain;

import lombok.*;

import java.time.LocalDate;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
    private int cart_idx;
    private int order_no;
    private int goods_no;
    private int goods_cnt;
    private String or_member_id;
    private LocalDate order_date;
//    private String receiver;
//    private int zip_code;
//    private String re_addr1;
//    private String re_addr2;
//    private String re_phone_num;
//    private String delivery_state;
//    private String order_state;
}
