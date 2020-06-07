<%--
    Document   : LogExitDB
    Created on : 18 Feb, 2020, 6:30:02 PM
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
                int q = s.executeUpdate("UPDATE `entry_log` SET `status`=1 WHERE regno=" + request.getParameter("regno"));
                int w = s.executeUpdate("INSERT INTO `exit_log`(`regno`) VALUES (" + request.getParameter("regno") + ")");
                if (q == 1 && w == 1) {
                    /*out.print("Visitors Log Updated");*/
                    session.setAttribute("output", "a");
                response.sendRedirect("AddLogExit.jsp");
                } else {
                    /*out.print("Error while updating");*/
                    session.setAttribute("output", "e");
                response.sendRedirect("AddLogExit.jsp");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                /*out.print(e.getMessage());*/
                 session.setAttribute("output", "e");
                response.sendRedirect("AddLogExit.jsp");
            }
        %>
    </body>
</html>
