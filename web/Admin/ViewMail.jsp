<%--
    Document   : ViewMail
    Created on : 18 Feb, 2020, 11:34:42 PM
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
</head>
<body>
    <%        try {
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
                    <th scope="col">Complaint Number</th>
                    <th scope="col">Apartment Number</th>
                    <th scope="col">Email</th>
                    <th scope="col">Subject</th>
                    <th scope="col">Complaint</th>
                </tr>
            </thead>
            <tbody>
                <%
                        ResultSet rs = s.executeQuery("SELECT `apart_no`, `email`, `subject`, `comp` FROM `complaint` WHERE regno='" + request.getParameter("regno") + "'");
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<tr>");
                            out.println("<td>" + request.getParameter("regno") + "</td>");
                            out.println("<td>" + rs.getString(1) + "</td>");
                            out.println("<td>" + rs.getString(2) + "</td>");
                            out.println("<td>" + rs.getString(3) + "</td>");
                            out.println("<td>" + rs.getString(4) + "</td>");
                            out.print("</td></tr>");
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
