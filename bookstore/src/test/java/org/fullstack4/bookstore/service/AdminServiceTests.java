package org.fullstack4.bookstore.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.FaqDTO;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.dto.QnaDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static java.time.LocalDate.now;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class AdminServiceTests {
    @Autowired(required = false)
    private AdminService adminService;
    @Test
    public void testNoticeRegist() {
        NoticeDTO noticeDTO = NoticeDTO.builder()
                .content("공지사항 내용")
                .title("service test 중")
                .org_file_name("file.pdf")
                .save_file_name("save.pdf")
                .build();

        int result = adminService.noticeRegist(noticeDTO);
    }

    @Test
    public void testReplyDelete() {
        QnaDTO qnaDTO = QnaDTO.builder()
                .idx(12)
                .build();
        int result = adminService.qnaDelete(qnaDTO.getIdx());
    }

}
