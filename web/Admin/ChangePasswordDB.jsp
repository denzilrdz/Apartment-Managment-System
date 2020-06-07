<%--
    Document   : ChangePasswordDB
    Created on : 14 Feb, 2020, 10:14:56 PM
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
                String pass = "";
                String old = request.getParameter("old");
                String new1 = request.getParameter("new1");
                ResultSet rs = s.executeQuery("SELECT `pass` FROM `admin_login` WHERE uname='" + session.getAttribute("aname") + "'");
                while (rs.next()) {
                    pass = rs.getString(1);
                }
                if (pass.equals(old)) {
                    int i = s.executeUpdate("UPDATE `admin_login` SET `pass`='" + new1 + "' WHERE uname='" + session.getAttribute("aname") + "'");
                    /*out.print("Password Changed");*/
                    session.setAttribute("output", "s");
                    response.sendRedirect("ChangePassword.jsp");
                } else {
                    /*out.println("Password missmatch");*/
                    session.setAttribute("output", "m");
                    response.sendRedirect("ChangePassword.jsp");
                }
                rs.close();
                s.close();
                con.close();
            } catch (Exception e) {
                /*out.print(e.getMessage());*/
                session.setAttribute("output", "e");
                    response.sendRedirect("ChangePassword.jsp");
            }
        %>
    </body>
</html>
