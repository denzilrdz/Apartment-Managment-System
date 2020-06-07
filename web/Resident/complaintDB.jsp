<%-- 
    Document   : complaintDB
    Created on : 18 Feb, 2020, 11:13:43 PM
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
            try{
            if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }
            if(request.getParameter("con").length()==12){
                session.setAttribute("output","n");
                response.sendRedirect("complaint.jsp");
            } else {
            Class.forName(DBCon.DriverURL);
            Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
            Statement s=con.createStatement();
            String apno="";
            ResultSet rs=s.executeQuery("SELECT apart_no from tenent_email WHERE email='"+session.getAttribute("tname")+"'");
            while(rs.next())
            {
                apno=rs.getString(1);
            }
            int q=s.executeUpdate("INSERT INTO `complaint`(`apart_no`, `email`, `subject`, `comp`) VALUES ('"+apno+"','"+session.getAttribute("tname")+"','"+request.getParameter("sub")+"','"+request.getParameter("con")+"')");
            if(q==1){
                /*out.print("Complaint registered");*/
                session.setAttribute("output","r");
               
                response.sendRedirect("complaint.jsp");
            }
            else{
                /*out.print("Error while registring complaint");*/
                session.setAttribute("output","e");
                response.sendRedirect("complaint.jsp");
            }
            s.close();
            con.close();
            }
            }
            catch(Exception e)
            {
                /*out.print(e.getMessage());*/
                session.setAttribute("output","e");
                response.sendRedirect("complaint.jsp");
            }
        %>
         <%@include file="Footer.jsp" %>
    </body>
    
</html>
