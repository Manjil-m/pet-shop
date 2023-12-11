<%--<%@page import="com.example.onlineshopping.config.ConnectionProvider"%>--%>
<%--<%@page import="java.sql.*"%>--%>
<%--<%--%>
<%--  String id=request.getParameter("id");--%>
<%--  String name=request.getParameter("name");--%>
<%--  String category=request.getParameter("category");--%>
<%--  String price=request.getParameter("price");--%>
<%--  String active=request.getParameter("active");--%>
<%--//  String image=request.getParameter("image");--%>
<%--//  System.out.println(image);--%>
<%--  try--%>
<%--  {--%>
<%--    Connection con=ConnectionProvider.getCon();--%>
<%--    PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?)");--%>
<%--    ps.setString(1, id);--%>
<%--    ps.setString(2, name);--%>
<%--    ps.setString(3, category);--%>
<%--    ps.setString(4, price);--%>
<%--    ps.setString(5, active);--%>
<%--    ps.executeUpdate();--%>
<%--    response.sendRedirect("addNewProduct.jsp?msg=done");--%>

<%--  }--%>
<%--  catch(Exception e)--%>
<%--  {--%>
<%--    response.sendRedirect("addNewProduct.jsp?msg=wrong");--%>

<%--  }--%>

<%--%>--%>

<%@ page import="com.example.onlineshopping.utils.ImageUploader" %>
<%@ page import="com.example.onlineshopping.config.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
  String id = request.getParameter("id");
  String name = request.getParameter("name");
  String category = request.getParameter("category");
  String price = request.getParameter("price");
  Part imagePart = request.getPart("image");
  String active = request.getParameter("active");


  try {
//    // First, upload the image using ImageUploader
//    ImageUploader imageUploader = new ImageUploader();
//    String filePath = "C:/Users/manji/IdeaProjects/OnlineShopping/images"; // Set the actual image directory path
//    String fileType = "image"; // Set the allowed file type, e.g., "image"
//    String imageRelativePath = imageUploader.uploadImage(imagePart, filePath, fileType);

    // Now, insert data into the database along with the image path
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO product (id, name, category, price, active, image_path) VALUES (?, ?, ?, ?, ?, ?)");
    ps.setString(1, id);
    ps.setString(2, name);
    ps.setString(3, category);
    ps.setString(4, price);
    ps.setString(5, active);
//    ps.setString(6, imageRelativePath); // Set the image path in the query

    ps.executeUpdate();

    response.sendRedirect("addNewProduct.jsp?msg=done");
  } catch (Exception e) {
    response.sendRedirect("addNewProduct.jsp?msg=wrong");
  }
%>
