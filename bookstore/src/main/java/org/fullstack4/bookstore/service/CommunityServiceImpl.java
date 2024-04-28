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

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

        // 보여지는 내용 길이 설정
        for(FaqDTO dto : dtoList) {
            dto.setContent(dto.getContent().replace("\r\n", " "));
            if(dto.getContent().length() >= 20) {
                dto.setContent(dto.getContent().substring(0, 20) + ".....");
            }
        }

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

//    @Override
//    public FaqDTO faqView(int faq_idx) {
//        FaqVO faqVO = communityMapper.faqView(faq_idx);
//
//        FaqVO faqPrev = communityMapper.faqPrev(faq_idx);
//        FaqVO faqNext = communityMapper.faqNext(faq_idx);
//
//        FaqDTO faqDTO = modelMapper.map(faqVO, FaqDTO.class);
//        FaqDTO faqPrevDTO = modelMapper.map(faqPrev, FaqDTO.class);
//        FaqDTO faqNextDTO = modelMapper.map(faqNext, FaqDTO.class);
//
//        log.info("faqPrevDTO : " + faqPrevDTO);
//        log.info("faqNextDTO : " + faqNextDTO);
//
//        return faqDTO;
//    }


    @Override
    public Map<String, FaqDTO> faqView(int faq_idx) {
        Map<String, FaqDTO> maps = new HashMap<>();

        FaqVO faqVO = communityMapper.faqView(faq_idx);
        FaqVO faqPrevVO = communityMapper.faqPrev(faq_idx);
        FaqVO faqNextVO = communityMapper.faqNext(faq_idx);

        FaqDTO faqDTO = modelMapper.map(faqVO, FaqDTO.class);
        maps.put("faqDTO", faqDTO);

        if(faqPrevVO != null) {
            FaqDTO faqPrevDTO = modelMapper.map(faqPrevVO, FaqDTO.class);
            maps.put("faqPrevDTO", faqPrevDTO);
        }
        if(faqNextVO != null) {
            FaqDTO faqNextDTO = modelMapper.map(faqNextVO, FaqDTO.class);
            maps.put("faqNextDTO", faqNextDTO);
        }

        return maps;
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
