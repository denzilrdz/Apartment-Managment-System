<%--
    Document   : ViewSubject
    Created on : 18 Feb, 2020, 11:26:43 PM
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
        <div class="col-sm-8 col-md-6 mt-2 ">
            <table class="table table-striped text-white" style="text-align:center;">
                <thead class="bg-dark text-white">
                    <tr style="text-align: center;">
                        <th scope="col">Complaint Number</th>
                        <th scope="col">Apartment Number</th>
                        <th scope="col">Email</th>
                        <th scope="col">Subject</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs = s.executeQuery("SELECT `regno`, `apart_no`, `email`, `subject` FROM `complaint` ");
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getInt(1) + "</td>");
                            out.print("<td>" + rs.getString(2) + "</td>");
                            out.print("<td>" + rs.getString(3) + "</td>");
                            out.print("<td>" + rs.getString(4) + "</td>");
                            out.print("</tr>");
                            out.print("<td>");
                    %>
                <a href="ViewMail.jsp? &regno=<%=rs.getInt(1)%>">View Complaint</a>
                <%
                            out.print("</td>");
                            out.print("</tr>");
                            out.print("</tbody>");
                            out.print("</div>");

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
