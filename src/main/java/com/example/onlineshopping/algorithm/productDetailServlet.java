//package com.example.onlineshopping.algorithm;
//
//
//import com.example.onlineshopping.dao.ProductDAO;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/productDetail")
//public class ProductDetailServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            String productId = request.getParameter("productId");
//            ProductDAO productDAO = new ProductDAO();
//            Product product = productDAO.getProductById(productId); // Fetch the selected product details by ID
//
//            if (product != null) {
//                // Fetch related products based on the category of the selected product
//                List<Product> relatedProducts = productDAO.getProductsByCategory(product.getCategory());
//
//                // Set attributes to pass product and recommendations to productDetail.jsp
//                request.setAttribute("product", product);
//                request.setAttribute("relatedProducts", relatedProducts);
//
//                // Forward to productDetail.jsp
//                request.getRequestDispatcher("productDetail.jsp").forward(request, response);
//            } else {
//                // Handle case where the product is not found
//                response.sendRedirect("errorPage.jsp");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Handle any exceptions
//            response.sendRedirect("errorPage.jsp");
//        }
//    }
//}
