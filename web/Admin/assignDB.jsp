<%--
    Document   : assignDB
    Created on : 17 Feb, 2020, 6:19:59 PM
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
                String email = request.getParameter("email");
                String sno = request.getParameter("sno");
                String slno = request.getParameter("slno");
                String apart_no = request.getParameter("apart_no");
                /*out.print(email+"<br>"+sno+"<br>"+"<br>"+slno+"<br>"+apart_no);*/
                int q = s.executeUpdate("INSERT INTO `assign`(`service_number`, `email`, `apart_no`, `t_number`, `status`) VALUES ('" + sno + "','" + email + "','" + apart_no + "','" + slno + "',0)");
                int w = s.executeUpdate("UPDATE `request_service` SET `status`=1 WHERE slno='" + sno + "'");
                int e = s.executeUpdate("UPDATE `technician` SET `status`=1 WHERE slno='" + slno + "'");
                if (q == 1 && w == 1 && e == 1) {
                    out.print("Technician assigned");
                } else {
                    out.print("Error occured while assiging technician");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
    </body>
</html>
