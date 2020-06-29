<%--
    Document   : SendApointment
    Created on : 20 Feb, 2020, 1:06:40 AM
    Author     : Denzil Rodrigues
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>JSP Page</title>
        <%@include file="Header.jsp" %>
        <style>
        label{
            color:white;
        }
        
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript">
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

    </head>
    <body>
        <div class="col-sm-9 col-md-5 lg-3">
            <div class="jumbotron col-md-9 mt-3 ml-2 shadow-lg" style="background-color:#111;">
                <h3 class="display-5 text-light" style="text-align: center;color:white;">Send Appointment</h3>
                        <%
                            if (session.getAttribute("aname") == null) {
                                response.sendRedirect("AdminLogin.jsp? &ptr=asf");
                            }
                            String ma = request.getParameter("mail");
                            String type = request.getParameter("typ");
                            session.setAttribute("type", type);
                        %>
                        <form action="SendApointmentMail.jsp" method="POST" >
                            <label>Select Date</label><input type="date" name="da"  id="cal" class="form-control" value="" /><br>
                            <input type="hidden" name="mail" class="form-control" value="<%=ma%>" />
                            <input type="hidden" name="typ" class="form-control" value="<%=type%>" />
                             <button type="submit" class="btn btn-danger form-control mt-3">Send Mail</button>
                        </form><br>
                        <a href="NotAvailable.jsp? &mail=<%=ma%> &typ=<%=type%>">Click here if apartment not available</a>
                        <%
                        if(session.getAttribute("output")!=null){
                            String ptr = session.getAttribute("output").toString();
                            if (ptr.equals("s")) {
                        %>
                        <h3 style="color:white">Mail Sent</h3>
                        <%
                        } else if (ptr.equals("e")) {
                        %>
                        <h3 style="color:white">There was a error try again</h3>
                        <%
                            }
                            session.setAttribute("output", null);
                        }
                        %>
                        <%@include file="Footer.jsp" %>
                        </body>
                        </html>
