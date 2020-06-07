<%-- 
    Document   : ChangePasswordDB
    Created on : 14 Feb, 2020, 10:14:56 PM
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
                String pass="";
                String old=request.getParameter("old");
                String new1=request.getParameter("new1");
                ResultSet rs=s.executeQuery("SELECT `password` FROM `tenent_login` WHERE username='"+session.getAttribute("tname")+"'");
                while(rs.next())
                {
                    pass=rs.getString(1);
                }
                if(pass.equals(old))
                    {
                        int i=s.executeUpdate("UPDATE `tenent_login` SET `password`='"+new1+"' WHERE username='"+session.getAttribute("tname")+"'");
                        /*out.print("Password Changed");*/
                        session.setAttribute("output", "s");
                    response.sendRedirect("ChangePasswordT.jsp");
                    }else{
                    /*out.println("Password missmatch");*/
                    session.setAttribute("output", "m");
                    response.sendRedirect("ChangePasswordT.jsp");
                }
                rs.close();
                s.close();
                con.close();
            }
            catch(Exception e)
            {
                /*out.print(e.getMessage());*/
                session.setAttribute("output", "e");
                    response.sendRedirect("ChangePasswordT.jsp");
            }
        %>
    </body>
</html>
