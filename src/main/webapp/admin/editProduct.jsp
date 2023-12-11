<%@page import="com.example.onlineshopping.config.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<html>
<head>
 <link rel="stylesheet" href="../css/addNewProduct-style.css">
 <title>Add New Product</title>
 <style>
  .back
  {
   color: black;
   margin-left: 2.5%
  }
 </style>
</head>
<body>
<br><br><br>
<br><br><br>
<h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<div style="color: black; text-align: center; font-size: 30px;">Edit Products <i class='fab fa-elementor'></i></div>
<%
 String id=request.getParameter("id");
 try
 {
  Connection con=ConnectionProvider.getCon();
  Statement st=con.createStatement();
  ResultSet rs= st.executeQuery(String.format("select * from product where id=%s",id));
  while (rs.next())
  {
%>
<form action="editProductAction.jsp" method="post">
 <input type="hidden" name="id" value="<%out.println(id);%>">
 <div class="left-div">
  <h3>Enter Name</h3>
  <input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required>
  <hr>
 </div>

 <div class="right-div">
  <h3>Enter Category</h3>
  <input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>" required>
  <hr>
 </div>

 <div class="left-div">
  <h3>Enter Price</h3>
  <input class="input-style" type="number" name="price" value="<%=rs.getString(4)%>" required>
  <hr>
 </div>

<%-- <div class="right-div">--%>
<%--  <h3>Select Image</h3>--%>
<%--  <input type="file" name="image" value="<%=rs.getString(5)%>">--%>
<%-- </div>--%>

 <div class="right-div">
  <h3>Status</h3>
  <select class="input-style" name="active">
   <option value="Active">Active</option>
   <option value="Inactive">Inactive</option>
  </select>
  <hr>
 </div>



 <button class="button"> Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
  }
}
catch (Exception e)
{
 System.out.println(e);
}
%>

</body>
</html>
<%@include file="../footer.jsp" %>