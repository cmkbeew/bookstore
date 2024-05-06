package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.bookstore.dto.*;
import org.fullstack4.bookstore.service.DataService;
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
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value="/data")
@RequiredArgsConstructor
public class DataController {

    private final DataService dataService;

    @GetMapping("/list")
    public void dataListGET(
            @Valid PageRequestDTO pageRequestDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Model model
    ) {

        log.info("===============================");
        log.info("DataController >> dataListGET()");

        if (bindingResult.hasErrors()) {
            log.info("DataController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<DataDTO> dataList = dataService.dataListByPage(pageRequestDTO);
        model.addAttribute("dataList", dataList);

        log.info("===============================");
    }


    @GetMapping("/view")
    public void dataView(
            @RequestParam int data_idx,
            Model model
    ) {

        log.info("===============================");
        log.info("DataController >> dataViewGET()");

        // 이전글 다음글
        Map<String, DataDTO> dataMap = dataService.dataView(data_idx);
        dataMap.get("dataDTO").setContent(dataMap.get("dataDTO").getContent().replace("\r\n", "<br>"));

        log.info("dataDTO" + dataMap.get("dataDTO"));

        model.addAttribute("dto", dataMap.get("dataDTO"));
        model.addAttribute("prevDTO", dataMap.get("dataPrevDTO"));
        model.addAttribute("nextDTO", dataMap.get("dataNextDTO"));

        log.info("===============================");
    }

    // 파일 다운로드 (시도했으나 실패)
    @GetMapping("/filedownload")
    public String filedownloadGET(
            @RequestParam("data_idx") int data_idx,
            HttpServletRequest req,
            HttpServletResponse res
    ) throws UnsupportedEncodingException {
        DataDTO dataDTO = dataService.dataModifyGet(data_idx);

        File file = new File(FileUploadUtil.uploadFolder+"\\"+ dataDTO.getSave_file_name());
        FileUploadUtil.download(req,res,dataDTO.getOrg_file_name(),dataDTO.getSave_file_name());
        String orgFileName = URLEncoder.encode(dataDTO.getOrg_file_name(), "UTF-8");
        res.setHeader("Content-Disposition", "attachment; filename=\"" + orgFileName + "\";");
        res.setHeader("Content-Transfer-Encoding", "binary");
        res.setHeader("Content-Type",
                dataDTO.getSave_file_name().substring(orgFileName.lastIndexOf("."), dataDTO.getSave_file_name().length()));
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

        return "redirect:/data/view?data_idx=" + data_idx;
    }

    @GetMapping("/regist")
    public void data_registGET() {
        log.info("===============================");
        log.info("DataController >> data_registGET()");
        log.info("===============================");
    }

    @PostMapping("regist")
    public String dataRegistPOST(
            @RequestParam("file") MultipartFile multipartFile,
            @Valid DataDTO dataDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);

            return "redirect:/data/regist";
        }

        String save_file_name = "";

        if(!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile, "data");
        }

        dataDTO.setOrg_file_name(multipartFile.getOriginalFilename());
        dataDTO.setSave_file_name(save_file_name);

        int result = dataService.dataRegist(dataDTO);

        if(result > 0) {
            return "redirect:/data/list";
        } else {
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);

            return "redirect:/data/regist";
        }
    }

    @GetMapping("/modify")
    public void dataModify(int data_idx, Model model) {
        log.info("===============================");
        log.info("DataController >> dataModifyGET()");
        DataDTO dataDTO = dataService.dataModifyGet(data_idx);

        model.addAttribute("dataDTO", dataDTO);
    }

    @PostMapping("/modify")
    public String data_modify(

            @RequestParam("file") MultipartFile multipartFile,
            @Valid DataDTO dataDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        if(bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);

            return "redirect:/data/modify?data_idx=" + dataDTO.getData_idx();
        }

        DataDTO dto = dataService.dataModifyGet(dataDTO.getData_idx());

        String save_file_name = "";

        // 수정 파일 있을 때 저장 및 기존 파일 삭제
        if(!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile, "data");

            FileUploadUtil.deleteFile(dto.getSave_file_name(), "data");
        }

        dataDTO.setOrg_file_name(multipartFile.getOriginalFilename());
        dataDTO.setSave_file_name(save_file_name);

        int result = dataService.dataModify(dataDTO);

        if(result > 0) {
            return "redirect:/data/view?data_idx=" + dataDTO.getData_idx();
        } else {
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);
            return "redirect:/data/modify?data_idx=" + dataDTO.getData_idx();
        }
    }

    @PostMapping("/delete")
    public String data_delete(int data_idx, RedirectAttributes redirectAttributes) {

        DataDTO dto = dataService.dataModifyGet(data_idx);

        if(dto != null && dto.getSave_file_name() != null) {
            FileUploadUtil.deleteFile(dto.getSave_file_name(), "data");
        }
        int result = dataService.dataDelete(data_idx);

        if(result > 0) {
            return "redirect:/data/list";
        } else {
            return "redirect:/data/view?data_idx=" + data_idx;
        }
    }
}
