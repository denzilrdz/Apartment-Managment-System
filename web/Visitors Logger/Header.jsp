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
            if(session.getAttribute("wname")==null)
            {
                response.sendRedirect("WatchmanLogin.jsp");
            } else {
        %>
          <nav class="navbar">
        <a class="navbar-brand col-sm-4 col-md-3 col-lg-2 mr-2" href="../index.html">Maurishka Park </a>
        <a class="btn text-white" href="Logout.jsp"><i class="fas fa-sign-out-alt" style="font-size:20px;"></i> Logout </a>
    </nav>
        <div class="row">
        <div class="col-sm-5 col-md-4">
        <div class="sidebar">
         <a href="AddLogEntry.jsp"><i class="fas fa-sign-in-alt"></i> Log Entry</a><
        <a href="AddLogExit.jsp"><i class=" fas fa-sign-out-alt"></i>Log exit</a>
                </div>
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
