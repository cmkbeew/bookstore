package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.DataVO;

import java.util.List;

public interface DataMapper {

    int dataRegist(DataVO dataVO);
    List<DataVO> dataList();
    DataVO dataView(int data_idx);
    int dataModify(DataVO dataVO);
    int dataDelete(int data_idx);
}
