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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public Map<String, NoticeDTO> noticeView(int notice_idx) {
        Map<String, NoticeDTO> maps = new HashMap<>();

        NoticeVO noticeVO = communityMapper.noticeView(notice_idx);
        NoticeVO noticePrevVO = communityMapper.noticePrev(notice_idx);
        NoticeVO noticeNextVO = communityMapper.noticeNext(notice_idx);

        NoticeDTO noticeDTO = modelMapper.map(noticeVO, NoticeDTO.class);
        maps.put("noticeDTO", noticeDTO);

        if(noticePrevVO != null) {
            NoticeDTO noticePrevDTO = modelMapper.map(noticePrevVO, NoticeDTO.class);
            maps.put("noticePrevDTO", noticePrevDTO);
        }
        if(noticeNextVO != null) {
            NoticeDTO noticeNextDTO = modelMapper.map(noticeNextVO, NoticeDTO.class);
            maps.put("noticeNextDTO", noticeNextDTO);
        }

        return maps;
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
    public Map<String, QnaDTO> qnaView(int qna_idx) {
        Map<String, QnaDTO> maps = new HashMap<>();

        QnaVO qnaVO = communityMapper.qnaView(qna_idx);
        QnaVO qnaPrevVO = communityMapper.qnaPrev(qna_idx);
        QnaVO qnaNextVO = communityMapper.qnaNext(qna_idx);

        QnaDTO qnaDTO = modelMapper.map(qnaVO, QnaDTO.class);
        log.info("qnaDTO : " + qnaDTO);

        maps.put("qnaDTO", qnaDTO);

        if(qnaPrevVO != null) {
            QnaDTO qnaPrevDTO = modelMapper.map(qnaPrevVO, QnaDTO.class);
            maps.put("qnaPrevDTO", qnaPrevDTO);
        }
        if(qnaNextVO != null) {
            QnaDTO qnaNextDTO = modelMapper.map(qnaNextVO, QnaDTO.class);
            maps.put("qnaNextDTO", qnaNextDTO);
        }

        return maps;
    }

    @Override
    public int qnaRegist(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);

        int result = communityMapper.qnaRegist(qnaVO);

        return result;
    }

    @Override
    public QnaDTO qnaModifyGet(int qna_idx) {
        QnaVO qnaVO = communityMapper.qnaView(qna_idx);

        QnaDTO qnaDTO = modelMapper.map(qnaVO, QnaDTO.class);

        return qnaDTO;
    }

    @Override
    public int qnaModify(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);

        int result = communityMapper.qnaModify(qnaVO);

        return result;
    }

    @Override
    public int qnaDelete(int qna_idx) {
        int result = communityMapper.qnaDelete(qna_idx);

        return result;
    }

    @Override
    public void qnaUpdateReadCnt(int qna_idx) {
        // 조회 수 중복 방지 ( 쿠키 1분 설정 )
        // 지정한 이름으로 저장된 쿠키가 있는지 확인
//        Cookie oldCookie = null;
//        Cookie[] cookies = req.getCookies();
//        if (cookies != null) {
//            for (Cookie cookie : cookies) {
//                if (cookie.getName().equals("qnaView")) {
//                    oldCookie = cookie;
//                }
//            }
//        }
//
//        // 지정한 이름의 쿠키가 있을 때
//        if (oldCookie != null) {
//            // 해당 게시글에 대한 쿠키값이 없을 때
//            if (!oldCookie.getValue().contains("[" + qna_idx + "]")) {
//                communityMapper.qnaUpdateReadCnt(qna_idx);
//                oldCookie.setValue(oldCookie.getValue() + "_[" + qna_idx + "]");
//                oldCookie.setPath("/");
//                oldCookie.setMaxAge(60 * 60);
//                res.addCookie(oldCookie);
//            }
//        } else { // 지정한 이름의 쿠키가 없을 때
//            communityMapper.qnaUpdateReadCnt(qna_idx);
//            Cookie newCookie = new Cookie("qnaView","[" + qna_idx + "]");
//            newCookie.setPath("/");
//            newCookie.setMaxAge(60 * 60);
//            res.addCookie(newCookie);
//        }

        communityMapper.qnaUpdateReadCnt(qna_idx);
    }
}
