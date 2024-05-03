package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.DataVO;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.domain.QnaVO;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.mapper.CommunityMapper;
import org.fullstack4.bookstore.mapper.DataMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class DataServiceImpl implements DataService {

    private final DataMapper dataMapper;
    private final ModelMapper modelMapper;

    @Override
    public int dataTotalCount(PageRequestDTO pageRequestDTO) {
        return dataMapper.dataTotalCount(pageRequestDTO);
    }

    @Override
    public PageResponseDTO<DataDTO> dataListByPage(PageRequestDTO pageRequestDTO) {
        List<DataVO> voList = dataMapper.dataListByPage(pageRequestDTO);
        List<DataDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, DataDTO.class))
                .collect(Collectors.toList());
        int total_count = dataMapper.dataTotalCount(pageRequestDTO);

        PageResponseDTO<DataDTO> pageResponseDTO = PageResponseDTO.<DataDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public int dataRegist(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);

        int result = dataMapper.dataRegist(dataVO);

        return result;
    }

    @Override
    public List<DataDTO> dataList() {
        List<DataVO> voList = dataMapper.dataList();

        List<DataDTO> dtoList = voList.stream()
                                      .map(vo -> modelMapper.map(vo, DataDTO.class))
                                      .collect(Collectors.toList());

        // 보여지는 내용 길이 설정
        for(DataDTO dto : dtoList) {
            dto.setContent(dto.getContent().replace("\r\n", " "));
            if(dto.getContent().length() >= 20) {
                dto.setContent(dto.getContent().substring(0, 20) + ".....");
            }
        }

        return dtoList;
    }


    @Override
    public Map<String, DataDTO> dataView(int data_idx) {
        Map<String, DataDTO> maps = new HashMap<>();

        DataVO dataVO = dataMapper.dataView(data_idx);
        DataVO dataPrevVO = dataMapper.dataPrev(data_idx);
        DataVO dataNextVO = dataMapper.dataNext(data_idx);

        DataDTO dataDTO = modelMapper.map(dataVO, DataDTO.class);
        maps.put("dataDTO", dataDTO);

        if (dataPrevVO != null) {
            DataDTO dataPrevDTO = modelMapper.map(dataPrevVO, DataDTO.class);
            maps.put("dataPrevDTO", dataPrevDTO);
        }

        if (dataNextVO != null) {
            DataDTO dataNextDTO = modelMapper.map(dataNextVO, DataDTO.class);
            maps.put("dataNextDTO", dataNextDTO);
        }

        return maps;
    }

    @Override
    public DataDTO dataModifyGet(int data_idx) {
        DataVO dataVO = dataMapper.dataView(data_idx);
        DataDTO dataDTO = modelMapper.map(dataVO, DataDTO.class);

        return dataDTO;
    }


    @Override
    public int dataModify(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);

        int result = dataMapper.dataModify(dataVO);

        return result;
    }

    @Override
    public int dataDelete(int data_idx) {
        int result = dataMapper.dataDelete(data_idx);

        return result;
    }
}
