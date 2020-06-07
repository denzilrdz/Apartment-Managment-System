<%--
    Document   : addTechDB
    Created on : 17 Feb, 2020, 5:58:19 PM
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
                String iname = request.getParameter("iname");
                String cno = request.getParameter("cno");
                String serve = request.getParameter("serve");
                int a = s.executeUpdate("INSERT INTO `technician`( `name`, `type`, `contact`, `status`) VALUES ('" + iname + "','" + serve + "','" + cno + "',0)");
                if (a == 1) {
                    /*out.print("Technician added");*/
                    session.setAttribute("output","a");
                    response.sendRedirect("addTech.jsp");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                /*out.print(e.getMessage());*/
                session.setAttribute("output","e");
                    response.sendRedirect("addTech.jsp");
                }
            
        %>
    </body>
</html>
