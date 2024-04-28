package org.fullstack4.bookstore.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.MemberVO;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.fullstack4.bookstore.service.MemberServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class MemberMapperTests {
    @Autowired(required = false)
    MemberMapper memberMapper;
    @Test
    public void test_join() {
        MemberVO memberVO = MemberVO.builder()
                .member_idx(2)
                .member_id("aaa")
                .name("a")
                .pwd("212")
                .email("22@22.22")
                .phone_num("010-1111-2222")
                .addr1("경기 경기 경기")
                .addr2("경기 경기")
                .zipcode("000222")
                .forever_yn("Y")
                .option("Y")
                .build();
        log.info("memberVO : " + memberVO);

        int result = memberMapper.join(memberVO);
        log.info("MemberServiceMapper >> result : " + result);
    }
}
