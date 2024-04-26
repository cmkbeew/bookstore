package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.mapper.AdminMapper;
import org.fullstack4.bookstore.mapper.CommunityMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

    private final AdminMapper adminMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<NoticeDTO2> noticeList() {
        List<NoticeVO2> voList = adminMapper.noticeList();

        List<NoticeDTO2> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, NoticeDTO2.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public NoticeDTO2 noticeView(int idx) {
        NoticeVO2 noticeVO = adminMapper.noticeView(idx);

        NoticeDTO2 noticeDTO = modelMapper.map(noticeVO, NoticeDTO2.class);

        return noticeDTO;
    }

    @Override
    public List<FaqDTO2> faqList() {
        List<FaqVO2> voList = adminMapper.faqList();

        List<FaqDTO2> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, FaqDTO2.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public FaqDTO2 faqView(int idx) {
        FaqVO2 faqVO = adminMapper.faqView(idx);

        FaqDTO2 faqDTO = modelMapper.map(faqVO, FaqDTO2.class);

        return faqDTO;
    }

    @Override
    public List<QnaDTO2> qnaList() {
        List<QnaVO2> voList = adminMapper.qnaList();

        List<QnaDTO2> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, QnaDTO2.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public QnaDTO2 qnaView(int idx) {
        QnaVO2 qnaVO = adminMapper.qnaView(idx);

        QnaDTO2 qnaDTO = modelMapper.map(qnaVO, QnaDTO2.class);

        return qnaDTO;
    }
}
