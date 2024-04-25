package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.mapper.CommunityMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {

    private final CommunityMapper communityMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<NoticeDTO> noticeList() {
        List<NoticeVO> voList = communityMapper.noticeList();

        List<NoticeDTO> dtoList = voList.stream()
                                        .map(vo -> modelMapper.map(vo, NoticeDTO.class))
                                        .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public NoticeDTO noticeView(int notice_idx) {
        NoticeVO noticeVO = communityMapper.noticeView(notice_idx);

        NoticeDTO noticeDTO = modelMapper.map(noticeVO, NoticeDTO.class);

        return noticeDTO;
    }
}
