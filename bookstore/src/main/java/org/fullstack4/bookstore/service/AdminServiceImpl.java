package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.FaqVO;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.FaqDTO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.dto.QnaDTO;
import org.fullstack4.bookstore.mapper.AdminMapper;
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
    public List<NoticeDTO> noticeList() {
        List<NoticeVO> voList = adminMapper.noticeList();

        List<NoticeDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, NoticeDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public NoticeDTO noticeView(int idx) {
        NoticeVO noticeVO = adminMapper.noticeView(idx);

        NoticeDTO noticeDTO = modelMapper.map(noticeVO, NoticeDTO.class);

        return noticeDTO;
    }

    @Override
    public List<FaqDTO> faqList() {
        List<FaqVO> voList = adminMapper.faqList();

        List<FaqDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, FaqDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public FaqDTO faqView(int idx) {
        FaqVO faqVO = adminMapper.faqView(idx);

        FaqDTO faqDTO = modelMapper.map(faqVO, FaqDTO.class);

        return faqDTO;
    }

    @Override
    public List<QnaDTO> qnaList() {
        List<QnaVO> voList = adminMapper.qnaList();

        List<QnaDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public QnaDTO qnaView(int idx) {
        QnaVO qnaVO = adminMapper.qnaView(idx);

        QnaDTO qnaDTO = modelMapper.map(qnaVO, QnaDTO.class);

        return qnaDTO;
    }
}
