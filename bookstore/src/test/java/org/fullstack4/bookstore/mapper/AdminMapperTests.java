package org.fullstack4.bookstore.mapper;

import jdk.nashorn.internal.parser.JSONParser;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
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

    @Test
    public void testGetJSON() {
        Map<String, Object> json = adminMapper.getJSON();

        log.info("json : " + json.get("member_id"));
    }
}
