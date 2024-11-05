package nhomj.example.hairsalon.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UpLoadService {

    private ServletContext servletContext;

    @Autowired
    public UpLoadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {

        String rootPath = this.servletContext.getRealPath("/resources/images");
        String fileName = "";
        try {
            byte[] bytes = file.getBytes();

            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return fileName;
    }
    public boolean deleteFile(String fileName, String targetFolder) {
        String rootPath = this.servletContext.getRealPath("/resources/images");
        File file = new File(rootPath + File.separator + targetFolder + File.separator + fileName);

        // Kiểm tra nếu file tồn tại và thực hiện xóa
        if (file.exists()) {
            return file.delete(); // Trả về true nếu xóa thành công, false nếu không thành công
        } else {
            System.out.println("File không tồn tại: " + fileName);
            return false;
        }
    }


}
