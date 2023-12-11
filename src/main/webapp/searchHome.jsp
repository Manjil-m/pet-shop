<%@ page import="java.sql.*" %>
<%@ page import="com.example.onlineshopping.config.ConnectionProvider" %>
<%@include file= "header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<br><br>
<br><br>
<br><br>
<%--<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>--%>
<table class="search">
    <style>
        .search{
            padding: 30px;
        }
        .search th{
            padding-left: 30px;
        }
        .search td{
            padding-left: 30px;
        }
    </style>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
              <th scope="col">Image</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
       <%
            int z=0;
            try{
                String search=request.getParameter("search");
                Connection con= ConnectionProvider.getCon();
                Statement st=con.createStatement();
                ResultSet rs = st.executeQuery("select * from product where (name like '%" + search + "%' or category like '%" + search + "%') and active='Active'");

//                ResultSet rs= st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Active'");
                while (rs.next()){
                    z=1;

        %>
          <tr>
              <td><%=rs.getString(1)%></td>
              <td><%=rs.getString(2)%></td>
              <td><%=rs.getString(3)%></td>
              <td><i class="fa fa-inr"></i><%=rs.getString(4)%></td>
              <td><img src="images/<%=rs.getString(5)%>" style="width: 50px; height:50px;"></td>
              <td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
        <%
                }
            }
            catch(Exception e){
                System.out.println(e);
            }
        %>
        </tbody>
      </table>
    <%if(z==0){ %>
	<h1 style="color:black; text-align: center;">Nothing to show</h1>
	<%}%>
      <br>
      <br>
      <br>


</body>
</html>
<%@include file= "footer.jsp"%>