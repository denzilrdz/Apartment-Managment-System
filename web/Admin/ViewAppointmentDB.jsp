<%--
    Document   : ViewAppointmentDB
    Created on : 20 Feb, 2020, 1:37:38 AM
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
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
        %>
        <div class="col-sm-8 col-md-6 mt-2 ">
            <table class="table table-striped text-white" style="text-align:center;">
                <thead class="bg-dark text-white">
                    <tr style="text-align: center;">
                        <th scope="col">Sl No</th>
                        <th scope="col">Email</th>
                        <th scope="col">Apartment Type</th>
                        <th scope="col">Appointment Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                            ResultSet rs = s.executeQuery("SELECT `slno`, `email`, `type`, `adate` FROM `appointment` ");
                            while (rs.next()) {
                                String type = rs.getString(3);
                                String typ = "";
                                if (type.equals("bhk2")) {
                                    typ = "2 BHK";
                                } else if (type.equals("bhk3")) {
                                    typ = "3 BHK";
                                } else if (type.equals("bhk4")) {
                                    typ = "4 BHK";
                                }
                                out.print("<tr><td>" + rs.getInt(1) + "</td>");
                                out.print("<td>" + rs.getString(2) + "</td>");
                                out.print("<td>" + typ + "</td>");
                                out.print("<td>" + rs.getDate(4) + "</td></tr>");
                                out.print("</tbody></div>");
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
