<%--
    Document   : ViewAppointment
    Created on : 20 Feb, 2020, 12:51:32 AM
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
                String type = "";
        %>
         <div class="col-sm-8 col-md-6 mt-2 "> 
                <table class="table table-striped text-white" style="text-align:center;">
          <thead class="bg-dark text-white">
                     <tr style="text-align: center;">
                        <th scope="col">Email</th>
                        <th scope="col">Apartment Type</th>
                        <th scope="col">Date Time</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs = s.executeQuery("SELECT `email`, `apart_type`, `rdate` FROM `guest_apart` WHERE `status`=0");
                        while (rs.next()) {
                            if (rs.getString(2).equals("bhk2")) {
                                type = "2 BHK";
                            } else if (rs.getString(2).equals("bhk3")) {
                                type = "3 BHK";
                            } else if (rs.getString(2).equals("bhk4")) {
                                type = "4 BHK";
                            }
                    
                            out.println("<tr>");
                            out.println("<td>" + rs.getString(1) + "</td>");
                            out.println("<td>" + type + "</td>");
                            out.println("<td>" + rs.getString(3) + "</td>");
                            out.print("<td>");
                    %>
                <a href="SendApointment.jsp? &mail=<%=rs.getString(1)%> &typ=<%=rs.getString(2)%> &ptr=qwe">View</a>
                <%
                            out.print("</td></tr></tbody></div>");
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
