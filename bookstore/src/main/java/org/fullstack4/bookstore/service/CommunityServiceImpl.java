package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.FaqVO;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.*;
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
    public PageResponseDTO<NoticeDTO> noticeList(PageRequestDTO pageRequestDTO) {
        List<NoticeVO> voList = communityMapper.noticeList(pageRequestDTO);

        List<NoticeDTO> dtoList = voList.stream()
                                        .map(vo -> modelMapper.map(vo, NoticeDTO.class))
                                        .collect(Collectors.toList());

        int total_count = communityMapper.noticeTotalCount(pageRequestDTO);

        PageResponseDTO<NoticeDTO> responseDTO = PageResponseDTO.<NoticeDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int noticeTotalCount(PageRequestDTO pageRequestDTO) {
        return communityMapper.noticeTotalCount(pageRequestDTO);
    }

    @Override
    public NoticeDTO noticeView(int notice_idx) {
        NoticeVO noticeVO = communityMapper.noticeView(notice_idx);

        NoticeDTO noticeDTO = modelMapper.map(noticeVO, NoticeDTO.class);

        return noticeDTO;
    }

    @Override
    public PageResponseDTO<FaqDTO> faqList(PageRequestDTO pageRequestDTO) {
        List<FaqVO> voList = communityMapper.faqList(pageRequestDTO);

        List<FaqDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, FaqDTO.class))
                .collect(Collectors.toList());

        int total_count = communityMapper.faqTotalCount(pageRequestDTO);

        PageResponseDTO<FaqDTO> responseDTO = PageResponseDTO.<FaqDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int faqTotalCount(PageRequestDTO requestDTO) {
        return communityMapper.faqTotalCount(requestDTO);
    }

    @Override
    public FaqDTO faqView(int faq_idx) {
        FaqVO faqVO = communityMapper.faqView(faq_idx);

        FaqDTO faqDTO = modelMapper.map(faqVO, FaqDTO.class);

        return faqDTO;
    }

    @Override
    public PageResponseDTO<QnaDTO> qnaList(PageRequestDTO pageRequestDTO) {
        List<QnaVO> voList = communityMapper.qnaList(pageRequestDTO);

        List<QnaDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());

        int total_count = communityMapper.qnaTotalCount(pageRequestDTO);

        PageResponseDTO<QnaDTO> responseDTO = PageResponseDTO.<QnaDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

    @Override
    public int qnaTotalCount(PageRequestDTO requestDTO) {
        return communityMapper.qnaTotalCount(requestDTO);
    }

    @Override
    public QnaDTO qnaView(int qna_idx) {
        QnaVO qnaVO = communityMapper.qnaView(qna_idx);

        QnaDTO qnaDTO = modelMapper.map(qnaVO, QnaDTO.class);

        return qnaDTO;
    }

    @Override
    public int qnaRegist(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);

        int result = communityMapper.qnaRegist(qnaVO);

        return result;
    }
}
