<%-- 
    Document   : GuestLoginValidate
    Created on : 19 Feb, 2020, 11:20:18 PM
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
            ResultSet rs=s.executeQuery("SELECT password FROM guest_login where username='"+uname+"'");
            while(rs.next())
            {
                flag=1;
                if(pass.equals(rs.getString(1)))
                {
                    session.setAttribute("gname",uname);
                    response.sendRedirect("GuestIndex.jsp");
                }
                else{
                    /*out.println("Incorrect Password");*/
                    session.setAttribute("output", "p");
                    response.sendRedirect("GuestLogIn.jsp");
                }
            }
            if(flag==0){
                /*out.println("Invalid Username");*/
                    session.setAttribute("output", "u");
                    response.sendRedirect("GuestLogIn.jsp");
            }
            s.close();
            con.close();
        }
        catch(Exception e)
        {
            /*out.println(e.getMessage());*/
            session.setAttribute("output", "e");
                    response.sendRedirect("GuestLogIn.jsp");
        }
        %>
    </body>
</html>

