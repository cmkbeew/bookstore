package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.MemberVO;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.fullstack4.bookstore.mapper.LoginMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginServiceIf{
    private final LoginMapper loginXmlMapper;
    private final ModelMapper modelMapper;
    @Override
    public MemberDTO login_info(String member_id, String pwd) {
    log.info("===============================");
    log.info("memberId, pwd : " + member_id, pwd);
    log.info("===============================");

    MemberVO memberVO = loginXmlMapper.login_info(member_id, pwd);
        log.info("memberVO : " +memberVO);
        log.info("pwd : " +pwd);
    MemberDTO memberDTO = null;

    if( memberVO != null && memberVO.getPwd().equals(pwd)){
        memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        log.info("loginserviceimpl >> 넘어옴>>> 제발,,, : "+memberDTO.toString());
    }
        return memberDTO;
    }

    @Override
    public String search_id(String name, String email) {
        log.info("===============================");
        log.info("name, email : " + name, email);
        log.info("===============================");

        String member_id = loginXmlMapper.search_id(name, email);
        log.info("memberid : "+loginXmlMapper.search_id(name, email));
        return loginXmlMapper.search_id(name, email);
    }


}
