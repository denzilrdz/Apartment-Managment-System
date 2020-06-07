<%--
    Document   : ViewServices
    Created on : 17 Feb, 2020, 4:46:28 PM
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
            try {
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
                        <th scope="col">Email</th>
                        <th scope="col">Service</th>
                        <th scope="col">Date Time</th>
                        <th scope="col">Service Number</th>
                        <th scope="col">Apartment Number</th>
                        <th scope="col">Assign</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs = s.executeQuery("SELECT r.email, r.service, r.status, r.date, r.slno, t.apart_no FROM request_service r,tenent_email t WHERE r.email=t.email AND r.status=0");
                        while (rs.next()) {
                            out.print("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getInt(5) + "</td><td>" + rs.getString(6) + "</td>");
                            out.print("<td>");
                    %>
                <a href="ViewServicesDB.jsp? &email=<%=rs.getString(1)%> &serve=<%=rs.getString(2)%> &slno=<%=rs.getInt(5)%> &apart_no=<%=rs.getString(6)%>">View</a>
                <%
                            out.print("</td></tr>");
                        }
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
