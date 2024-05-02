package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.DataVO;
import org.fullstack4.bookstore.domain.MemberVO;
import org.fullstack4.bookstore.dto.*;

import java.util.List;
import java.util.Map;

public interface DataService {
    int dataTotalCount(PageRequestDTO pageRequestDTO);
    PageResponseDTO<DataDTO> dataListByPage(PageRequestDTO pageRequestDTO);

    int dataRegist(DataDTO dataDTO);
    List<DataDTO> dataList();
    Map<String, DataDTO> dataView(int data_idx);
    DataDTO dataModifyGet(int data_idx);
    int dataModify(DataDTO dataDTO);
    int dataDelete(int data_idx);
}
