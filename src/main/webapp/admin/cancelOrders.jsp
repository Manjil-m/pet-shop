<%@page import="com.example.onlineshopping.config.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="../css/ordersReceived-style.css">
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

<div style="color: black; text-align: center; font-size: 30px;">Canceled Orders <i class='fas fa-dolly'></i></div>

<table id="customers">
    <tr>
        <th>Mobile Number</th>
        <th scope="col">Product Name</th>
        <th scope="col">Qty</th>
        <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
        <th>Address</th>
        <th>City</th>
        <th>State</th>
        <th>Country</th>
        <th scope="col">Order Date</th>
        <th scope="col">Expected Delivery Date</th>
        <th scope="col">Payment Method</th>
        <th scope="col">T-ID</th>
        <th scope="col">Status</th>
    </tr>
    <%
        try
        {
            Connection con=ConnectionProvider.getCon();
            Statement st= con.createStatement();
            ResultSet rs=st.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Cancel'");
            while(rs.next())
            {
    %>

    <tr>
        <td><%=rs.getString(10)%></td>
        <td><%=rs.getString(17)%></td>
        <td><%=rs.getString(3)%></td>
        <td><i class="fa fa-inr"></i> <%=rs.getString(5)%> </td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(8)%></td>
        <td><%=rs.getString(9)%></td>
        <td><%=rs.getString(11)%></td>
        <td><%=rs.getString(12)%></td>
        <td><%=rs.getString(13)%></td>
        <td><%=rs.getString(14)%></td>
        <td><%=rs.getString(15)%></td>
    </tr>
    <%
            }}
        catch (Exception e)
        {
            System.out.println(e);

        }
    %>
</table>
<br>
<br>
<br>
</body>
</html>
<%--<%@include file="../footer.jsp" %>--%>