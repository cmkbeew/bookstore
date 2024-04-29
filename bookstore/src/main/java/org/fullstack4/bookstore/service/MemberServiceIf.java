package org.fullstack4.bookstore.service;
import org.fullstack4.bookstore.dto.MemberDTO;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface MemberServiceIf {

    int join(MemberDTO memberDTO);
    int idCheck(String member_id);
    MemberDTO info_view(String member_id);
    int info_modify(MemberDTO memberDTO);
    String curr_pwd(String member_id);
    int delete_member(String member_id);
}
