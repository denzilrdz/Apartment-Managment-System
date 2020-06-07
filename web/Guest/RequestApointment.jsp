<%-- 
    Document   : RequestApointment
    Created on : 20 Feb, 2020, 12:29:24 AM
    Author     : Denzil Rodrigues
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <style>
        .dropdown:hover>.dropdown-menu
    {
        display:block;
    }
    .dropdown-item:hover
    {
        background-color:blue;
    }
    .navbar
    {
        background-color:rgb(7, 6, 6);

    }


    .navbar-brand
    {
        font-size: 28px;
    }
    .dropdown:hover>.dropdown-menu
    {
        display:block;
    }
    .dropdown-item:hover
    {
        background-color: brown;
    }

    
    /* Style the main content */
    .main {
        margin-left: 160px; /* Same as the width of the sidenav */
        padding: 0px 10px;
    }


     body{
                background-color:rgb(54, 54, 54);
            }
            label{
                color:white;
            }
            </style>
    </head>
    <body>
        <%
            if(session.getAttribute("gname")==null)
            {
                response.sendRedirect("GuestLogIn.jsp");
            }
        %>
          <nav class="navbar">
     <a class="navbar-brand col-sm-4 col-md-3 col-lg-2 mr-2" href="../index.html">Maurishka Park </a>
    </nav>
     <div class="container-fluid">
            <div class="row justify-content-center">
        <div class="col-sm-9 col-md-5 ">
       
            <div class="jumbotron col-md-9 col-sm-9 mt-3 shadow-lg" style="background-color:#111;">
                <h3 class="display-5" style="text-align: center;color:white;">Request Appointment</h3>
               <form action="RequestApointmentDB.jsp">
                    <label> Select apartment type</label><select class="form-control" name="typ">
                     <option value="bhk2">2 BHK</option>
                <option value="bhk3">3 BHK</option>
                <option value="bhk4">4 BHK</option>
                 </select><br>
                    <button class="btn btn-danger form-control" type="submit" value="Request" >Request</button>
                    <h5 style="color: white">
                    <%
                    if(session.getAttribute("output")!=null){
                        if(session.getAttribute("output").equals("r"))
                            out.print("Appointment requested");
                        else if(session.getAttribute("output").equals("e"))
                            out.print("There was a error, try again");
                        session.setAttribute("output", null);
                    }
                    %>
                </h5>
            </div>
        </div>
        </div>
        </div>
        </div>
                </form>
                
                <%@include file="Footer.jsp" %>
    </body>
</html>
