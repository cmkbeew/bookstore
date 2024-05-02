package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.DataVO;
import org.fullstack4.bookstore.domain.MemberVO;
import org.fullstack4.bookstore.dto.DataDTO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.dto.PageRequestDTO;
import org.fullstack4.bookstore.dto.PageResponseDTO;

import java.util.List;

public interface DataService {
    int dataTotalCount(PageRequestDTO pageRequestDTO);
    PageResponseDTO<DataDTO> dataListByPage(PageRequestDTO pageRequestDTO);

    int dataRegist(DataDTO dataDTO);
    List<DataDTO> dataList();
    DataDTO dataView(int data_idx);
    int dataModify(DataDTO dataDTO);
    int dataDelete(int data_idx);
}
