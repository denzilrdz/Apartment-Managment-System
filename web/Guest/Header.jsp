
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
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

    .sidebar {

        height:2000%;
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
    .notavailable
    {
        height: 50px;
    }
     body{
                background-color:rgb(54, 54, 54);
            }
</style>


</head>
<body>
    <%
        if (session.getAttribute("tname") == null) {
            response.sendRedirect("GuestLogin.jsp");
        }

    %>

    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand text-primary" href="../index.html">Maurishka Park</a>
        <span class="mt-3 text-secondary"><i>Happy and Safe</i></span>
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#myMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="myMenu">
            <ul class="navbar-nav ml-auto mt-2">

                <li class="nav-item ">
                    <div class="dropdown open dropleft ">
                       a class="btn  text-white " class="nav-link" aria-haspopup="true" aria-expanded="false" type="button" id="triggerId" data-toggle="dropdown"><i class="fas fa-sign-out-alt" style=" font-size:20px;"></i></a>
                        <div class="dropdown-menu bg-dark" aria-labelledby="triggerId">
                            <a class="dropdown-item text-white" href="ChangePasswordG.jsp">Change Password</a>
                            <a class="dropdown-item text-white" href="Logout.jsp">Logout</a>

                        </div>
                    </div></li>

            </ul>
        </div>
    </nav>
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="sidebar" id="dashboard">

                <a href="ViewAmt.jsp"><i class="fa fa-fw fa-user"></i> Pay/View Maintenance Bill</a>
                <a href="BookHall.jsp? &ptr=sd"><i class="fa fa-credit-card"></i> Book Hall</a>
                <a href="ViewBooking.jsp"><i class="fa fa-window-close"></i> Bookings</a>
                <a href="GymMember.jsp"><i class="fa fa-server"></i> Buy/View Gym Membership</a>
                <a href="BookService.jsp"><i class="fa fa-briefcase"></i> Request Service</a>
                <a href="complaint.jsp"><i class="fa fa-trash"></i> Raise Complaint</a>
                <a href="ViewInvoice.jsp"><i class="fa fa-eye"></i> View Invoice</a>


            </div>
        </div>