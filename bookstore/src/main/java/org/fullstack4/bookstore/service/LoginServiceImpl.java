package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.MemberVO;
import org.fullstack4.bookstore.dto.LoginDTO;
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
    public LoginDTO login_info(LoginDTO loginDTO) {
        LoginDTO loginDTO1 = loginDTO;
    log.info("===============================");
    log.info("memberId, pwd : " + loginDTO);
    log.info("===============================");

    MemberVO memberVO = loginXmlMapper.login_info(loginDTO.getMember_id(), loginDTO.getPwd());
        log.info("memberVO : " +memberVO);

    if( memberVO != null && memberVO.getPwd().equals(loginDTO.getPwd())){
        loginDTO = modelMapper.map(memberVO, LoginDTO.class);
        log.info("loginserviceimpl >> 넘어옴>>> 제발,,, : "+loginDTO.toString());
        if(loginDTO1.getSave_id() != null) {
            loginDTO.setSave_id(loginDTO1.getSave_id());
        }
        if(loginDTO1.getAuto_login() != null) {
            loginDTO.setAuto_login(loginDTO1.getAuto_login());
        }
        if(loginDTO.getSave_id() == null) {
            loginDTO.setSave_id("");
        }
        if(loginDTO.getAuto_login() == null) {
            loginDTO.setAuto_login("");
        }
        return loginDTO;
    }else{
        return null;
        }
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

    @Override
    public int search_pwd(String name, String email, String member_id) {
        log.info("===============================");
        log.info("name, email, member_id: " + name, email, member_id);
        log.info("===============================");
         loginXmlMapper.search_pwd(name, email, member_id);
        log.info("memberid : "+loginXmlMapper.search_pwd(name, email, member_id));
        return loginXmlMapper.search_pwd(name, email, member_id);
    }

    @Override
    public int change_pwd(String member_id, String pwd) {
        log.info("===============================");
        log.info("member_id, pwd: " +member_id,  pwd);
        log.info("===============================");
        loginXmlMapper.change_pwd(member_id, pwd);
        log.info("memberid : "+loginXmlMapper.change_pwd(member_id, pwd));
        return loginXmlMapper.change_pwd(member_id, pwd);
    }


}
