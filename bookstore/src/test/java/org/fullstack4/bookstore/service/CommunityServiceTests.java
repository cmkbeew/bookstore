package org.fullstack4.bookstore.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.dto.QnaDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class CommunityServiceTests {

    @Autowired(required = false)
    CommunityService communityService;

    @Test
    public void testNoticeListService() {
//        List<NoticeDTO> noticeDTOList = communityService.noticeList();

//        log.info("noticeDTOList : " + noticeDTOList);
    }

    @Test
    public void testQnaRegist() {
        QnaDTO qnaDTO = QnaDTO.builder()
                .ref(2)
                .writer("user22")
                .title("제목 테스트22")
                .content("내용 테스트22")
                .build();
        int result = communityService.qnaRegist(qnaDTO);
        log.info(result);
        log.info(qnaDTO);
    }
}
