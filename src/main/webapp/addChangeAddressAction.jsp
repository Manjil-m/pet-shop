<%@ page import="com.example.onlineshopping.config.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
    String email = session.getAttribute("email").toString();
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String country = request.getParameter("country");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("UPDATE users SET address=?, city=?, state=?, country=? WHERE email=?");
        ps.setString(1, address);
        ps.setString(2, city);
        ps.setString(3, state);
        ps.setString(4, country);
        ps.setString(5, email);
        ps.executeUpdate();
        response.sendRedirect("addChangeAddress.jsp?msg=valid");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("addChangeAddress.jsp?msg=invalid");
    }
%>
