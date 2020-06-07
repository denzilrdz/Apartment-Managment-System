<%-- 
    Document   : updateTech
    Created on : 17 Feb, 2020, 7:35:54 PM
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
            try{
                if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement();
                String email=session.getAttribute("tname").toString();
                String sno=request.getParameter("sno");
                String tno=request.getParameter("tno");
                int q=s.executeUpdate("UPDATE `assign` SET `status`=1 WHERE `service_number`='"+sno+"'");
                int w=s.executeUpdate("UPDATE `request_service` SET `fstatus`=1 WHERE slno='"+sno+"'");
                int e=s.executeUpdate("UPDATE `technician` SET `status`=0 WHERE slno='"+tno+"'");
                if(q==1 && w==1 && e==1)
                    out.print("Service update successful");
                else
                    out.print("Error occured while updation");
                s.close();
                con.close();
            }
            catch(Exception e)
            {
                out.print(e.getMessage());
            }
        %>
    </body>
</html>
