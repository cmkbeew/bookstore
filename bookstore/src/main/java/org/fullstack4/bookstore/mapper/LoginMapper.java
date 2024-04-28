package org.fullstack4.bookstore.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.bookstore.domain.MemberVO;

public interface LoginMapper {
    MemberVO login_info(@Param("member_id") String member_id, @Param("pwd") String pwd);
    String search_id(@Param("name") String name, @Param("email") String email);
    int search_pwd(@Param("name") String name, @Param("email") String email, @Param("member_id") String member_id);
    int change_pwd(@Param("member_id") String member_id, @Param("pwd") String pwd);

}
