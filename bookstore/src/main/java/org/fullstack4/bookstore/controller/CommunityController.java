package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.CommunityService;
import org.fullstack4.bookstore.util.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {

    private final CommunityService communityService;

    @GetMapping("/list")
    public void communityList(@Valid PageRequestDTO pageRequestDTO,
                           BindingResult bindingResult,
                           @RequestParam String type,
                           RedirectAttributes redirectAttributes,
                           Model model) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        if(type.equals("notice")) {
            PageResponseDTO<NoticeDTO> noticeList = communityService.noticeList(pageRequestDTO);

            model.addAttribute("communityList", noticeList);
        } else if(type.equals("faq")) {
            PageResponseDTO<FaqDTO> faqList = communityService.faqList(pageRequestDTO);

            model.addAttribute("communityList", faqList);
        } else if(type.equals("qna")) {
            PageResponseDTO<QnaDTO> qnaList = communityService.qnaList(pageRequestDTO);

            model.addAttribute("communityList", qnaList);
        } else {

        }
    }

    @GetMapping("/view")
    public void communityView(@RequestParam int idx, @RequestParam String type, Model model) {

        model.addAttribute("type", type);

        if(type.equals("notice")) {
            Map<String, NoticeDTO> noticeMap = communityService.noticeView(idx);

            noticeMap.get("noticeDTO").setContent(noticeMap.get("noticeDTO").getContent().replace("\r\n", "<br>"));

            model.addAttribute("dto", noticeMap.get("noticeDTO"));
            model.addAttribute("prevDTO", noticeMap.get("noticePrevDTO"));
            model.addAttribute("nextDTO", noticeMap.get("noticeNextDTO"));
        } else if(type.equals("faq")) {
            Map<String, FaqDTO> faqMap = communityService.faqView(idx);

            faqMap.get("faqDTO").setContent(faqMap.get("faqDTO").getContent().replace("\r\n", "<br>"));

            model.addAttribute("dto", faqMap.get("faqDTO"));
            model.addAttribute("prevDTO", faqMap.get("faqPrevDTO"));
            model.addAttribute("nextDTO", faqMap.get("faqNextDTO"));
        } else if(type.equals("qna")) {
            communityService.qnaUpdateReadCnt(idx);
            Map<String, QnaDTO> qnaMap = communityService.qnaView(idx);

            model.addAttribute("dto", qnaMap.get("qnaDTO"));
            model.addAttribute("prevDTO", qnaMap.get("qnaPrevDTO"));
            model.addAttribute("nextDTO", qnaMap.get("qnaNextDTO"));
        }
    }

    @GetMapping("/qna/regist")
    public void qnaRegist() {

    }

    @PostMapping("/qna/regist")
    public String qnaRegist(@Valid QnaDTO qnaDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/community/qna/regist";
        }

        int result = communityService.qnaRegist(qnaDTO);

        if(result > 0) {
            return "redirect:/community/list?type=qna";
        } else {
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/community/qna/regist";
        }
    }

    @GetMapping("/qna/modify")
    public void qnaModifyGet(int idx, Model model) {
        QnaDTO qnaDTO = communityService.qnaModifyGet(idx);

        model.addAttribute("qnaDTO", qnaDTO);
    }
    @PostMapping("/qna/modify")
    public String qnaModify(@Valid QnaDTO qnaDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/community/qna/modify?idx=" + qnaDTO.getIdx();
        }

        int result = communityService.qnaModify(qnaDTO);

        if(result > 0) {
            return "redirect:/community/view?type=qna&idx=" + qnaDTO.getIdx();
        } else {
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/community/view?type=qna&idx=" + qnaDTO.getIdx();
        }
    }

    @PostMapping("/qna/delete")
    public String qnaDelete(@RequestParam(name = "idx") int qna_idx, RedirectAttributes redirectAttributes) {
        int result = communityService.qnaDelete(qna_idx);

        if(result > 0) {
            return "redirect:/community/list?type=qna";
        } else {
            return "redirect:/community/view?type=qna&idx=" + qna_idx;
        }
    }
}
