package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.MemberVO;

import java.util.List;

public interface MemberMapper {
    int join(MemberVO membervo);
    MemberVO info_view(String member_id);
    int info_modify(MemberVO memberVO);
    String curr_pwd(String member_id);
    int delete_member(String member_id);
}
