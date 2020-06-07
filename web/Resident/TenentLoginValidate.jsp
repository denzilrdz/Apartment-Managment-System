<%-- 
    Document   : TenentLoginValidate
    Created on : 6 Feb, 2020, 10:56:08 PM
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
                int flag=0;
            String uname=request.getParameter("uname");
            String pass=request.getParameter("pass");
            Class.forName(DBCon.DriverURL);
            Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
            Statement s=con.createStatement();
            ResultSet rs=s.executeQuery("SELECT password FROM TENENT_LOGIN where username='"+uname+"'");
            while(rs.next())
            {
                flag=1;
                if(pass.equals(rs.getString(1)))
                {
                    session.setAttribute("tname",uname);
                    response.sendRedirect("TenentIndex.jsp");
                }
                else{
                    /*out.println("Incorrect Password");*/
                    session.setAttribute("output", "p");
                    response.sendRedirect("TenentLogin.jsp");
                }
            }
            if(flag==0){
                session.setAttribute("output", "u");
            response.sendRedirect("TenentLogin.jsp");
                /*out.println("Invalid Username");*/
            }
            rs.close();
            s.close();
            con.close();
        }
        catch(Exception e)
        {
            /*out.println(e.getMessage());*/
            session.setAttribute("output", "e");
            response.sendRedirect("TenentLogin.jsp");
        }
        %>
    </body>
</html>
