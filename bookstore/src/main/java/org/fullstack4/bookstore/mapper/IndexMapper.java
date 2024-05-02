package org.fullstack4.bookstore.mapper;

import org.fullstack4.bookstore.domain.FaqVO;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.domain.ProductVO;

import java.util.List;

public interface IndexMapper {
    List<ProductVO> product_list(String type);
    List<ProductVO> product_random(String type);
    List<NoticeVO> main_notice();
    List<FaqVO> main_faq();

}