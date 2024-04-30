package org.fullstack4.bookstore.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static java.time.LocalDate.now;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class MemberServiceTests {
    @Autowired(required = false)
    private MemberServiceIf memberServiceIf;
    @Test
    public void test_join() {
        MemberDTO memberDTO = MemberDTO.builder()
                .member_id("aaa")
                .name("a")
                .pwd("212")
                .email("22@22.22")
                .phone_num("010-1111-2222")
                .addr1("경기 경기 경기")
                .addr2("경기 경기")
                .zipcode("000222")
                .forever_yn("Y")
                .option("N")
                .reg_date(now())
                .build();
        int result = memberServiceIf.join(memberDTO);
    }
    @Test
     public void test_info() {
        MemberDTO memberDTO = MemberDTO.builder()
                .member_id("ty")
                .build();
        log.info(memberServiceIf.info_view(memberDTO.getMember_id()));
    }

    @Test
    public void test_infoModify() {
        MemberDTO memberDTO = MemberDTO.builder()
                .member_id("aaa")
                .email("22@22.22")
                .phone_num("010-1111-2222")
                .addr1("경기 경sdsds기")
                .addr2("경기 ddd")
                .zipcode("000222")
                .forever_yn("N")
                .option("Y")
                .build();
        log.info(memberServiceIf.info_modify(memberDTO));
    }
    @Test
    public void curr_pwd() {
        MemberDTO memberDTO = MemberDTO.builder()
                .member_id("ty")
                .build();
        log.info(memberServiceIf.curr_pwd(memberDTO.getMember_id()));
    }

    @Test
    public void cnt_pwd() {
        MemberDTO memberDTO = MemberDTO.builder()
                .member_id("jy")
                .build();
        log.info(memberServiceIf.idCheck(memberDTO.getMember_id()));
    }
}
