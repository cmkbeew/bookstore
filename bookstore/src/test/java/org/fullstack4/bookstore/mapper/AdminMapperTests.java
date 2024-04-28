package org.fullstack4.bookstore.mapper;

import lombok.extern.log4j.Log4j2;

import org.fullstack4.bookstore.domain.MemberVO;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;


import java.util.List;
import java.util.Map;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class AdminMapperTests {

    @Autowired(required = false)
    AdminMapper adminMapper;

//    @Test
//    public void testPrev() {
//        NoticeVO2 noticeVO = NoticeVO2.builder()
//                .idx(7)
//                .build();
//
//
//        NoticeVO2 noticeVO2 = adminMapper.prevNotice(noticeVO.getIdx());
//
//        log.info("prev : " + noticeVO2);
//    }

    @Test
    public void testMember() {

        MemberDTO memberDTO = MemberDTO.builder()
                .member_idx(2)
                .build();

        List<MemberVO> memberVO2 = adminMapper.memberList();

    log.info("member : " + memberDTO);
    }
}
