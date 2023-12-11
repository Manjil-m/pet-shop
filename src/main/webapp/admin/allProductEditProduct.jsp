<%@page import="com.example.onlineshopping.config.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Home</title>
    <style>
        h3 {
            color: yellow;
            text-align: center;
        }
        table {
            width: 80%; /* Set the width of the table */
            margin: 0 auto; /* Center the table on the page */
        }
        th, td {
            padding: 10px; /* Add padding to the table cells */
        }
    </style>
</head>
<body>
<%--<br><br><br>--%>
<%--<br><br>--%>
<div style="color: black; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<br>
<%
    String msg=request.getParameter("msg");
    if("done".equals(msg))
    {
%>
<h3 class="alert">Product Successfully Updated!</h3>
<%} %>
<%
    if("wrong".equals(msg))
    {
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<table>
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Category</th>
        <th scope="col"><i class="fa fa-inr"></i> Price</th>
        <th>Image</th>
        <th>Status</th>
        <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
    </tr>
    </thead>
    <tbody>
    <%
        try {
            Connection con=ConnectionProvider.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from product");
            while(rs.next())
            {
    %>
    <tr>
        <td> <%=rs.getString(1) %></td>
        <td> <%=rs.getString(2) %></td>
        <td> <%=rs.getString(3) %></td>
        <td><i class="fa fa-inr"></i></i><%=rs.getString(4) %> </td>
        <td><img src="../images/<%=rs.getString(5)%>" style="width: 50px; height:50px;"></td>
        <td><%=rs.getString(6) %> </td>

        <td><a href="editProduct.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
    </tr>
    <%}
    }
    catch (Exception e)
    {
        System.out.println(e);
    }%>
    </tbody>
</table>
<br>
</body>
</html>
<%--<%@include file="../footer.jsp" %>--%>