package controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

// @WebServlet("/fileUpload")
// @MultipartConfig
public class FileUploader extends HttpServlet {
    public static String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");

        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println(req.getParameter("test1"));
        Part filePart = req.getPart("file");
        String fileName = extractFileName(filePart);
        InputStream fileContent = filePart.getInputStream();
        String destImageFolder = "/uploads";
        System.out.println(fileContent.toString());
        System.out.println(fileName);
        // file move garaunii code haii
    }

}
