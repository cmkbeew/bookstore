package org.fullstack4.bookstore.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
//스프링에 테스트 위임
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class LoginServiceTests {
    @Autowired(required = false)
    private LoginServiceIf loginServiceIf;

    @Test
    public void login_info() {
        MemberDTO memberDTO = MemberDTO.builder()
                .member_id("test")
                .pwd("12")
                .build();
        log.info(loginServiceIf.login_info(memberDTO.getMember_id(), memberDTO.getPwd()));
    }
@Test
    public void search_idTests() {
        MemberDTO memberDTO = MemberDTO.builder()
                .name("test")
                .email("jjj@jjj.ddd")
                .build();
        log.info(loginServiceIf.search_id(memberDTO.getName(), memberDTO.getEmail()));
    }

    @Test
    public void search_pwdTests() {
        MemberDTO memberDTO = MemberDTO.builder()
                .name("test")
                .email("jjj@jjj.ddd")
                .member_id("test")
                .build();
        log.info(loginServiceIf.search_pwd(memberDTO.getName(), memberDTO.getEmail(), memberDTO.getMember_id()));
    }

    @Test
    public void change_pwdTests() {
        MemberDTO memberDTO = MemberDTO.builder()
                .member_id("test")
                .pwd("13")
                .build();
        log.info(loginServiceIf.change_pwd(memberDTO.getMember_id(), memberDTO.getPwd()));
    }
}
