<%--
    Document   : AddLogEntry
    Created on : 18 Feb, 2020, 6:03:54 PM
    Author     : Denzil Rodrigues
--%>

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
            <%                try {
                    if (session.getAttribute("wname") == null) {
                        response.sendRedirect("WatchmanLogin.jsp");
                    }
                } catch (Exception e) {
                    out.print(e.getMessage());
                }
            %>
            <div class="col-sm-9 col-md-5 ">
            <div class="jumbotron col-md-7 col-sm-9 mt-3 shadow-lg" style="background-color:#111;">
            <h3 class="display-5" style="text-align: center;color:white;">Log Entry</h3>
            <form action="AddLogDB.jsp" method="POST">
            <label>Name</label>
            <input type="text" name="na" class="form-control" value="" required /><br>
            <button class="btn btn-danger form-control" type="submit" value="Submit" >Submit</button>
            <h5 style="color:white">
                        <%
                        if(session.getAttribute("output")!=null){
                            if(session.getAttribute("output").equals("e"))
                                out.print("There was a error try again");
                            else if(session.getAttribute("output").equals("a"))
                                out.print("Log updated");
                            session.setAttribute("output", null);
                        }
                        %>
                    </h5>
            </form>
            <%@include file="Footer.jsp" %>
            </body>
            </html>
