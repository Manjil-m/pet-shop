<%@page import="com.example.onlineshopping.config.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file= "header.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyOrders</title>
<!-- fontawesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- bootstrap css -->
<link rel = "stylesheet" href = "bootstrap-5.0.2-dist/css/bootstrap.min.css">
<!-- custom css -->
<link rel = "stylesheet" href = "css/main.css">
<body>
<br>
<br>
<br>
<br>
<br>
<%--<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>--%>
<table class="myorders">
    <style>
        .myorders{
            padding: 27px;
        }
        .myorders th{
            padding-left: 27px;
        }
        .myorders td{
            padding-left: 27px;
        }
    </style>
    <thead>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
<%
int sno=0;
try
{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs= st.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
    while(rs.next())
    {
        sno=sno+1;

%>
          <tr>
            <td><%out.println(sno);%></td>
            <td><%=rs.getString(17)%></td>
            <td><%=rs.getString(18)%></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(19)%> </td>
            <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5)%></td>
             <td><%=rs.getString(11)%></td>
              <td><%=rs.getString(12)%></td>
               <td><%=rs.getString(13)%></td>
               <td><%=rs.getString(15)%></td>
            </tr>
         <%
             }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>
<%@include file= "footer.jsp"%>
</body>
</html>