<%--
    Document   : Mail
    Created on : 8 Feb, 2020, 12:48:33 PM
    Author     : Denzil Rodrigues
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .notavailable
            {
                height: 70px;
            }
            label{
                color:white;
            }
        </style>
    </head>
    <%@include file="header1.jsp" %>
    <body>
         <div class="container-fluid">
            <div class="row justify-content-center">
        <div class="col-sm-9 col-md-5 ">
            <div class="jumbotron col-md-9 col-sm-9 mt-3 ml-2 shadow-lg" style="background-color:#111;">
                <form action="RequestMail.jsp">
                    <label>Email</label>
                    <input type="mail" name="email" value=""  placeholder="Email id" class="form-control" required/><br>
                    <button class="btn btn-danger form-control" type="submit" >Submit</button>
                </form>
                <%
                    String ptr = "";
                    ptr = request.getParameter("ptr");
                    if (ptr.equals("sent")) {
                %>
                <h3 style="color: white">Mail Sent</h3>
                <%
                } else if (ptr.equals("not")) {
                %>
                <h3 style="color: white">Resident not registered</h3>
                <%
                } else if (ptr.equals("error")) {
                %>
                <h3 style="color: white">Internet not connected</h3>
                <%
                    }
                    if(ptr!=null)
                        ptr = "";
                %>
                <%@include file="Footer.jsp" %>
                </body>
                </html>
