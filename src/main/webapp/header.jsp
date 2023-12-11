<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetShop</title>
    <link rel="icon" href="images/R.png">
    <!-- fontawesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- bootstrap css -->
    <link rel = "stylesheet" href = "bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <!-- custom css -->
    <link rel = "stylesheet" href = "css/main.css">

    <style>
        .order-lg-2.nav-btns {
            display: flex; /* Use flexbox to arrange items in a row */
            align-items: center; /* Align items vertically in the center */
        }

        /* Adjust button margin if needed */
        .order-lg-2.nav-btns button {
            margin-right: 10px; /* Adds spacing between buttons */
        }
    </style>

</head>
<body>
<%
String email=session.getAttribute("email").toString();
%>
<!-- navbar -->
<nav class = "navbar navbar-expand-lg navbar-light bg-white py-4 fixed-top">
    <div class = "container">
        <a class = "navbar-brand d-flex justify-content-between align-items-center order-lg-0" href = "index.jsp">
            <img src = "images/R.png" alt = "site icon">
            <span class = "text-uppercase fw-lighter ms-2">PetStore</span>
        </a>

        <div class = "order-lg-2 nav-btns">
            <button type = "button" class = "btn position-relative">
                <a class = "nav-link text-uppercase text-dark" href = "myCart.jsp"><i class = "fa fa-shopping-cart"></i></a>
<%--                <span class = "position-absolute top-0 start-100 translate-middle badge bg-primary">*</span>--%>
            </button>

<%--            <button type = "button" class = "btn position-relative">--%>
<%--                <i class = "fa fa-heart"></i>--%>
<%--                <span class = "position-absolute top-0 start-100 translate-middle badge bg-primary">2</span>--%>
<%--            </button>--%>

<%--            <input type="text" placeholder="Search.." style="width: 109px">--%>
<%--            <button type = "Submit" class = "btn position-relative">--%>
<%--                <a class="nav-link text-uppercase text-dark" href="searchHome.jsp"><i class = "fa fa-search"></i></a>--%>

<%--            </button>--%>
            <form action="searchHome.jsp" method="GET">
                <input type="text" name="search" placeholder="Search.." style="width: 109px">
                <button type="submit" class="btn position-relative">
                    <i class="fa fa-search"></i>
                </button>
            </form>

        </div>

        <button class = "navbar-toggler border-0" type = "button" data-bs-toggle = "collapse" data-bs-target = "#navMenu">
            <span class = "navbar-toggler-icon"></span>
        </button>

        <div class = "collapse navbar-collapse order-lg-1" id = "navMenu">
            <ul class = "navbar-nav mx-auto text-center">
                <li class = "nav-item px-2 py-2">
                    <a class = "nav-link text-uppercase text-dark" href = "home.jsp">home</a>
                </li>
<%--                <li class = "nav-item px-2 py-2">--%>
<%--                    <a class = "nav-link text-uppercase text-dark" href = "myCart.jsp">My Cart</a>--%>
<%--                </li>--%>
                <li class = "nav-item px-2 py-2">
                    <a class = "nav-link text-uppercase text-dark" href = "myOrders.jsp">My Orders</a>
                </li>
                <li class = "nav-item px-2 py-2">
                    <a class = "nav-link text-uppercase text-dark" href = "changeDetails.jsp">Change Details</a>
                </li>
                <li class = "nav-item px-2 py-2">
                    <a class = "nav-link text-uppercase text-dark" href = "messageUs.jsp">Message Us</a>
                </li>
                <li class = "nav-item px-2 py-2 border-0">
                    <a class = "nav-link text-uppercase text-dark" href = "about.jsp">About</a>
                </li>
                <li class = "nav-item px-2 py-2 border-0">
                    <a class = "nav-link text-uppercase text-dark" href = "logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>