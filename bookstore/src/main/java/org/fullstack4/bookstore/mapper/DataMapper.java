package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.*;
import org.fullstack4.bookstore.dto.PageRequestDTO;

import java.util.List;

public interface DataMapper {
    // 페이징
    int dataTotalCount(PageRequestDTO pageRequestDTO);
    List<DataVO> dataListByPage(PageRequestDTO pageRequestDTO);

    int dataRegist(DataVO dataVO);
    List<DataVO> dataList();
    DataVO dataView(int data_idx);
    int dataModify(DataVO dataVO);
    int dataDelete(int data_idx);
}
