<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Permission Test</title>
</head>
<body>
<h1>Permission Test</h1>

<%
    // Specify the path to the test file
    String testFilePath = "C:/Users/manji/IdeaProjects/OnlineShopping/images/test.txt"; // Change the file path accordingly
    File testFile = new File(testFilePath);

    try {
        // Create a test file
        if (testFile.createNewFile()) {
            out.println("<p>Test file created successfully.</p>");
        } else {
            out.println("<p>Test file already exists.</p>");
        }
    } catch (IOException e) {
        out.println("<p>Error creating test file: " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
