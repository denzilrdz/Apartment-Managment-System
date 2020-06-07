<%--
    Document   : UpdateHallDB
    Created on : 3 Mar, 2020, 10:12:56 PM
    Author     : SALMAN
--%>

<%@page import="java.sql.*"%>
<%@page import="DBConnect.DBCon"%>
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
                String amt = request.getParameter("amt");
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                int i = s.executeUpdate("UPDATE `amenities_prices` SET `price`='" + amt + "' WHERE `amenity_name`='hall'");
                if (i == 1) {
                    response.sendRedirect("UpdateHall.jsp? &ptr=add");
                } else {
                    response.sendRedirect("UpdateHall.jsp? &ptr=error");
                }
            } catch (Exception e) {
                response.sendRedirect("UpdateHall.jsp? &ptr=error");
                out.print(e.getMessage());
            }
        %>
    </body>
</html>
