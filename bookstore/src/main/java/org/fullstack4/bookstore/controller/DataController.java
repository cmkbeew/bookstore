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
    public void data_list(Model model) {
        List<DataDTO> dataList = dataService.list_data();

        model.addAttribute("dataList", dataList);
    }

    @GetMapping("/view")
    public void data_view(int data_idx, Model model) {
        DataDTO dataDTO = dataService.view_data(data_idx);

        model.addAttribute("dataDTO", dataDTO);
    }

    @GetMapping("/regist")
    public void data_regist() {

    }

    @PostMapping("regist")
    public String data_regist(@RequestParam("file") MultipartFile multipartFile,
                              DataDTO dataDTO,
                              RedirectAttributes redirectAttributes) {
        String save_file_name = "";

        if(!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile);
        }

        dataDTO.setOrg_file_name(multipartFile.getOriginalFilename());
        dataDTO.setSave_file_name(save_file_name);

        int result = dataService.regist_data(dataDTO);

        if(result > 0) {
            return "redirect:/data/list";
        } else {
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);

            return "redirect:/data/regist";
        }
    }

    @GetMapping("/modify")
    public void data_modify(int data_idx, Model model) {
        DataDTO dataDTO = dataService.view_data(data_idx);

        model.addAttribute("dataDTO", dataDTO);
    }

    @PostMapping("/modify")
    public String data_modify(@RequestParam("file") MultipartFile multipartFile,
                              DataDTO dataDTO,
                              RedirectAttributes redirectAttributes) {
        DataDTO dto = dataService.view_data(dataDTO.getData_idx());

        String save_file_name = "";

        if(!multipartFile.isEmpty()) {
            save_file_name = FileUploadUtil.saveFile(multipartFile);

            FileUploadUtil.deleteFile(dto.getSave_file_name());
        }

        dataDTO.setOrg_file_name(multipartFile.getOriginalFilename());
        dataDTO.setSave_file_name(save_file_name);

        int result = dataService.modify_data(dataDTO);

        if(result > 0) {
            return "redirect:/data/view?data_idx=" + dataDTO.getData_idx();
        } else {
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);

            return "redirect:/data/modify?data_idx=" + dataDTO.getData_idx();
        }
    }

    @PostMapping("/delete")
    public String data_delete(int data_idx, RedirectAttributes redirectAttributes) {
        int result = dataService.delete_data(data_idx);

        if(result > 0) {
            return "redirect:/data/list";
        } else {
            return "redirect:/data/view?data_idx=" + data_idx;
        }
    }
}
