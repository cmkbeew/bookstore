package org.fullstack4.bookstore.service;

import org.fullstack4.bookstore.domain.FaqVO;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.FaqDTO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.dto.ProductDTO;

import java.util.List;

public interface IndexServiceIf {
List<ProductDTO> product_list(String type);
List<ProductDTO> product_random(String type);
List<NoticeDTO> main_notice();
List<FaqDTO> main_faq();
}
