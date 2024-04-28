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

        log.info("type : " + type);
        if(type.equals("notice")) {
            PageResponseDTO<NoticeDTO> noticeList = communityService.noticeList(pageRequestDTO);

            model.addAttribute("noticeList", noticeList);
        } else if(type.equals("faq")) {
            PageResponseDTO<FaqDTO> faqList = communityService.faqList(pageRequestDTO);

            model.addAttribute("faqList", faqList);
        } else if(type.equals("qna")) {
            PageResponseDTO<QnaDTO> qnaList = communityService.qnaList(pageRequestDTO);

            model.addAttribute("qnaList", qnaList);
        } else {

        }
    }

    @GetMapping("/notice/view")
    public void noticeView(@RequestParam int notice_idx, Model model) {
        NoticeDTO noticeDTO = communityService.noticeView(notice_idx);

        model.addAttribute("noticeDTO", noticeDTO);
    }

    @GetMapping("/faq/list")
    public String faqList(@Valid PageRequestDTO pageRequestDTO,
                        BindingResult bindingResult,
                        RedirectAttributes redirectAttributes,
                        Model model) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<FaqDTO> faqList = communityService.faqList(pageRequestDTO);

        model.addAttribute("faqList", faqList);

        return "/community/faq/list";
    }

    @GetMapping("/faq/view")
    public void faqView(@RequestParam int faq_idx, Model model) {
//        FaqDTO faqDTO = communityService.faqView(faq_idx);
//        faqDTO.setContent(faqDTO.getContent().replace("\r\n", "<br>"));
//        model.addAttribute("faqDTO", faqDTO);

        Map<String, FaqDTO> faqMap = communityService.faqView(faq_idx);

        log.info("faqMap : " + faqMap);
        faqMap.get("faqDTO").setContent(faqMap.get("faqDTO").getContent().replace("\r\n", "<br>"));

        model.addAttribute("faqDTO", faqMap.get("faqDTO"));
        model.addAttribute("faqPrevDTO", faqMap.get("faqPrevDTO"));
        model.addAttribute("faqNextDTO", faqMap.get("faqNextDTO"));
    }

    @GetMapping("/qna/list")
    public String qnaList(@Valid PageRequestDTO pageRequestDTO,
                          BindingResult bindingResult,
                          RedirectAttributes redirectAttributes,
                          Model model) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<QnaDTO> qnaList = communityService.qnaList(pageRequestDTO);

        model.addAttribute("qnaList", qnaList);

        return "/community/qna/list";
    }

    @GetMapping("/qna/view")
    public void qnaView(@RequestParam int qna_idx, Model model) {
        QnaDTO qnaDTO = communityService.qnaView(qna_idx);

        model.addAttribute("qnaDTO", qnaDTO);
    }

    @GetMapping("/qna/regist")
    public void qna_regist() {

    }

    @PostMapping("/qna/regist")
    public String qna_regist(
            //@RequestParam("file") MultipartFile multipartFile,
                              QnaDTO qnaDTO,
                              RedirectAttributes redirectAttributes) {
//        String save_file_name = "";

//        if(!multipartFile.isEmpty()) {
//            save_file_name = FileUploadUtil.saveFile(multipartFile);
//        }

//        dataDTO.setOrg_file_name(multipartFile.getOriginalFilename());
//        dataDTO.setSave_file_name(save_file_name);

        int result = communityService.qnaRegist(qnaDTO);

        if(result > 0) {
            return "redirect:/community/qna/list";
        } else {
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/community/qna/regist";
        }
    }

//    @GetMapping("/modify")
//    public void data_modify(int data_idx, Model model) {
//        DataDTO dataDTO = dataService.view_data(data_idx);
//
//        model.addAttribute("dataDTO", dataDTO);
//    }
//
//    @PostMapping("/modify")
//    public String data_modify(@RequestParam("file") MultipartFile multipartFile,
//                              DataDTO dataDTO,
//                              RedirectAttributes redirectAttributes) {
//        DataDTO dto = dataService.view_data(dataDTO.getData_idx());
//
//        String save_file_name = "";
//
//        if(!multipartFile.isEmpty()) {
//            save_file_name = FileUploadUtil.saveFile(multipartFile);
//
//            FileUploadUtil.deleteFile(dto.getSave_file_name());
//        }
//
//        dataDTO.setOrg_file_name(multipartFile.getOriginalFilename());
//        dataDTO.setSave_file_name(save_file_name);
//
//        int result = dataService.modify_data(dataDTO);
//
//        if(result > 0) {
//            return "redirect:/data/view?data_idx=" + dataDTO.getData_idx();
//        } else {
//            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);
//
//            return "redirect:/data/modify?data_idx=" + dataDTO.getData_idx();
//        }
//    }
//
//    @PostMapping("/delete")
//    public String data_delete(int data_idx, RedirectAttributes redirectAttributes) {
//        int result = dataService.delete_data(data_idx);
//
//        if(result > 0) {
//            return "redirect:/data/list";
//        } else {
//            return "redirect:/data/view?data_idx=" + data_idx;
//        }
//    }
}
