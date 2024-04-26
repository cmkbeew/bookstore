package org.fullstack4.bookstore.util;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.UUID;

@Log4j2
public class FileUploadUtil {

    private static String uploadFolder = "C:\\Uploads";

    public static String saveFile(MultipartFile multipartFile) {
        String org_file_name = multipartFile.getOriginalFilename();
        String ext = org_file_name.substring(org_file_name.lastIndexOf("."), org_file_name.length());

        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0];

        File save_file = new File(uploadFolder + "\\" + newName + ext);

        try {
            multipartFile.transferTo(save_file);
        } catch(IllegalStateException e) {
            e.printStackTrace();
        } catch(Exception e) {
            e.printStackTrace();
        }

        return newName + ext;
    }

    public static void deleteFile(String save_file_name) {
        try {
            File file = new File(uploadFolder + "\\" + URLDecoder.decode(save_file_name, "UTF-8"));

            file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
