<%--
    Document   : viewTech
    Created on : 17 Feb, 2020, 7:57:58 PM
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
        <%            try {
                if (session.getAttribute("aname") == null) {
                    response.sendRedirect("AdminLogin.jsp? &ptr=asf");
                }
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
        %>
        <div class="col-sm-9 col-md-5 mt-2 ml-2 ">
            <table class="table table-striped text-white" style="text-align:center;">
                <thead class="bg-dark text-white">
                    <tr style="text-align: center;">
                        <th scope="col">RegNo</th>
                        <th scope="col">Name</th>
                        <th scope="col">Type</th>
                        <th scope="col">Contact</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                            ResultSet rs = s.executeQuery("SELECT `slno`, `name`, `type`, `contact`, `status` FROM `technician` ");
                            while (rs.next()) {
                                String avl = "";
                                if (rs.getBoolean(5)) {
                                    avl = "Not available";
                                } else {
                                    avl = "Available";
                                }
                                out.print("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getInt(4) + "</td><td>" + avl + "</td></tr></tbody></div>");
                            }
                            out.print("</table>");
                            s.close();
                            con.close();
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }
                    %>
                    <%@include file="Footer.jsp" %>
                    </body>
                    </html>
