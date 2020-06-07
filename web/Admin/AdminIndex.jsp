<%--
    Document   : AdminIndex
    Created on : 24 Jan, 2020, 9:59:15 AM
    Author     : Denzil Rodrigues
--%>

<%@page import="java.sql.*"%>
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
            .sidebar {
                height:100%;
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
                .sidebar {padding-top: 15px;}
                .sidebar a {font-size: 18px;}
            }

           
            .navbar
            {
                background-color:black;

            }

            .navbar-brand
            {
                font-size: 28px;
            }
           
          
            body{
                background-color:rgb(54, 54, 54);
            }
            

        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("aname") == null) {
                response.sendRedirect("AdminLogin.jsp");
            } else {
        %> 
    <nav class="navbar">
        <a class="navbar-brand col-sm-4 col-md-3 col-lg-2 mr-2" href="../index.html">Maurishka Park </a>
        <a class="btn text-white" href="Logout.jsp"><i class="fas fa-sign-out-alt" style="font-size:20px;"></i> Logout </a>
    </nav>
        
        <div class="sidebar">

            <a href="TenentRegister.jsp"><i class="fa fa-fw fa-user"></i>Register new Tenant</a>
            <a href="DeleteTenent.jsp? &ptr='false'"><i class="fas fa-trash"></i> Delete Tenant</a>
            <a href="addAmt.jsp"><i class="fa fa-credit-card"></i>Add Maintenance amount</a>
            <a href="ViewPaid.jsp"><i class="fa fa-eye"></i> View Amount Paid</a>
            <a href="ViewDue.jsp"><i class="fa fa-window-close"></i> View Due Amount</a>
            <a href="ViewAllBooking.jsp"><i class="fa fa-building"></i>View Hall Booking</a>
            <a href="ViewGymMembers.jsp"><i class="fas fa-dumbbell"></i>&nbsp<i class="fas fa-swimming-pool"></i>View Gym and Swimming Pool Members</a>
            <a href="ViewServices.jsp"><i class="fa fa-server"></i> View Services</a>
            <a href="addTech.jsp"><i class="fa fa-briefcase"></i> Add Technician</a>
            <a href="deleteTech.jsp"><i class="fa fa-trash"></i> Delete Technician</a>
            <a href="viewTech.jsp"><i class="fa fa-eye"></i> View all Technician</a>
            <a href="ViewAllLog.jsp"><i class="fa fa-address-book"></i> View Log-Entries</a>
            <a href="VisitorOnCampus.jsp"><i class="fa fa-street-view"></i> View Visitors On Campus</a>
            <a href="ViewSubject.jsp"><i class="fa fa-comment"></i> View Complaints</a>
            <a href="ViewAppointment.jsp? &ptr=qwe"><i class="far fa-address-card"></i> View Appointment Request</a>
            <a href="UpdateHall.jsp? &ptr=qwe"><i class="fa fa-edit"></i>Update hall amount</a>
            <a href="UpdateSwimGym.jsp? &ptr=qwe"><i class="fa fa-edit"></i>Update gym and swimming pool amount</a>
            <a href="ViewAllInvoice.jsp"><i class="fa fa-print"></i> View All invoice</a>
            <a href="ChangePassword.jsp"><i class="fa fa-key"></i>Change Password</a>
        </div>

         <%
            }
        %> 
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/all.min.js"></script>

    </body>
</html>
