package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.DataVO;
import org.fullstack4.bookstore.dto.DataDTO;

import java.util.List;

public interface DataService {
    int regist_data(DataDTO dataDTO);
    List<DataDTO> list_data();
    DataDTO view_data(int data_idx);
    int modify_data(DataDTO dataDTO);
    int delete_data(int data_idx);
}
