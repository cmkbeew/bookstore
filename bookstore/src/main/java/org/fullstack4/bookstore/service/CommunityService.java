package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.dto.NoticeDTO;

import java.util.List;

public interface CommunityService {

    List<NoticeDTO> noticeList();

    NoticeDTO noticeView(int notice_idx);
}
