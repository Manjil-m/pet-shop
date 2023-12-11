<%@page import="com.example.onlineshopping.config.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file= "header.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="src/main/webapp/css/messageUs.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <title>Message Us</title>
</head>
<body>
<br><br><br>
<br><br><br>

<div style="color: black; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
    String msg=request.getParameter("msg");
    if ("valid".equals(msg))
    {
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%}%>
<%
    if ("invalid".equals(msg))
    {
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%}%>
<center>
    <style>
        .input-style{
            width: 50%;
            height: 50%;
        }
        .body{
            height: 40%;
        }
    </style>
    <br><br>
    <form action="messageUsAction.jsp" method="post">
        <input class="input-style" name="subject" type="text" placeholder="subject" required>
        <hr>
        <textarea class="input-style body" name="body" placeholder="Enter your Message" required></textarea>
        <hr>
        <button class = "btn btn-primary mt-3" type="submit">Submit</button>
<%--        <button class="button" type="submit">Send <i class="far fa-arrow-alt-circle-right"></i></button>--%>
    </form>
    <br><br><br>
    <br><br><br>
</center>
</body>
</html>
<%@include file= "footer.jsp"%>