<%@page import="com.example.onlineshopping.config.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number</title>
</head>
<body>
<br><br><br>
<br><br><br>
<style>
 .alert{
  color: black;
 }
</style>
<%
String msg=request.getParameter("msg");
if ("done".equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%}%>
<%
 if ("wrong".equals(msg))
 {
%>
<h3 class="alert">Your Password is wrong!</h3>
<%}%>

<form action="changeMobileNumberAction.jsp" mehod="post">
 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="number" name="mobileNumber" placeholder="Enter your Mobile Number" required>
 <hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter your Password (For Security)" required>
<hr>
 <button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
</html>
<%@include file="footer.jsp"%>