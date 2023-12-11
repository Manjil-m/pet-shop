
package com.example.onlineshopping.utils;
import com.example.onlineshopping.config.ConnectionProvider;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

public class ImageUploader {
    public String uploadImage(Part filePart, String filePath, String fileType) {
        try {
            String fileName = UUID.randomUUID() + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            InputStream fileContent = filePart.getInputStream();
            String fileExtension = fileName.substring(fileName.lastIndexOf('.')).toLowerCase();

            // Validate file extension
            if (!(fileExtension.equals(".jpg") || fileExtension.equals(".jpeg") || fileExtension.equals(".png") || fileExtension.equals(".gif") || fileExtension.equals(".bmp"))) {
                throw new RuntimeException("Enter a valid image with supported extensions (jpeg, jpg, png, gif, bmp).");
            }

            // Define the directory to save the uploaded image
            File directory = new File(filePath);
            if (!directory.exists()) {
                if (!directory.mkdirs()) {
                    throw new RuntimeException("Failed to create directory: " + filePath);
                }
            }

            // Save the file to the upload directory
            String fullPath = filePath + File.separator + fileName;
            Files.copy(fileContent, Paths.get(fullPath));

            // Return the full path to the uploaded image
            return fullPath;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}


