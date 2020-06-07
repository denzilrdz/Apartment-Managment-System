<%--
    Document   : RequestApointmentDB
    Created on : 20 Feb, 2020, 12:30:24 AM
    Author     : Denzil Rodrigues
--%>

<%@page import="DBConnect.DBCon"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                if (session.getAttribute("gname") == null) {
                    response.sendRedirect("GuestLogIn.jsp");
                }
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                int i = s.executeUpdate("INSERT INTO `guest_apart`(`email`, `apart_type`, `status`) VALUES ('" + session.getAttribute("gname") + "','" + request.getParameter("typ") + "',0)");
                if (i == 1) {
                    /*out.print("Appointment requested");*/
                    session.setAttribute("output", "r");
                    response.sendRedirect("RequestApointment.jsp");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                /*out.print(e.getMessage());*/
                session.setAttribute("output", "e");
                    response.sendRedirect("RequestApointment.jsp");
            }
        %>
    </body>
</html>
