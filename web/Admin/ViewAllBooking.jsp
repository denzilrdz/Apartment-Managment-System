<%--
    Document   : ViewBooking
    Created on : 15 Feb, 2020, 12:42:22 PM
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
        <%@include file="Header.jsp" %>

    </head>
    <body>
        <%
            if (session.getAttribute("aname") == null) {
                response.sendRedirect("AdminLogin.jsp? &ptr=asf");
            }
            try {
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
        %>
        <div class="col-sm-8 col-md-6 mt-2 ">
            <table class="table table-striped text-white" style="text-align:center;">
                <thead class="bg-dark text-white">
                    <tr style="text-align: center;">
                        <th scope="col">Apartment Number</th>
                        <th scope="col">Date</th>
                        <th scope="col">Order ID</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                            ResultSet rs = s.executeQuery("SELECT `date`, `status`, `o_id`, `apart_no` FROM `hall_booking` WHERE `status`=1 order by date DESC");
                            while (rs.next()) {
                                if (rs.getBoolean(2)) {
                                    out.print("<tr><td>" + rs.getString(4) + "</td><td>" + rs.getDate(1) + "</td><td>" + rs.getString(3) + "</td></tr>");
                                }
                            }
                            rs.close();
                            s.close();
                            con.close();
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }
                    %>
                    <%@include file="Footer.jsp" %>
                    </body>
                    </html>
