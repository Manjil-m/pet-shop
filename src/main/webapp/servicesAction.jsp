<%--<%@ page import="java.sql.*" %>--%>
<%--<%@ page import="java.text.SimpleDateFormat" %>--%>
<%--<%@ page import="com.example.onlineshopping.config.ConnectionProvider" %>--%>

<%--<%--%>
<%--  String name = request.getParameter("name");--%>
<%--  String email = request.getParameter("email");--%>
<%--  String reservationDate = request.getParameter("reservationDate");--%>
<%--  String reservationTime = request.getParameter("reservationTime");--%>
<%--  String serviceType = request.getParameter("serviceType");--%>

<%--  try {--%>
<%--    Connection con = ConnectionProvider.getCon();--%>

<%--    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");--%>
<%--    java.util.Date utilDate = sdf.parse(reservationDate);--%>
<%--    java.sql.Date sqlReservationDate = new java.sql.Date(utilDate.getTime());--%>

<%--    java.sql.Time sqlReservationTime = java.sql.Time.valueOf(reservationTime);--%>

<%--    PreparedStatement ps = con.prepareStatement("INSERT INTO booking (name, email, reservationDate, reservationTime, serviceType) VALUES (?, ?, ?, ?, ?)");--%>
<%--    ps.setString(1, name);--%>
<%--    ps.setString(2, email);--%>
<%--    ps.setDate(3, sqlReservationDate);--%>
<%--    ps.setTime(4, sqlReservationTime);--%>
<%--    ps.setString(5, serviceType);--%>
<%--    ps.executeUpdate();--%>
<%--    response.sendRedirect("services.jsp?msg=valid");--%>
<%--  } catch(Exception e) {--%>
<%--    // Log the exception or handle it appropriately--%>
<%--    e.printStackTrace(); // For development purposes--%>
<%--    response.sendRedirect("services.jsp?msg=invalid");--%>
<%--  }--%>
<%--%>--%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, com.example.onlineshopping.config.ConnectionProvider" %>

<%
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String reservationDate = request.getParameter("reservationDate");
  String reservationTime = request.getParameter("reservationTime");
  String serviceType = request.getParameter("serviceType");

  try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("INSERT INTO booking (name, email, reservationDate, reservationTime, serviceType) VALUES (?, ?, ?, ?, ?)");
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setDate(3, Date.valueOf(reservationDate));
    ps.setTime(4, Time.valueOf(reservationTime));
    ps.setString(5, serviceType);
    ps.executeUpdate();
    response.sendRedirect("bookingForm.jsp?msg=valid");
  } catch(Exception e) {
    System.out.println(e);
    response.sendRedirect("bookingForm.jsp?msg=invalid");
  }
%>
