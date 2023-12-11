<%@page import="com.example.onlineshopping.config.ConnectionProvider" %>
<%@ page import="com.example.onlineshopping.algorithm.RecommendationEngine" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@include file= "header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
    <style>
        .products-container {
            display: flex;
            align-items: flex-start; /* Align items at the top of the container */
        }

        .mycart {
            flex: 2; /* Allow My Cart to grow and take available space */
            /* Other styles for your My Cart section */
        }

        .vertical-line {
            border-left: 1px solid #000;
            height: 300px;
            margin: 0 20px;
        }
        .related_product{
            flex: 1;
            width:30%; /* Allow Related Products to grow and take available space */
            /* Other styles for your Related Products section */
        }
    </style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>

<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
    if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
    if("dec".equals(msg))
    {
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<%
    if("removed".equals(msg))
    {
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<div class="products-container">
<table class="mycart">
    <style>
        .mycart{
            padding: 30px;
            float: left;
            width: 70%;
        }
        .mycart th{
            padding-left: 30px;
        }
        .mycart td{
            padding-left: 30px;
        }
    </style>
<thead>
<%
int total=0;
int sno=0;
try
{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL ");
    while (rs1.next())
    {
        total=rs1.getInt(1);
    }
%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total:<i class="fa fa-inr"></i> <%out.println(total);%> </th>
            <%if(total>0){%><th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%}%>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Image</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet rs=st.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
        while (rs.next())
        {
        %>
          <tr>
            <%sno=sno+1;%>
           <td><%out.println(sno);%></td>
            <td><%=rs.getString(2)%></td>
              <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4)%></td>
              <td><img src="images/<%=rs.getString(5)%>" style="width: 50px; height:50px;"></td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs.getString(9)%>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10)%> </td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
    }
    }
catch(Exception e)
    {}
%>
        </tbody>
      </table>


    <!-- Vertical Line -->
<%--    <div class="vertical-line"></div>--%>

<%--    <%--%>
<%--        RecommendationEngine recommendationEngine = new RecommendationEngine();--%>
<%--        List<String> relatedProducts = recommendationEngine.getRelatedProducts("Category1"); // Change the category as needed--%>
<%--    %>--%>
<%--<div class="related_product">--%>
<%--    <h2>Related Products</h2>--%>
<%--    <ul>--%>
<%--        <% for (String product : relatedProducts) { %>--%>
<%--        <li><%= product %></li>--%>
<%--        <% } %>--%>
<%--    </ul>--%>
<%--</div>--%>
      <br>
      <br>
      <br>

</div>
</div>
</div>
</body>
</html>
<%@include file= "footer.jsp"%>