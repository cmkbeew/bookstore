package org.fullstack4.bookstore.service;

import lombok.RequiredArgsConstructor;
import org.fullstack4.bookstore.domain.DataVO;
import org.fullstack4.bookstore.dto.DataDTO;
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
    public int regist_data(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);

        int result = dataMapper.regist_data(dataVO);

        return result;
    }

    @Override
    public List<DataDTO> list_data() {
        List<DataVO> voList = dataMapper.list_data();
        List<DataDTO> dtoList = voList.stream()
                                      .map(vo -> modelMapper.map(vo, DataDTO.class))
                                      .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public DataDTO view_data(int data_idx) {
        DataVO dataVO = dataMapper.view_data(data_idx);
        DataDTO dataDTO = modelMapper.map(dataVO, DataDTO.class);

        return dataDTO;
    }

    @Override
    public int modify_data(DataDTO dataDTO) {
        DataVO dataVO = modelMapper.map(dataDTO, DataVO.class);

        int result = dataMapper.modify_data(dataVO);

        return result;
    }

    @Override
    public int delete_data(int data_idx) {
        int result = dataMapper.delete_data(data_idx);

        return result;
    }
}
