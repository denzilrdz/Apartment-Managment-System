<%--
    Document   : ViewServicesDB
    Created on : 17 Feb, 2020, 5:05:34 PM
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
            try {
                String email = request.getParameter("email");
                String serve = request.getParameter("serve");
                String sno = request.getParameter("slno");
                String apart_no = request.getParameter("apart_no");
                /*out.print(email+"<br>"+serve+"<br>"+slno+"<br>"+apart_no);*/
                if (session.getAttribute("aname") == null) {
                    response.sendRedirect("AdminLogin.jsp");
                }
                boolean stat = false;
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("SELECT `slno`, `name`, `contact` FROM `technician` WHERE status=0 and type='" + serve + "'");
                while (rs.next()) {
                    stat = true;
        %>
        <a href="assignDB.jsp? &slno=<%=rs.getInt(1)%> &apart_no=<%=apart_no%> &sno=<%=sno%> &email=<%=email%>"><%=rs.getString(2)%></a>
        <%
                }
                if (stat == false) {
                    out.print("Technician not available");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
    </body>
</html>
