<%--
    Document   : AddLogDB
    Created on : 18 Feb, 2020, 6:13:39 PM
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
                if (session.getAttribute("wname") == null) {
                    response.sendRedirect("WatchmanLogin.jsp");
                }
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                int q = s.executeUpdate("INSERT INTO `entry_log`(`name`, `status`) VALUES ('" + request.getParameter("na") + "',0)");
                if (q == 1) {
                    /*out.print("Visitor added");*/
                    session.setAttribute("output", "a");
                    response.sendRedirect("AddLogEntry.jsp");
                } else {
                    /*out.print("Error while adding visitor");*/
                    session.setAttribute("output", "e");
                    response.sendRedirect("AddLogEntry.jsp");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                /*out.print(e.getMessage());*/
                session.setAttribute("output", "e");
                response.sendRedirect("AddLogEntry.jsp");
            }
        %>
    </body>
</html>
