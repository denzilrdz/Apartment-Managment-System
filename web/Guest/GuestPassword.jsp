<%--
    Document   : GuestPassword
    Created on : 19 Feb, 2020, 11:28:56 PM
    Author     : Denzil Rodrigues
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header1.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-sm-9 col-md-5 ">
                    <div class="jumbotron col-md-10 col-sm-9 mt-3 shadow-lg" style="background-color:#111;">
                        <form action="GuestPasswordDB.jsp">
                            <label style="color:white;">Email</label>

                            <input type="mail" name="mail" value="" placeholder="Email id" class="form-control" required /><br>
                            <button class="btn btn-danger form-control" type="submit" >Submit</button>
                        </form>
                        <%
                            String ptr = "";
                            ptr = request.getParameter("ptr");
                            if (ptr.equals("sent")) {
                        %>
                        <h3>Mail Sent</h3>
                        <%
                        } else if (ptr.equals("error")) {
                        %>
                        <h3>Internet not connected</h3>
                        <%
                        } else if (ptr.equals("exist")) {
                        %>
                        <h3>User exist</h3>
                        <%
                            }
                        %>
                        <%@include file="Footer.jsp" %>
                        </body>
                        </html>
