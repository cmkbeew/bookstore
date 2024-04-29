package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.MemberVO;
import org.fullstack4.bookstore.dto.MemberDTO;
import org.fullstack4.bookstore.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{

    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;

    @Override
    public int join(MemberDTO memberDTO) {
        log.info("====================================================");
        log.info("MemberServiceImpl >> join(MemberDTO) : " + memberDTO.toString());
        log.info("====================================================");
        if (memberDTO.getOption() == null) {
            memberDTO.setOption("N");
        }
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.join(memberVO);

        log.info("MemberServiceImpl >> memberVO : " + memberVO.toString());
        log.info("MemberServiceImpl >> result : " + result);
        return result;
    }


    @Override
    public int idCheck(String member_id) {
        log.info("===============================");
        int result = memberMapper.idCheck(member_id);
        log.info("member_id: " +  result);
        log.info("===============================");
        return result;
    }

    @Override
    public MemberDTO info_view(String member_id) {
        log.info("====================================================");
        log.info("MemberServiceImpl >> info_view(member_id) : " + member_id);
        log.info("====================================================");

        MemberVO memberVO = memberMapper.info_view(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);

        return memberDTO;
    }

    @Override
    public int info_modify(MemberDTO memberDTO) {
        log.info("====================================================");
        log.info("MemberServiceImpl >> info_modify(memberDTO) : " + memberDTO.toString());
        log.info("====================================================");

        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.info_modify(memberVO);
        log.info("MemberServiceImpl >> memberVO : " + memberVO.toString());
        log.info("MemberServiceImpl >> result : " + result);
        return result;
    }

    @Override
    public String curr_pwd(String member_id) {
        log.info("====================================================");
        log.info("MemberServiceImpl >> curr_pwd(member_id) : ");
        log.info("====================================================");
        String pwd = memberMapper.curr_pwd(member_id);
        log.info("pwd : "+pwd);
        return pwd;
    }

    @Override
    public int delete_member(String member_id) {
        log.info("====================================================");
        log.info("MemberServiceImpl >> delete_member(member_id) : ");
        log.info("====================================================");
        int result = memberMapper.delete_member(member_id);
        log.info("delete_member " + result);
        return result;
    }

}
