
<%@page import="java.sql.*" %>
<%@ page import="com.example.onlineshopping.config.ConnectionProvider" %>
<%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    Long mobileNumber=Long.parseLong(request.getParameter("mobileNumber"));

    String securityQuestion=request.getParameter("securityQuestion");
    String answer=request.getParameter("answer");
    String password=request.getParameter("password");
    String address="";
    String city="";
    String state="";
    String country="";
    try{
            Connection con= ConnectionProvider.getCon();
            PreparedStatement ps=con.prepareStatement("INSERT INTO users values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setLong(3,mobileNumber);
            ps.setString(4,securityQuestion);
            ps.setString(5,answer);
            ps.setString(6,password);
            ps.setString(7,address);
            ps.setString(8,city);
            ps.setString(9,state);
            ps.setString(10,country);
            ps.executeUpdate();
            response.sendRedirect("signup.jsp?msg=valid");
    }
    catch(Exception e)
    {
    System.out.println(e);
    response.sendRedirect("signup.jsp?msg=invalid");
    }
%>
