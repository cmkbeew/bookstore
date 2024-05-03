package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.domain.NoticeVO;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.AdminService;
import org.fullstack4.bookstore.service.CommunityService;
import org.fullstack4.bookstore.service.MyServiceIf;
import org.fullstack4.bookstore.util.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

@Log4j2
@Controller
@RequestMapping(value="/admin")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;
    private final CommunityService communityService;
    private final MyServiceIf myServiceIf;

    @GetMapping(path = "/list")
    public void bbsListGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            @RequestParam String type,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> bbsListGET()");

        if (bindingResult.hasErrors()) {
            log.info("AdminController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        if (type.equals("notice")) {
            PageResponseDTO<NoticeDTO> noticeList = adminService.noticeListByPage(pageRequestDTO);
            model.addAttribute("communityList", noticeList);
            model.addAttribute("bbsTitle", "공지사항");
        }

        if (type.equals("faq")) {
            PageResponseDTO<FaqDTO> faqList = adminService.faqListByPage(pageRequestDTO);
            model.addAttribute("communityList", faqList);
            model.addAttribute("bbsTitle", "FAQ");
        }

        if (type.equals("qna")) {
            PageResponseDTO<QnaDTO> qnaList = adminService.qnaListByPage(pageRequestDTO);
            model.addAttribute("communityList", qnaList);
            model.addAttribute("bbsTitle", "QnA");
        }
        log.info("===============================");
    }

    // list 페이지에서 체크 박스 활용한 삭제
    @PostMapping(path = "/delete")
    public String bbsDeletePOST(
//            @RequestParam(name = "idx", defaultValue = "0") int idx,
            HttpServletRequest req,
            @RequestParam String type
    ) {
        log.info("===============================");
        log.info("AdminController >> bbsDeletePOST()");
        String[] delete_idx = req.getParameterValues("select");
        String referer = req.getHeader("Referer");
        log.info("delete_idx" + delete_idx);



        if (type.equals("notice")) {
            int result = 0;

            for (int i = 0; i < delete_idx.length; i++) {
                int intIdx = Integer.parseInt(delete_idx[i]);
                result = adminService.noticeDelete(intIdx);
            }
            if (result > 0) {
                return "redirect:" + referer;
            } else {
                return "redirect:/admin/list?type=notice&err=deleteErr";
            }
        }

        if (type.equals("faq")) {
            int result = 0;

            for (int i = 0; i < delete_idx.length; i++) {
                int intIdx = Integer.parseInt(delete_idx[i]);
                result = adminService.faqDelete(intIdx);
            }
            if (result > 0) {
                return "redirect:" + referer;
            } else {
                return "redirect:/admin/list?type=faq&err=deleteErr";
            }
        }

        if (type.equals("qna")) {
            int result = 0;

            for (int i = 0; i < delete_idx.length; i++) {
                int intIdx = Integer.parseInt(delete_idx[i]);
                result = adminService.qnaDelete(intIdx);
            }
            if (result > 0) {
                return "redirect:" + referer;
            } else {
                return "redirect:/admin/list?type=qna&err=deleteErr";
            }
        }

        log.info("===============================");
        return "redirect:/admin/list?type=notice";

    }

    // 공지사항
    @GetMapping(path = "/notice/view", params = "idx")
    public void noticeViewGET(
            @RequestParam int idx,
            PageRequestDTO pageRequestDTO,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> bbsViewGET()");
        NoticeDTO noticeDTO = adminService.noticeView(idx);

        PageResponseDTO<NoticeDTO> noticeList = adminService.noticeListByPage(pageRequestDTO);
        model.addAttribute("communityList", noticeList);
        model.addAttribute("noticeDTO", noticeDTO);
        model.addAttribute("idx", idx);


        // 이전글 다음글
        Map<String, NoticeDTO> noticeMap = communityService.noticeView(idx);
        noticeMap.get("noticeDTO").setContent(noticeMap.get("noticeDTO").getContent().replace("\r\n", "<br>"));

        model.addAttribute("dto", noticeMap.get("noticeDTO"));
        model.addAttribute("prevDTO", noticeMap.get("noticePrevDTO"));
        model.addAttribute("nextDTO", noticeMap.get("noticeNextDTO"));

        log.info("===============================");
    }

    // 공지사항 상단 고정
    @GetMapping(path = "/notice/fix", params = "idx")
    public String noticeFixGET(
            @RequestParam(name = "idx", defaultValue = "0") int idx
    ) {
        log.info("===============================");
        log.info("AdminController >> noticeFixGET()");

        int result = adminService.noticeFix(idx);

        if (result > 0) {
            log.info("===============================");
            return "redirect:/admin/list?type=notice";
        } else {
            return "redirect:/admin/list?type=notice&err=fixErr";
        }

    }

    @GetMapping("/notice/regist")
    public void noticeRegistGET() {
        log.info("===============================");
        log.info("AdminController >> noticeRegistGET()");
        log.info("===============================");
    }

    @PostMapping("/notice/regist")
    public String noticeRegistPOST(
            @RequestParam("file") MultipartFile multipartFile,
            @Valid NoticeDTO noticeDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("AdminController >> noticeRegistPOST()");
        log.info("===============================");

        log.info("errors: " + bindingResult.getAllErrors());
        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);
            return "redirect:/admin/notice/regist";
        }

        // 파일 등록
        String save_file_name = "";

        if (!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile);
        }
        noticeDTO.setOrg_file_name(multipartFile.getOriginalFilename());
        noticeDTO.setSave_file_name(save_file_name);


        int result = adminService.noticeRegist(noticeDTO);

        if (result > 0) {
            return "redirect:/admin/list?type=notice";
        } else {
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);
            return "redirect:/admin/notice/regist";
        }
    }

    // 파일 다운로드 (시도했으나 실패)
    @GetMapping("/filedownload")
    public String filedownloadGET(
            @RequestParam("idx") int idx,
            HttpServletRequest req,
            HttpServletResponse res
    ) throws UnsupportedEncodingException {
//        String upload_path = req.getServletContext().getRealPath("");
        NoticeDTO noticeDTO = adminService.noticeView(idx);

        File file = new File("C:\\Uploads" + noticeDTO.getSave_file_name());
        res.setHeader("Content-Disposition", "attachment; filename=\"" + noticeDTO.getOrg_file_name() + "\";");
        res.setHeader("Content-Transfer-Encoding", "binary");
        res.setHeader("Content-Type",
                noticeDTO.getSave_file_name().substring(noticeDTO.getSave_file_name().lastIndexOf("."), noticeDTO.getSave_file_name().length()));
        res.setHeader("Content-Length", "" + file.length());
        res.setHeader("Pragma", "no-cache;");
        res.setHeader("Expires", "-1;");

        try (
                FileInputStream fis = new FileInputStream(file);
                OutputStream out = res.getOutputStream();
        ) {
            int readCnt = 0;
            byte[] buffer = new byte[1024];
            while((readCnt = fis.read(buffer)) != -1) {
                out.write(buffer, 0, readCnt);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/admin/notice/view?idx=" + idx;
    }

    @GetMapping(path = "/notice/modify")
    public void noticeModifyGET(
            @RequestParam(name = "idx", defaultValue = "0") int idx,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> noticeModifyGET()");

        NoticeDTO noticeDTO = adminService.noticeView(idx);
        model.addAttribute("noticeDTO", noticeDTO);

        log.info("===============================");
    }

    @PostMapping("/notice/modify")
    public String noticeModifyPOST(
            @Valid NoticeDTO noticeDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("AdminController >> noticeModifyPOST()");
        log.info("noticeDTO : " + noticeDTO.toString());
        log.info("===============================");

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("noticeDTO", noticeDTO);
            return "redirect:/admin/notice/modify?idx=" + noticeDTO.getIdx();
        }

        int result = adminService.noticeModify(noticeDTO);
        log.info("result : " + result);
        log.info("===============================");

        if (result > 0) {
            return "redirect:/admin/notice/view?idx=" + noticeDTO.getIdx();
        } else {
            return "redirect:/admin/notice/modify?err=modifyErr";
        }
    }

    @PostMapping(path = "/notice/delete")
    public String noticeDeletePOST(
            @RequestParam(name = "idx", defaultValue = "0") int idx
    ) {
        log.info("===============================");
        log.info("AdminController >> noticeDeletePOST()");

        NoticeDTO dto = adminService.noticeView(idx);

        if(dto != null && dto.getSave_file_name() != null) {
            FileUploadUtil.deleteFile(dto.getSave_file_name());
        }

        int result = adminService.noticeDelete(idx);

        if (result > 0) {
            return "redirect:/admin/list?type=notice";
        } else {
            return "redirect:/admin/list?type=notice&err=deleteErr";
        }
    }


    // FAQ
    @GetMapping(path = "/faq/view", params = "idx")
    public void faqViewGET(
            @RequestParam int idx,
            PageRequestDTO pageRequestDTO,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> faqViewGET()");
        FaqDTO faqDTO = adminService.faqView(idx);
        PageResponseDTO<FaqDTO> faqList = adminService.faqListByPage(pageRequestDTO);

        model.addAttribute("communityList", faqList);
        model.addAttribute("faqDTO", faqDTO);
        model.addAttribute("idx", idx);

        // 이전글 다음글
        Map<String, FaqDTO> faqMap = communityService.faqView(idx);
        faqMap.get("faqDTO").setContent(faqMap.get("faqDTO").getContent().replace("\r\n", "<br>"));

        model.addAttribute("dto", faqMap.get("faqDTO"));
        model.addAttribute("prevDTO", faqMap.get("faqPrevDTO"));
        model.addAttribute("nextDTO", faqMap.get("faqNextDTO"));

        log.info("===============================");
    }

    @GetMapping("/faq/regist")
    public void faqRegistGET() {
        log.info("===============================");
        log.info("AdminController >> faqRegistGET()");
        log.info("===============================");
    }

    @PostMapping("/faq/regist")
    public String faqRegistPOST(
            @Valid FaqDTO faqDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("AdminController >> faqRegistPOST()");
        log.info("===============================");

        log.info("errors: " + bindingResult.getAllErrors());
        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("faqDTO", faqDTO);
            return "redirect:/admin/faq/regist";
        }

        int result = adminService.faqRegist(faqDTO);

        if (result > 0) {
            return "redirect:/admin/list?type=faq";
        } else {
            redirectAttributes.addFlashAttribute("faqDTO", faqDTO);
            return "redirect:/admin/faq/regist";
        }
    }

    @GetMapping(path = "/faq/modify")
    public void faqModifyGET(
            @RequestParam(name = "idx", defaultValue = "0") int idx,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> faqModifyGET()");

        FaqDTO faqDTO = adminService.faqView(idx);
        model.addAttribute("faqDTO", faqDTO);

        log.info("===============================");
    }

    @PostMapping("/faq/modify")
    public String faqModifyPOST(
            @Valid FaqDTO faqDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("AdminController >> faqModifyPOST()");
        log.info("faqDTO : " + faqDTO.toString());

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("faqDTO", faqDTO);
            return "redirect:/admin/faq/modify?idx=" + faqDTO.getIdx();
        }

        int result = adminService.faqModify(faqDTO);
        log.info("result : " + result);
        log.info("===============================");

        if (result > 0) {
            return "redirect:/admin/faq/view?idx=" + faqDTO.getIdx();
        } else {
            return "redirect:/admin/faq/modify?err=modifyErr";
        }
    }

    @PostMapping(path = "/faq/delete")
    public String faqDeletePOST(
            @RequestParam(name = "idx", defaultValue = "0") int idx,
            HttpServletRequest req
    ) {
        log.info("===============================");
        log.info("AdminController >> faqDeletePOST()");

        int result = adminService.faqDelete(idx);

        if (result > 0) {
            return "redirect:/admin/list?type=faq";
        } else {
            return "redirect:/admin/list?type=faq&err=deleteErr";
        }
    }

    // QnA
    @GetMapping(path = "/qna/view", params = "idx")
    public void qnaViewGET(
            @RequestParam int idx,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> qnaViewGET()");

        QnaDTO qnaDTO = adminService.qnaView(idx);

        model.addAttribute("qnaDTO", qnaDTO);
        log.info("AdminController >> qnaViewGET() >> qnaDTO : " + qnaDTO);

        // 이전글 다음글
        Map<String, QnaDTO> qnaMap = communityService.qnaView(idx);
//        qnaMap.get("qnaDTO").setContent(qnaMap.get("qnaDTO").getContent().replace("\r\n", "<br>"));

        model.addAttribute("dto", qnaMap.get("qnaDTO"));
        model.addAttribute("prevDTO", qnaMap.get("qnaPrevDTO"));
        model.addAttribute("nextDTO", qnaMap.get("qnaNextDTO"));

        log.info("===============================");
    }

    @GetMapping("/qna/replyRegist")
    public void qnaReplyRegistGET(
            @RequestParam int idx,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> qnaReplyRegistGET()");


        QnaDTO qnaDTO = adminService.qnaView(idx);
        model.addAttribute("qnaDTO", qnaDTO);
        log.info("qnaDTO : " + qnaDTO);

        log.info("===============================");
    }

    @PostMapping("/qna/replyRegist")
    public String qnaReplyRegistPOST(
            @RequestParam int idx,
            @Valid QnaDTO qnaDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("AdminController >> qnaReplyRegistPOST()");

        log.info("errors: " + bindingResult.getAllErrors());
        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);
            return "redirect:/admin/qna/replyRegist?idx=" + idx;
        }

        int result = adminService.qnaReplyRegist(qnaDTO);

        if (result > 0) {
            return "redirect:/admin/list?type=qna";
        } else {
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);
            return "redirect:/admin/qna/replyRegist?idx=" + idx;
        }

    }

    @GetMapping(path = "/qna/replyModify")
    public void qnaReplyModifyGET(
            @RequestParam(name = "idx", defaultValue = "0") int idx,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> qnaReplyModifyGET()");

        QnaDTO qnaDTO = adminService.qnaView(idx);
        model.addAttribute("qnaDTO", qnaDTO);

        log.info("===============================");
    }

    @PostMapping("/qna/replyModify")
    public String qnaReplyModifyPOST(
            @Valid QnaDTO qnaDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        log.info("===============================");
        log.info("AdminController >> qnaReplyModifyPOST()");
        log.info("qnaDTO : " + qnaDTO.toString());

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);
            return "redirect:/admin/qna/replyModify?idx=" + qnaDTO.getIdx();
        }

        int result = adminService.qnaReplyModify(qnaDTO);

        log.info("result : " + result);
        log.info("===============================");

        if (result > 0) {
            return "redirect:/admin/qna/view?idx=" + qnaDTO.getIdx();
        } else {
            return "redirect:/admin/qna/replyModify?err=modifyErr";
        }
    }

    // view 페이지에서 답변 삭제
    @PostMapping(path = "/qna/delete")
    public String qnaDeletePOST(
            @RequestParam(name = "idx", defaultValue = "0") int idx
    ) {
        log.info("===============================");
        log.info("AdminController >> qnaDeletePOST()");

        int result = adminService.qnaDelete(idx);

//        int qnaReplyTotalCount = adminService.qnaReplyTotalCount(qnaDTO);
//        if (qnaReplyTotalCount == 0) {
//            adminService.replyStateYtoN(idx);
//        }

        if (result > 0) {
            return "redirect:/admin/list?type=qna";
        } else {
            return "redirect:/admin/list?type=qna&err=deleteErr";
        }
    }

    // 회원
    @GetMapping("/member/list")
    public void memberListGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        log.info("===============================");
        log.info("AdminController >> memberListGET()");

        if (bindingResult.hasErrors()) {
            log.info("AdminController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<MemberDTO> memberList = adminService.memberListByPage(pageRequestDTO);
        model.addAttribute("memberList", memberList);

        log.info("===============================");
    }

    @PostMapping("/member/list")
    public void memberListPOST() {
        log.info("===============================");
        log.info("AdminController >> memberListPOST()");
        log.info("===============================");
    }

    // 배송
    @GetMapping("/delivery/list")
    public void deliveryListGET(String delivery_state, HttpServletRequest req , Model model) {
        HttpSession session = req.getSession();
        String member_id = "";
        if(session.getAttribute("member_id") != null) {
            member_id = (String)session.getAttribute("member_id");
        }

        List<OrderDetailDTO> orderDetailList = myServiceIf.order_list(delivery_state, member_id);

        model.addAttribute("delivery_state", delivery_state);
        model.addAttribute("orderDetailList", orderDetailList);
    }

    @PostMapping("/delivery/updateState")
    @ResponseBody
    public void deliveryModifyUpdate(
            @RequestParam(name = "check_idx[]") ArrayList<Integer> check_idx,
            @RequestParam(name = "delivery_state") String delivery_state
    ) {
        int result = 0;

        result = adminService.deliveryUpdateState(check_idx, delivery_state);
//        for(int i=0; i<check_idx.size(); i++) {
//            result += adminService.deliveryUpdateState(check_idx.get(i), delivery_state);
//        }
        log.info("result : " + result);
        log.info("===============================");
    }

}
