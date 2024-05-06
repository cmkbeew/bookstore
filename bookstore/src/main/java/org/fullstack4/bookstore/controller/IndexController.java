package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.FaqDTO;
import org.fullstack4.bookstore.dto.NoticeDTO;
import org.fullstack4.bookstore.dto.ProductDTO;
import org.fullstack4.bookstore.dto.QnaDTO;
import org.fullstack4.bookstore.service.IndexServiceIf;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/")
@RequiredArgsConstructor
public class IndexController {

    private final IndexServiceIf indexServiceIf;

    @GetMapping("/")
    public void mainGet(
            HttpServletRequest req,
            HttpServletResponse resp
    ) throws ServletException, IOException {

//        신상품 리스트
        List<ProductDTO> allList = indexServiceIf.product_list("유아");
        List<ProductDTO> elemList = indexServiceIf.product_list("초등");
        List<ProductDTO> midList = indexServiceIf.product_list("중등");
        List<ProductDTO> highList = indexServiceIf.product_list("고등");

        req.setAttribute("allList", allList);
        req.setAttribute("elemList", elemList);
        req.setAttribute("midList", midList);
        req.setAttribute("highList", highList);
//      랜덤 책 추천
        List<ProductDTO> elemRandom = indexServiceIf.product_random("초등");
        List<ProductDTO> midRandom = indexServiceIf.product_random("중등");
        List<ProductDTO> highRandom = indexServiceIf.product_random("고등");

        req.setAttribute("elemRandom", elemRandom);
        req.setAttribute("midRandom", midRandom);
        req.setAttribute("highRandom", highRandom);

//       공지사항
        List<NoticeDTO> noticelist = indexServiceIf.main_notice();
        req.setAttribute("noticeList", noticelist);

//        문의사항
        List<FaqDTO> faqList = indexServiceIf.main_faq();
        req.setAttribute("faqList", faqList);

        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
    @GetMapping("/company/greeting")
    public void companyGet() {
    }
}
