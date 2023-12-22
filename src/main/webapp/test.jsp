<%--<%@ page import="java.io.File" %>--%>
<%--<%@ page import="java.io.IOException" %>--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Permission Test</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Permission Test</h1>--%>

<%--<%--%>
<%--    // Specify the path to the test file--%>
<%--    String testFilePath = "C:/Users/manji/IdeaProjects/OnlineShopping/images/test.txt"; // Change the file path accordingly--%>
<%--    File testFile = new File(testFilePath);--%>

<%--    try {--%>
<%--        // Create a test file--%>
<%--        if (testFile.createNewFile()) {--%>
<%--            out.println("<p>Test file created successfully.</p>");--%>
<%--        } else {--%>
<%--            out.println("<p>Test file already exists.</p>");--%>
<%--        }--%>
<%--    } catch (IOException e) {--%>
<%--        out.println("<p>Error creating test file: " + e.getMessage() + "</p>");--%>
<%--    }--%>
<%--%>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Form</title>
    <!-- Include any necessary CSS/JS libraries for datetime picker if used -->
</head>
<body>
<form action="servicesAction.jsp" method="post" class="py-5">
    <div class="form-group">
        <input type="text" class="form-control border-0 p-4" name="name" placeholder="Your Name" required="required" />
    </div>
    <div class="form-group">
        <input type="email" class="form-control border-0 p-4" name="email" placeholder="Your Email" required="required" />
    </div>
    <div class="form-group">
        <input type="text" class="form-control border-0 p-4" name="reservationDate" placeholder="Reservation Date (YYYY-MM-DD)" required="required" />
    </div>
    <div class="form-group">
        <input type="text" class="form-control border-0 p-4" name="reservationTime" placeholder="Reservation Time (HH:MM:SS)" required="required" />
    </div>
    <div class="form-group">
        <select name="serviceType" class="custom-select border-0 px-4" style="height: 47px;">
            <option selected>Pet Boarding</option>
            <option value="1">Pet Feeding</option>
            <option value="2">Pet Grooming</option>
            <option value="3">Pet Training</option>
        </select>
    </div>
    <div>
        <button class="btn btn-dark btn-block border-0 py-3" type="submit">Book Now</button>
    </div>
</form>
</body>
</html>
