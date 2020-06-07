<%--
    Document   : AdminLoginValidate
    Created on : 24 Jan, 2020, 9:54:55 AM
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
                int flag = 0;
                String uname = request.getParameter("uname");
                String pass = request.getParameter("pass");
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("SELECT pass FROM ADMIN_LOGIN where uname='" + uname + "'");
                while (rs.next()) {
                    flag = 1;
                    if (pass.equals(rs.getString(1))) {
                        session.setAttribute("aname", uname);
                        response.sendRedirect("AdminIndex.jsp");
                    } else {
                        session.setAttribute("output", "pass");
                        response.sendRedirect("AdminIndex.jsp");
                        /*out.println("Incorrect Password");*/
                    }
                }
                if (flag == 0) {
                    session.setAttribute("output", "name");
                    response.sendRedirect("AdminIndex.jsp");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                /*out.println(e.getMessage());*/
                session.setAttribute("output", "name");
                    response.sendRedirect("AdminIndex.jsp");
            }
        %>
    </body>
</html>
