package org.fullstack4.bookstore.dto;

import lombok.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.Random;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryDTO {
    private int delivery_idx;
    private String tracking_num;
    private String receiver_name;
    private String receiver_phone_num;
    private String zipcode;
    private String receiver_addr;
    private String delivery_state;
    private LocalDate start_date;
    private LocalDate arrive_date;

    private String addr1;
    private String addr2;
    private String member_id;

    private int pay_idx;

    public String getTracking_num() {
        Random rand = new Random();
        int createNum = 0;
        String strNum = "";
        String resultNum = "";
        for(int i=0; i< 10; i++) {
            createNum = rand.nextInt(9);
            strNum = Integer.toString(createNum);
            resultNum += strNum;
        }

        return resultNum;
    }

    public String getReceiver_addr() {
        return this.addr1 + " " + this.addr2;
    }
}
