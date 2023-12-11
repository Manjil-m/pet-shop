package com.example.onlineshopping.algorithm;

import com.example.onlineshopping.config.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class getRelatedProducts {
    public List<Product> getRelatedProducts(String category) {
        List<Product> relatedProducts = new ArrayList<>();

        try {
            // Establish a database connection
            Connection con = ConnectionProvider.getCon();

            // Prepare a SQL query to select product names and images based on the category
            String query = "SELECT name, image FROM product WHERE category = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, category);

            // Execute the query
            ResultSet rs = ps.executeQuery();

            // Fetch product names and images from the result set
            while (rs.next()) {
                String name = rs.getString("name");
                String image = rs.getString("image");

                // Create Product objects and add them to the list
                Product product = new Product(name, image);
                relatedProducts.add(product);
            }

            // Close the database connection
            con.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return relatedProducts;
    }

}
