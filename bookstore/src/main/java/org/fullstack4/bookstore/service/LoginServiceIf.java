package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.dto.MemberDTO;

public interface LoginServiceIf {
    MemberDTO login_info(String member_id, String pwd);
}
