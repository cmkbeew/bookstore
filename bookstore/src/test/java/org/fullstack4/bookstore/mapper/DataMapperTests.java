package org.fullstack4.bookstore.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.DataVO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class DataMapperTests {

    @Autowired(required = false)
    DataMapper dataMapper;

    @Test
    public void testRegistData() {
        DataVO dataVO = DataVO.builder()
                .data_idx(1)
                .title("자료실 게시판 제목")
                .content("자료실 게시판 내용입니다.")
                .writer("또이스토리")
                .org_file_name("original file name")
                .save_file_name("save file name")
                .build();

        int result = dataMapper.dataRegist(dataVO);
    }
}
