package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.PageRequestDTO;

import java.util.List;

public interface DataMapper {
    // 페이징
    int dataTotalCount(PageRequestDTO pageRequestDTO);
    List<DataVO> dataListByPage(PageRequestDTO pageRequestDTO);

    List<DataVO> dataList();
    DataVO dataView(int data_idx);
    DataVO dataPrev(int data_idx);
    DataVO dataNext(int data_idx);

    int dataRegist(DataVO dataVO);
    int dataModify(DataVO dataVO);
    int dataDelete(int data_idx);
}
