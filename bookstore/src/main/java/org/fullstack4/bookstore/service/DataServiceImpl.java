package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import org.fullstack4.bookstore.domain.DataVO;
import org.fullstack4.bookstore.dto.DataDTO;
import org.fullstack4.bookstore.dto.FaqDTO;
import org.fullstack4.bookstore.mapper.DataMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DataServiceImpl implements DataService {

    private final DataMapper dataMapper;
    private final ModelMapper modelMapper;

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
    public DataDTO dataView(int data_idx) {
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
