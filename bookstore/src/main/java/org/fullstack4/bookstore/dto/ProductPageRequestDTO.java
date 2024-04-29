package org.fullstack4.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Min;
import javax.validation.constraints.PositiveOrZero;

@Log4j2
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductPageRequestDTO {
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int total_count=0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int first_page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_size=8;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int total_page=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int page_skip_count=0;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_size=5;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_start=1;
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_end=1;

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


    public void setTotal_count(int total_count) {
        this.total_count = total_count;
    }
    public int getPage_skip_count() {
        return (this.page-1)*this.page_size;
    }
}
