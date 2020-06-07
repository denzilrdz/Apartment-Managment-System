<%-- 
    Document   : BookServiceDB
    Created on : 17 Feb, 2020, 4:05:51 PM
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
            if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }
            try{
                Class.forName(DBCon.DriverURL);
            Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement();
                int i=s.executeUpdate("INSERT INTO `request_service`(`email`, `service`, `status`, `fstatus`) VALUES ('"+session.getAttribute("tname")+"','"+request.getParameter("serve")+"',0,0)");
                if(i==1)
                { 
                    out.print("Service requested");                 
                
                s.close();
                con.close();
            }
            catch(Exception e
            {
                out.print(e.getMessage());
            }
        %></div>
        <%@include file="Footer.jsp" %
    </body>
</html>
