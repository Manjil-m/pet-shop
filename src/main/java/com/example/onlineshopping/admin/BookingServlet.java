package com.example.onlineshopping.admin;// BookingServlet.java
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String reservationDateTime = request.getParameter("reservationDateTime");
        String serviceType = request.getParameter("serviceType");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop_db", "root", "");

            String query = "INSERT INTO booking (name, email, reservationDateTime, serviceType) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, reservationDateTime);
            pstmt.setString(4, serviceType);

            pstmt.executeUpdate();
            con.close();

            response.sendRedirect("services.jsp?msg=valid"); // Redirect to a success page
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("services.jsp?msg=invalid"); // Redirect to an error page
        }
    }
}
