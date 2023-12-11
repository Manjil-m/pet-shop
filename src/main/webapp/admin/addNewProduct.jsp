<%@page import="com.example.onlineshopping.config.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%--<%@include file="../productDetail.jsp"%>--%>
<html>
<head>
 <link rel="stylesheet" href="../css/addNewProduct-style.css">
 <title>Add New Product</title>
</head>
<body>
<%--<br><br><br>--%>
<%--<br><br><br>--%>
<div style="color: black; text-align: center; font-size: 30px;">Add New Product <i class='fab fa-elementor'></i></div>
<%
 String msg=request.getParameter("msg");
 if("done".equals(msg))
 {
%>
<h3 class="alert">Product Added Successfully!</h3>
<%}%>
<%
 if("wrong".equals(msg))
 {
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%}%>
<%
 int id=1;
 try {
  Connection con = ConnectionProvider.getCon();
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery("select max(id) from product");
  while (rs.next()) {
   id = rs.getInt(1);
   id = id+1;
  }
 }
 catch(Exception e)
 { }
%>
<form action="../add_product" method="post" enctype="multipart/form-data">
 <h3 style="color: black;">Product ID: <%out.println(id); %> </h3>
 <input type="hidden" name="id" value="<%out.println(id); %>">

 <div class="left-div">
  <h3>Enter Name</h3>
  <input class="input-style" type="text" name="name" placeholder="Enter name" required>
  <hr>
 </div>

 <div class="right-div">
  <h3>Select Category</h3>
  <select class="input-style" name="category" required>
   <option value="food">Food</option>
   <option value="accessories">Accessories</option>
   <option value="health">Health</option>

  </select>
  <hr>
 </div>
<%--  <div class="right-div">--%>
<%-- <form action="../category" method="post">--%>
<%--  <select name="category">--%>
<%--   <option value="food">Food</option>--%>
<%--   <option value="accessories">Accessories</option>--%>
<%--   <option value="health">Health</option>--%>
<%--  </select>--%>
<%--  <input type="submit" value="Get Recommendations">--%>
<%-- </form>--%>
<%--</div>--%>

 <div class="left-div">
  <h3>Enter Price</h3>
  <input class="input-style" type="number" name="price" placeholder="Enter price" required>
  <hr>
 </div>

 <div class="right-div">
  <h3>Select Image</h3>
  <input type="file" name="image">
 </div>

 <div class="left-div">
  <h3>Status</h3>
  <select class="input-style" name="active">
   <option value="Active">Active</option>
   <option value="Inactive">Inactive</option>
  </select>
  <hr>
 </div>


 <button class="button"> Save <i class='far fa-arrow-alt-circle-right'></i> </button>
</form>
</body>
</html>
<%--<%@include file="adminFooter.jsp" %>--%>