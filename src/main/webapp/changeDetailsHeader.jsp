<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetShop</title>

    <!-- fontawesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- bootstrap css -->
    <link rel = "stylesheet" href = "bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <!-- custom css -->
    <link rel = "stylesheet" href = "css/main.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<%--    <div class="topnav sticky">--%>
<%--            <center><h2>Change Details<i class="fa fa-edit"></i></h2></center>--%>
<%--             <%String email=session.getAttribute("email").toString(); %>--%>
<%--            <h2><a href="home.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></h2>--%>
<%--             <h2><a href="">Your Profile(<%out.println(email); %>) <i class='fas fa-user-alt'></i></a></h2>--%>
<%--            <a href="changePassword.jsp">Change Password <i class='fas fa-key'></i></a>--%>
<%--            <a href="">Add or change Address <i class='fas fa-map-marker-alt'></i></a>--%>
<%--            <a href="">Change Security Question <i class="fa fa-repeat"></i></a>--%>
<%--            <a href="">Change Mobile Number <i class='fas fa-phone'></i></a>--%>
<%--          </div>--%>
<nav class = "navbar navbar-expand-lg navbar-light bg-white py-4 fixed-top">
    <div class = "container">
        <%String email=session.getAttribute("email").toString(); %>
<div class = "collapse navbar-collapse order-lg-1" id = "navMenu">

        <h5><a href="home.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></h5>
        <h5 style="color: black">
            <a href="">Your Profile(<%out.println(email); %>)
        </h5>
    <ul class = "navbar-nav mx-auto text-center">
        <li class = "nav-item px-2 py-2">

            <a class = "nav-link text-uppercase text-dark" href = "changePassword.jsp">Change Password</a>
        </li>
        <li class = "nav-item px-2 py-2">
            <a class = "nav-link text-uppercase text-dark" href = "addChangeAddress.jsp">Add or Change Address</a>
        </li>
        <li class = "nav-item px-2 py-2">
            <a class = "nav-link text-uppercase text-dark" href = "changeSecurityQuestion.jsp">Change Security Questions</a>
        </li>
        <li class = "nav-item px-2 py-2">
            <a class = "nav-link text-uppercase text-dark" href = "changeMobileNumber.jsp">Change Mobile Number</a>
        </li>

    </ul>
</div>
    </div>
</nav>
