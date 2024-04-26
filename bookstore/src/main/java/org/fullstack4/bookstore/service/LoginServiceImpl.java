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
    private final LoginMapper loginMapper;
    private final ModelMapper modelMapper;
    @Override
    public MemberDTO login_info(String member_id, String pwd) {
    log.info("===============================");
    log.info("memberId, pwd : " + member_id, pwd);
    log.info("===============================");

    MemberVO memberVO = loginMapper.login_info(member_id, pwd);

    MemberDTO memberDTO = null;

    if( memberVO != null && memberVO.getPwd().equals(pwd)){
        memberDTO = modelMapper.map(memberVO, MemberDTO.class);
    }
        return memberDTO;
    }
}
