<%@page import="com.example.onlineshopping.config.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%--<style>--%>
<%--h3--%>
<%--{--%>
<%--	color: yellow;--%>
<%--	text-align: center;--%>
<%--}--%>
<%--</style>--%>
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

<div style="color: black; text-align:center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
<%
try
{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select *from message");
    while(rs.next())
    {
%>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
          </tr>
         <%
             }}
         catch(Exception e)
         {
             System.out.println(e);
         }
         %>
        </tbody>
      </table>
<br><br><br>
</body>
</html>
<%--<%@include file="../footer.jsp" %>--%>
