package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.DataVO;

import java.util.List;

public interface DataMapper {

    int regist_data(DataVO dataVO);
    List<DataVO> list_data();
    DataVO view_data(int data_idx);
    int modify_data(DataVO dataVO);
    int delete_data(int data_idx);
}
