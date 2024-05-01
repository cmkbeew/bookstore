package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.*;
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

    // 공지사항
    @Override
    public int noticeTotalCount(PageRequestDTO pageRequestDTO) {
        return adminMapper.noticeTotalCount(pageRequestDTO);
    }
    @Override
    public int faqTotalCount(PageRequestDTO pageRequestDTO) {
        return adminMapper.faqTotalCount(pageRequestDTO);
    }
    @Override
    public int qnaTotalCount(PageRequestDTO pageRequestDTO) {
        return adminMapper.qnaTotalCount(pageRequestDTO);
    }

    @Override
    public int memberTotalCount(PageRequestDTO pageRequestDTO) { return adminMapper.memberTotalCount(pageRequestDTO); }

    @Override
    public PageResponseDTO<NoticeDTO> noticeListByPage(PageRequestDTO pageRequestDTO) {
        List<NoticeVO> voList = adminMapper.noticeListByPage(pageRequestDTO);
        List<NoticeDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, NoticeDTO.class))
                .collect(Collectors.toList());

//        // 보여지는 내용 길이 설정
//        for(NoticeDTO dto : dtoList) {
//            dto.setContent(dto.getContent().replace("\r\n", " "));
//            if(dto.getContent().length() >= 20) {
//                dto.setContent(dto.getContent().substring(0, 20) + ".....");
//            }
//        }

        int total_count = adminMapper.noticeTotalCount(pageRequestDTO);

        PageResponseDTO<NoticeDTO> pageResponseDTO = PageResponseDTO.<NoticeDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public PageResponseDTO<FaqDTO> faqListByPage(PageRequestDTO pageRequestDTO) {
        List<FaqVO> voList = adminMapper.faqListByPage(pageRequestDTO);
        List<FaqDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, FaqDTO.class))
                .collect(Collectors.toList());

//        // 보여지는 내용 길이 설정
//        for(FaqDTO dto : dtoList) {
//            dto.setContent(dto.getContent().replace("\r\n", " "));
//            if(dto.getContent().length() >= 20) {
//                dto.setContent(dto.getContent().substring(0, 20) + ".....");
//            }
//        }

        int total_count = adminMapper.faqTotalCount(pageRequestDTO);

        PageResponseDTO<FaqDTO> pageResponseDTO = PageResponseDTO.<FaqDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public PageResponseDTO<QnaDTO> qnaListByPage(PageRequestDTO pageRequestDTO) {
        List<QnaVO> voList = adminMapper.qnaListByPage(pageRequestDTO);
        List<QnaDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());

//        // 보여지는 내용 길이 설정
//        for(QnaDTO dto : dtoList) {
//            dto.setContent(dto.getContent().replace("\r\n", " "));
//            if(dto.getContent().length() >= 20) {
//                dto.setContent(dto.getContent().substring(0, 20) + ".....");
//            }
//        }

        int total_count = adminMapper.qnaTotalCount(pageRequestDTO);

        PageResponseDTO<QnaDTO> pageResponseDTO = PageResponseDTO.<QnaDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public PageResponseDTO<MemberDTO> memberListByPage(PageRequestDTO pageRequestDTO) {
        List<MemberVO> voList = adminMapper.memberListByPage(pageRequestDTO);
        List<MemberDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, MemberDTO.class))
                .collect(Collectors.toList());

        int total_count = adminMapper.memberTotalCount(pageRequestDTO);

        PageResponseDTO<MemberDTO> pageResponseDTO = PageResponseDTO.<MemberDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return pageResponseDTO;
    }

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
    public int noticeRegist(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        int result = adminMapper.noticeRegist(noticeVO);
        return result;
    }

    @Override
    public int noticeModify(NoticeDTO noticeDTO) {
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        int result = adminMapper.noticeModify(noticeVO);
        return result;
    }

    @Override
    public int noticeDelete(int idx) {
        int result = adminMapper.noticeDelete(idx);
        return result;
    }

    @Override
    public int noticeFix(int idx) {
        int result = adminMapper.noticeFix(idx);
        return result;
    }

    // FAQ
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
    public int faqRegist(FaqDTO faqDTO) {
        FaqVO faqVO = modelMapper.map(faqDTO, FaqVO.class);
        int result = adminMapper.faqRegist(faqVO);
        return result;
    }

    @Override
    public int faqModify(FaqDTO faqDTO) {
        FaqVO faqVO = modelMapper.map(faqDTO, FaqVO.class);
        int result = adminMapper.faqModify(faqVO);
        return result;
    }

    @Override
    public int faqDelete(int idx) {
        int result = adminMapper.faqDelete(idx);
        return result;
    }


    // QnA
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

    @Override
    public int qnaDelete(int idx) {
        int result = adminMapper.qnaDelete(idx);
        return result;
    }

    @Override
    public int qnaReplyRegist(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = adminMapper.qnaReplyRegist(qnaVO);
        int result2 = adminMapper.replyStateNtoY(qnaVO.getIdx());

        return result;
    }

    @Override
    public int qnaReplyModify(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        int result = adminMapper.qnaReplyModify(qnaVO);
        return result;
    }

    @Override
    public int qnaReplyTotalCount(QnaDTO qnaDTO) {
        QnaVO qnaVO = modelMapper.map(qnaDTO, QnaVO.class);
        return adminMapper.qnaReplyTotalCount(qnaVO);
    }



    // 회원관리
    @Override
    public List<MemberDTO> memberList() {
        List<MemberDTO> dtoList = adminMapper.memberList().stream()
                .map(vo -> modelMapper.map(vo, MemberDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    
    // 도서
    @Override
    public List<ProductDTO> productList() {
        List<ProductDTO> dtoList = adminMapper.productList().stream()
                .map(vo -> modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    
    // 배송관리
    @Override
    public List<DeliveryDTO> deliveryList() {
        List<DeliveryDTO> dtoList = adminMapper.deliveryList().stream()
                .map(vo -> modelMapper.map(vo, DeliveryDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public DeliveryDTO deliveryView(int pay_idx) {
        DeliveryVO deliveryVO = adminMapper.deliveryView(pay_idx);

        DeliveryDTO deliveryDTO = modelMapper.map(deliveryVO, DeliveryDTO.class);

        return deliveryDTO;
    }

    @Override
    public int deliveryModify(DeliveryDTO deliveryDTO) {
        log.info("====================================");
        DeliveryVO deliveryVO = modelMapper.map(deliveryDTO, DeliveryVO.class);
        int result = adminMapper.deliveryModify(deliveryVO);

        log.info("DeliveryServiceImpl >> modify(deliveryDTO : " + deliveryDTO.toString());
        log.info("BbsServiceImpl >> result : " + result);
        log.info("====================================");

        return result;
    }


}
