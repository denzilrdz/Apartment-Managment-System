<%--
    Document   : addAmtDB
    Created on : 14 Feb, 2020, 2:36:11 PM
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
                if (session.getAttribute("aname") == null) {
                    response.sendRedirect("AdminLogin.jsp? &ptr=asf");
                }
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                String regno = request.getParameter("ano");
                String amt = request.getParameter("amt");
                int i = s.executeUpdate("INSERT INTO `tenent_amt`(`regno`, `amt`, `status`, `o_id`) VALUES (" + regno + "," + amt + ",0,'" + 123 + "')");
                /*out.print(i + " rows added");*/
                session.setAttribute("output","a");
                response.sendRedirect("addAmt.jsp");
                s.close();
                con.close();
            } catch (Exception e) {
                /*out.print(e.getMessage());*/
                session.setAttribute("output","e");
                response.sendRedirect("addAmt.jsp");
            }
        %>
    </body>
</html>
