package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.DataVO;
import org.fullstack4.bookstore.dto.DataDTO;

import java.util.List;

public interface DataService {
    int dataRegist(DataDTO dataDTO);
    List<DataDTO> dataList();
    DataDTO dataView(int data_idx);
    int dataModify(DataDTO dataDTO);
    int dataDelete(int data_idx);
}
