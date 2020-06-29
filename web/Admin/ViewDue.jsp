<%--
    Document   : ViewDue
    Created on : 15 Feb, 2020, 11:02:47 AM
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
                int regno = 0;
                int amt = 0;
                String apart_no = "";
        %>
        <div class="col-sm-9 col-md-5 mt-2 ml-2 ">
            <table class="table table-striped text-white" style="text-align:center;">
                <thead class="bg-dark text-white">
                    <tr style="text-align: center;">
                        <th scope="col">RegNo</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Apartment Number</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs = s.executeQuery("SELECT e.regno, a.amt, e.apart_no FROM tenent_amt a, tenent_email e WHERE status=0 and a.regno=e.regno");
                        while (rs.next()) {
                            regno = rs.getInt(1);
                            amt = rs.getInt(2);
                            apart_no = rs.getString(3);
                    %>
                    <tr>
                        <td><%=regno%></td>
                        <td><%=amt%></td>
                        <td><%=apart_no%></td>
                    </tr>
                </tbody>
            
        
        <%
                }
                out.print("</table>");
                s.close();
                con.close();
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
        </div>
        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
