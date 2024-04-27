package org.fullstack4.bookstore.controller;

import lombok.RequiredArgsConstructor;
import org.fullstack4.bookstore.dto.DataDTO;
import org.fullstack4.bookstore.service.DataService;
import org.fullstack4.bookstore.util.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/data")
public class DataController {

    private final DataService dataService;

    @GetMapping("/list")
    public void dataList(Model model) {
        List<DataDTO> dataList = dataService.dataList();

        model.addAttribute("dataList", dataList);
    }

    @GetMapping("/view")
    public void dataView(int data_idx, Model model) {
        DataDTO dataDTO = dataService.dataView(data_idx);

        model.addAttribute("dataDTO", dataDTO);
    }

    @GetMapping("/regist")
    public void data_regist() {

    }

    @PostMapping("regist")
    public String dataRegist(@RequestParam("file") MultipartFile multipartFile,
                              DataDTO dataDTO,
                              RedirectAttributes redirectAttributes) {
        String save_file_name = "";

        if(!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile);
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
        DataDTO dataDTO = dataService.dataView(data_idx);

        model.addAttribute("dataDTO", dataDTO);
    }

    @PostMapping("/modify")
    public String data_modify(@RequestParam("file") MultipartFile multipartFile,
                              DataDTO dataDTO,
                              RedirectAttributes redirectAttributes) {
        DataDTO dto = dataService.dataView(dataDTO.getData_idx());

        String save_file_name = "";

        if(!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile);

            FileUploadUtil.deleteFile(dto.getSave_file_name());
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
        DataDTO dataDTO = dataService.dataView(data_idx);

        if(dataDTO != null && dataDTO.getSave_file_name() != null) {
            FileUploadUtil.deleteFile(dataDTO.getSave_file_name());
        }

        int result = dataService.dataDelete(data_idx);

        if(result > 0) {
            return "redirect:/data/list";
        } else {
            return "redirect:/data/view?data_idx=" + data_idx;
        }
    }
}
