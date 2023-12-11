//package com.example.onlineshopping.dao;
//import com.example.onlineshopping.algorithm.Product;
//import com.example.onlineshopping.config.ConnectionProvider;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//public class ProductDAO {
//    // Method to retrieve products from the database
//    public List<Product> getProductsByCategory(String category) {
//        List<Product> productList = new ArrayList<>();
//
//        try {
//            Connection con = ConnectionProvider.getCon();
//            String query = "SELECT id, name, image FROM product WHERE category = ?";
//            PreparedStatement ps = con.prepareStatement(query);
//            ps.setString(1, category);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                String id = rs.getString("id");
//                String name = rs.getString("name");
//                String image = rs.getString("image");
//
//                // Create Product objects and add them to the list
//                Product product = new Product(id, name, image);
//                productList.add(product);
//            }
//
//            con.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            // Handle any database connection or query errors
//        }
//
//        return productList;
//    }
//
//
//}
