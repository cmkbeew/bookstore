package org.fullstack4.bookstore.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.NoticeDTO;
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
}
