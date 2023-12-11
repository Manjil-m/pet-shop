<%@page import="com.example.onlineshopping.config.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String email=session.getAttribute("email").toString();
    String securityQuestion=request.getParameter("securityQuestion");
    String newAnswer=request.getParameter("newAnswer");
    String password=request.getParameter("password");
    int check=0;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select *from users where email='" + email + "' and password='" + password + "' ");
        while (rs.next()) {
            check = 1;
            st.executeUpdate("update users set securityQuestioin='" + securityQuestion + "',answer='" + newAnswer + "' where email='" + email + "'");
            response.sendRedirect("changeSecurity.jsp?msg=done");
        }
        if(check==0)
            response.sendRedirect("changeSecurity.jsp?msg=wrong");
    }
    catch (Exception e)
    {

    }
%>