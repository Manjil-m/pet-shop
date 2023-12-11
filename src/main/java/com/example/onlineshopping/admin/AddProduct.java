//package com.example.onlineshopping.admin;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.Part;
//import java.io.File;
//import java.io.IOException;
//import com.example.onlineshopping.config.ConnectionProvider;
//import controller.FileUploader;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//
//@WebServlet("/add_product")
//@MultipartConfig
//public class AddProduct extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        try {
//            String id = req.getParameter("id");
//            String name = req.getParameter("name");
//            String category = req.getParameter("category");
//            String price = req.getParameter("price");
//            Part part = req.getPart("image");
//            String fileName = part.getSubmittedFileName();
//            String active = req.getParameter("active");
//
//            // Specify the absolute path where you want to store images
//            String absolutePath = "C:/Users/manji/IdeaProjects/OnlineShopping/src/main/webapp/images"; // Adjust this path as needed
//
//
//            // Upload the image
//            FileUploader imageUploader = new FileUploader();
//            String imageRelativePath = imageUploader.extractFileName(part);
//            System.out.println(imageRelativePath);
//
//            // Insert the product data into the database
//            Connection con = ConnectionProvider.getCon();
//            PreparedStatement ps = con.prepareStatement("INSERT INTO product (id, name, category, price, image, active) VALUES (?, ?, ?, ?, ?, ?)");
//            ps.setString(1, id);
//            ps.setString(2, name);
//            ps.setString(3, category);
//            ps.setString(4, price);
//            ps.setString(5, imageRelativePath);
//            ps.setString(6, active);
//
//
//            int rowsAffected = ps.executeUpdate();
//
//            if (rowsAffected > 0) {
//                // Product inserted successfully
//                File file= new File(absolutePath);
//                part.write(absolutePath+File.separator+fileName);
//                resp.sendRedirect("../OnlineShopping_war_exploded/admin/addNewProduct.jsp?msg=done");
//            } else {
//                // Product insertion failed
//                resp.sendRedirect("../OnlineShopping_war_exploded/admin/addNewProduct.jsp?msg=wrong");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            resp.sendRedirect("../OnlineShopping_war_exploded/admin/addNewProduct.jsp?msg=wrong");
//        }
//    }
//}

package com.example.onlineshopping.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import com.example.onlineshopping.config.ConnectionProvider;
import controller.FileUploader;

import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/add_product")
@MultipartConfig
public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String category = req.getParameter("category");
            String price = req.getParameter("price");
            Part part = req.getPart("image");
            String fileName = part.getSubmittedFileName();
            String active = req.getParameter("active");

            // Specify the absolute path where you want to store images
            String absolutePath = "C:/Users/manji/IdeaProjects/OnlineShopping/src/main/webapp/images"; // Adjust this path as needed


            // Upload the image
            FileUploader imageUploader = new FileUploader();
            String imageRelativePath = imageUploader.extractFileName(part);
            System.out.println(imageRelativePath);

            // Insert the product data into the database
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("INSERT INTO product (id, name, category, price, image, active) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, category);
            ps.setString(4, price);
            ps.setString(5, imageRelativePath);
            ps.setString(6, active);


            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Product inserted successfully
                File file= new File(absolutePath);
                part.write(absolutePath+File.separator+fileName);
                resp.sendRedirect("../OnlineShopping_war_exploded/admin/addNewProduct.jsp?msg=done");
            } else {
                // Product insertion failed
                resp.sendRedirect("../OnlineShopping_war_exploded/admin/addNewProduct.jsp?msg=wrong");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("../OnlineShopping_war_exploded/admin/addNewProduct.jsp?msg=wrong");
        }
    }
}
