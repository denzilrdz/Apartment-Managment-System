<%--
    Document   : deleteTechDB
    Created on : 17 Feb, 2020, 6:00:49 PM
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
            if (session.getAttribute("aname") == null) {
                response.sendRedirect("AdminLogin.jsp? &ptr=asf");
            }
            try {
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                int i = s.executeUpdate("DELETE FROM `technician` WHERE slno='" + request.getParameter("slno") + "'");
                if (i == 1) {
                    /*out.print("Technician deleted");*/
                    session.setAttribute("output", "d");
                    response.sendRedirect("deleteTech.jsp");
                
                } else {
                    /*out.print("Some error while deleting");*/
                    session.setAttribute("output", "e");
                    response.sendRedirect("deleteTech.jsp");
                
                }
                s.close();
                con.close();
            } catch (Exception e) {
                /*out.print(e.getMessage());*/
                session.setAttribute("output", "e");
                    response.sendRedirect("deleteTech.jsp");
                
            }
        %>
    </body>
</html>
