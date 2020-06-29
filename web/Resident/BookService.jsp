<%-- 
    Document   : BookService
    Created on : 17 Feb, 2020, 4:03:54 PM
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
        <style>
        h4{
            color:white;
        }
        label{
            color:white;
        }
        </style>
    </head>
    <body>
        <%
             try{
            if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }
            boolean fstatus=false;
            int slno=0;
           
                Class.forName(DBCon.DriverURL);
            Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement();
                ResultSet rs=s.executeQuery("SELECT slno FROM `request_service` WHERE email='"+session.getAttribute("tname")+"' and fstatus=0");
                while(rs.next())
                {
                    fstatus=true;
                    slno=rs.getInt(1);
                }
            if(fstatus==false)
            {
        %>
        <div class="col-sm-9 col-md-5 ">
        <div class="jumbotron col-md-9 mt-3 ml-3 shadow-lg" style="background-color:#111;">
        <h3 class="display-5" style="text-align: center;color:white">Request Service</h3>
        
        <form action="BookServiceDB.jsp" method="POST">
            <label>Select type of service</label>
            
            <select name="serve" class="form-control" required>
                <option value="Plumbing">Plumbing</option>
                <option value="Electrician">Electrician</option>
                <option value="Pest">Pest Control</option>
            </select><br>
            <button class="btn btn-danger form-control" type="submit" value="Request" >Request Service</button>

            </form>
            
        
        <%
            }
        else
            { %>
                <h4 class="ml-3">Service requested for service ID <%=slno%></h4>
                <h4 class="ml-3"> <a href=techDetail.jsp>  Click here for technician detail</a></h4> <%
            }
                rs.close();
                s.close();
                con.close();
            }
            catch(Exception e)
            {
                out.print(e.getMessage());
            }
        %>
        <%@include file="Footer.jsp" %>
    </body>
</html>
