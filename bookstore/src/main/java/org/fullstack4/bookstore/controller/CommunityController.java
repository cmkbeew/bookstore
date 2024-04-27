package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.CommunityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {

    private final CommunityService communityService;

    @GetMapping("/notice/list")
    public void noticeList(@Valid PageRequestDTO pageRequestDTO,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes,
                           Model model) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        List<NoticeDTO> noticeList = communityService.noticeList();

        model.addAttribute("noticeList", noticeList);
    }

    @GetMapping("/notice/view")
    public void noticeView(@RequestParam int notice_idx, Model model) {
        NoticeDTO noticeDTO = communityService.noticeView(notice_idx);

        model.addAttribute("noticeDTO", noticeDTO);
    }

    @GetMapping("/faq/list")
    public void faqList(@Valid PageRequestDTO pageRequestDTO,
                        BindingResult bindingResult,
                        RedirectAttributes redirectAttributes,
                        Model model) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<FaqDTO> faqList = communityService.faqList(pageRequestDTO);

        log.info("faqList : " + faqList);

        model.addAttribute("faqList", faqList);
    }

    @GetMapping("/faq/view")
    public void faqView(@RequestParam int faq_idx, Model model) {
        FaqDTO faqDTO = communityService.faqView(faq_idx);

        model.addAttribute("faqDTO", faqDTO);
    }

    @GetMapping("/qna/list")
    public void qnaList(Model model) {
        List<QnaDTO> qnaList = communityService.qnaList();

        model.addAttribute("qnaList", qnaList);
    }

    @GetMapping("/qna/view")
    public void qnaView(@RequestParam int qna_idx, Model model) {
        QnaDTO qnaDTO = communityService.qnaView(qna_idx);

        model.addAttribute("qnaDTO", qnaDTO);
    }
}
