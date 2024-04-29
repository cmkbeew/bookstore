package org.fullstack4.bookstore.dto;

import lombok.Builder;
import lombok.Data;
import lombok.extern.log4j.Log4j2;

import java.util.List;

@Log4j2
@Data
public class ProductPageResponseDTO<E> {

    private int total_count;
    private int page;
    private int page_size;
    private int page_skip_count;
    private int total_page;
    private int page_block_size;
    private int page_block_start;
    private int page_block_end;

    private boolean prev_page_flag;
    private boolean next_page_flag;

    List<E> dtoList;

    // 유형
    private String type;
    // 학년
    private String grade;
    // 과목
    private String subject;
    // 검색어
    private String search_word;
    // 정렬
    private String sort_type;

    private String linkParams;

    ProductPageResponseDTO() {}

    @Builder(builderMethodName = "withAll")
    public ProductPageResponseDTO(ProductPageRequestDTO productPageRequestDTO, List<E> dtoList, int total_count) {
        this.total_count = total_count;
        this.page = productPageRequestDTO.getPage();
        this.page_size = productPageRequestDTO.getPage_size();
        this.page_skip_count = productPageRequestDTO.getPage_skip_count();
        this.total_page = (int)Math.ceil(total_count / (double)page_size);
        this.page_block_size = productPageRequestDTO.getPage_block_size();
        this.page_block_start = (int)(Math.ceil(page / (double)page_block_size) -1 ) * page_block_size + 1;
        this.page_block_end = (int)Math.ceil(page / (double)page_block_size) * page_block_size;
        this.page_block_end = page_block_end > total_page ? total_page : page_block_end;
        this.prev_page_flag = (this.page_block_start > 1);
        this.next_page_flag = (this.total_page > this.page_block_end);

        this.dtoList = dtoList;

        this.type = productPageRequestDTO.getType();
        this.grade = productPageRequestDTO.getGrade();
        this.subject = productPageRequestDTO.getSubject();
        this.search_word = productPageRequestDTO.getSearch_word();
        this.sort_type = productPageRequestDTO.getSort_type();

        StringBuilder sb = new StringBuilder();

        if(grade != null) {
            sb.append("&grade=" + grade);
        }
        if(subject != null) {
            sb.append("&subject=" + subject);
        }
        if(search_word != null) {
            sb.append("&search_word=" + search_word);
        }
        if(sort_type != null) {
            sb.append("&sort_type=" + sort_type);
        }

        this.linkParams = "?type=" + this.type + "&page_size=" + this.page_size + sb;
    }

}
