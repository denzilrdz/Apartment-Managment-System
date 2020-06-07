<%--
    Document   : DeleteTenentDB
    Created on : 14 Feb, 2020, 11:18:07 PM
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
                String ano = "";
                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("SELECT `apart_no` FROM `tenent_email` WHERE `email`='" + request.getParameter("email") + "'");
                while (rs.next()) {
                    ano = rs.getString(1);
                }
                int i = s.executeUpdate("DELETE FROM `tenent_email` WHERE email='" + request.getParameter("email") + "'");
                int a = s.executeUpdate("DELETE FROM `tenent_login` WHERE username='" + request.getParameter("email") + "'");
                int q = s.executeUpdate("UPDATE `apartment` SET `status`=0 WHERE `apart_no`='" + ano + "'");
                if (i == 1 && a == 1) {
                    /*out.print("Tenent Deleted");*/
                    session.setAttribute("output", "d");
                    response.sendRedirect("DeleteTenent.jsp");
                } else {
                    /*out.print("Some error occured while deleting tenent");*/
                    session.setAttribute("output", "e");
                    response.sendRedirect("DeleteTenent.jsp");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                /*out.print(e.getMessage());*/
                session.setAttribute("output", "e");
                    response.sendRedirect("DeleteTenent.jsp");
            }
        %>
    </body>
</html>
