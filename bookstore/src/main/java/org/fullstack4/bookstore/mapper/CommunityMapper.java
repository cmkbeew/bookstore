package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.NoticeVO;

import java.util.List;

public interface CommunityMapper {

    List<NoticeVO> noticeList();

    NoticeVO noticeView(int notice_idx);
}
