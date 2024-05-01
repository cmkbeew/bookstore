package org.fullstack4.bookstore.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.sql.DataSource;
import java.sql.Connection;
import java.time.LocalDate;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class CommunityMapperTests {

    @Autowired(required = false)
    CommunityMapper communityMapper;

    @Test
    public void testNoticeList() {
//        List<NoticeVO> list = communityMapper.noticeList();

//        log.info("list : " + list.toString());
    }

    @Test
    public void testRegist() {
        QnaVO qnaVO = QnaVO.builder()
                .ref(2)
                .writer("test1")
                .title("제목 테스트")
                .content("내용 테스트")
                .build();

    int result = communityMapper.qnaRegist(qnaVO);

    log.info(result);
    log.info(qnaVO);

    }
}
