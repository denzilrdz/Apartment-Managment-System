<%-- 
    Document   : complaint
    Created on : 18 Feb, 2020, 11:08:44 PM
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
            }
            catch(Exception e)
            {
                out.print(e.getMessage());
            }
        %>
        <div class="col-sm-9 col-md-5 ">
            <div class="jumbotron col-md-9 mt-3 ml-2 shadow-lg" style="background-color:#111;">
                <h3 class="display-5" style="text-align: center;color:white;">Complaint Registration</h3>
                <form action="complaintDB.jsp" >
         <label>Subject</label>
            <input type="text" name="sub" class="form-control" required />
            <label>Complaint</label>
            <textarea class="form-control" name="con" rows="4" cols="20" id="sub" required="true" start="0">
            </textarea><br>
            <button class="btn btn-danger form-control" type="submit" value="Submit" >Register Complaint</button>
        </form>
                <h5 style="color: white">
                    <%
                        if(session.getAttribute("output")!=null){
                            if(session.getAttribute("output").equals("e"))
                                out.print("Threr was a error, try again");
                            else if(session.getAttribute("output").equals("n"))
                                out.print("Complaint description is required");
                            else if(session.getAttribute("output").equals("r"))
                                out.print("Complaint registered");
                            session.setAttribute("output", null);
                        }
                    %>
                </h5>
         <%@include file="Footer.jsp" %>
    </body>
</html>
