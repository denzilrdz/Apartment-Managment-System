<%--
    Document   : BookHall
    Created on : 15 Feb, 2020, 10:58:59 AM
    Author     : Denzil Rodrigues
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            var date = new Date();
            var cDate = date.getDate();
            var cMonth = date.getMonth();
            var cYear = date.getFullYear();
            $(document).ready(function () {
                $("#cal").datepicker({
                    minDate: new Date(cYear, cMonth, cDate + 1),
                    dateFormat: 'yy-mm-dd'
                });
            });
        </script>

        <title>JSP Page</title>
        <%@include file="Header.jsp" %>
        <style>
            label{
                color:white;
            }
            h3{
                color:white;
            }
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("tname") == null) {
                response.sendRedirect("TenentLogin.jsp");
            }
        %>
        <div class="col-sm-9 col-md-5 ">
            <div class="jumbotron col-md-7 col-sm-9 mt-3 ml-2 shadow-lg" style="background-color:#111;">
                <h3 class="display-5" style="text-align: center;">Book Hall</h3>
                <form action="BookHallDB.jsp" method="POST">
                    <label>Select Date</label>
                    <input type="text" name="dat"  id="cal" class="form-control" value="" /><br>
                    <button class="btn btn-danger form-control" type="submit" value="Book" >Confirm Date</button>

                </form>
                <%@include file="footer1.jsp" %>
                </body>
                </html>
