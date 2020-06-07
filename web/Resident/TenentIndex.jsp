<%-- 
    Document   : TenentIndex
    Created on : 6 Feb, 2020, 10:58:09 PM
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
                background-color:black;

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
           
            .sidebar {
                                
                height:500px;
                width: 300px;
                z-index: 1;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                padding-top: 6px;
                
            }

            /* Style sidebar links */
            .sidebar a {
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 20px;
                font-family:'Ubuntu',sans-serif;
                color: #818181;
                display: block;
            }

            /* Style links on mouse-over */
            .sidebar a:hover {
                color: #f1f1f1;
            }

            /* Style the main content */
            .main {
                margin-left: 160px; /* Same as the width of the sidenav */
                padding: 0px 10px;
            }

            /* Add media queries for small screens (when the height of the screen is less than 450px, add a smaller padding and font-size) */
            @media screen and (max-height: 450px) {
                .sidebar {padding-top: 50px;}
                .sidebar a {font-size: 18px;}
            }
              body{
                background-color:rgb(54, 54, 54);
            }
            
</style>
    </head>
    <body>
        <%
            if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }else
            {
           
         %>
         
    <nav class="navbar">
        <a class="navbar-brand col-sm-4 col-md-3 col-lg-2 mr-2" href="../index.html">Maurishka Park </a>
        <%@include file="apartment_no.jsp" %>
        <a class="btn text-white" href="Logout.jsp"><i class="fas fa-sign-out-alt" style="font-size:20px;"></i> Logout </a>
    </nav>
    
        <div class="sidebar" id="dashboard">
       
            <a href="ViewAmt.jsp"><i class="fa fa-fw fa-user"></i> Pay/View Maintenance Bill</a>
            <a href="BookHall.jsp? &ptr='false"><i class="fa fa-credit-card"></i> Book Hall</a>
            <a href="ViewBooking.jsp"><i class="fa fa-window-close"></i> Bookings</a>
            <a href="GymMember.jsp"><i class="fa fa-server"></i> Buy/View Gym Membership</a>
            <a href="BookService.jsp"><i class="fa fa-briefcase"></i> Request Service</a>
            <a href="complaint.jsp"><i class="fa fa-trash"></i> Raise Complaint</a>
            <a href="ViewInvoice.jsp"><i class="fa fa-eye"></i> View Invoice</a>
             <a href="ChangePasswordT.jsp"><i class="fa fa-key"></i> Change Password</a>
           

        </div> 
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/all.min.js"></script>
        <% } %>
    </body>
</html>
