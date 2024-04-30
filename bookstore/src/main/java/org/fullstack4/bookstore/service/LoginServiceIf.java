package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.dto.LoginDTO;
import org.fullstack4.bookstore.dto.MemberDTO;

public interface LoginServiceIf {
    LoginDTO login_info(LoginDTO loginDTO);
    String search_id(String name, String email);
    int search_pwd(String name, String email, String member_id);
    int change_pwd(String member_id, String pwd);
}
