package org.fullstack4.bookstore.mapper;

import lombok.extern.log4j.Log4j2;

import org.fullstack4.bookstore.domain.DataVO;
import org.fullstack4.bookstore.domain.MemberVO;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.dto.PageRequestDTO;
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
//    public void testMember() {
//
//        MemberDTO memberDTO = MemberDTO.builder()
//                .member_idx(2)
//                .build();
//
//        List<MemberVO> memberVO2 = adminMapper.memberList();
//
//    log.info("member : " + memberDTO);
//    }

    @Test
    public void testBbsListByPage() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(10)
                .build();

        List<NoticeVO> bbsList = adminMapper.noticeListByPage(pageRequestDTO);
        log.info("=====================================================");
        bbsList.forEach(list -> log.info(list));
        log.info("=====================================================");
    }

    @Test
    public void testNoticeRegist() {
        NoticeVO noticeVO = NoticeVO.builder()
                .content("공지사항 내용")
                .title("mapper test 중")
                .org_file_name("file.pdf")
                .save_file_name("save.pdf")
                .build();

        int result = adminMapper.noticeRegist(noticeVO);
    }

    @Test
    public void testNoticeModify() {
        NoticeVO noticeVO = NoticeVO.builder()
                .title("공지사항 (수정)")
                .idx(31)
                .build();

        int result = adminMapper.noticeModify(noticeVO);
    }


}
