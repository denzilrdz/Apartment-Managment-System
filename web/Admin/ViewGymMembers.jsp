<%--
    Document   : ViewGymMembers
    Created on : 16 Feb, 2020, 1:12:36 PM
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
        <%
            if (session.getAttribute("aname") == null) {
                response.sendRedirect("AdminLogin.jsp? &ptr=asf");
            }
            try {
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
        %>
        <div class="col-sm-9 col-md-5 mt-2 ml-2 ">
            <table class="table table-striped text-white" style="text-align:center;">
                <thead class="bg-dark text-white">
                    <tr style="text-align: center;">
                        <th scope="col">RegNo</th>
                        <th scope="col">Email</th>
                        <th scope="col">R Date</th>
                        <th scope="col">E Date</th>
                        <th scope="col">Order ID</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                            ResultSet rs = s.executeQuery("SELECT `regno`, `email`, `bdate`, `edate`, `o_id` FROM `gym_swimming` WHERE `status`=1");
                            while (rs.next()) {
                                out.print("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getDate(3) + "</td><td>" + rs.getDate(4) + "</td><td>" + rs.getString(5) + "</td></tr></tbody></div>");
                            }
                            out.print("</table>");
                            rs.close();
                            s.close();
                            con.close();
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }
                    %>
                    <%@include file="Footer.jsp" %>
                    </body>
                    </html>
