<%-- 
    Document   : GuestIndex
    Created on : 19 Feb, 2020, 11:31:50 PM
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
 .main {
                margin-left: 160px; /* Same as the width of the sidenav */
                padding: 0px 10px;
            }
.navbar
            {
                background-color:black;

            }

            .navbar-brand
            {
                font-size: 28px;
            }
            .btn{
              padding:20px;
             
            }
            h3{
              color:#000;
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
        <nav class="navbar mb-3">
        <a class="navbar-brand col-sm-4 col-md-3 col-lg-2 mr-2" href="../index.html">Maurishka Park </a>
         <a href="ChangePasswordG.jsp"><i class="fas fa-key"></i>Change Password</a> 
        <a class="btn text-white" href="Logout.jsp"><i class="fas fa-sign-out-alt" style="font-size:20px;"></i> Logout </a>
         
        

                 
                  </nav>
                  
                   
                

                         <div id="myslide" class="carousel slide" data-ride="carousel">
                         
        <div class="carousel-inner">
        <div style="text-align:center;">
         <a class="btn btn-large btn-danger" href="RequestApointment.jsp"><h3>Schedule a Visit</h3> </a>
</div>
          <div class="carousel-item active">
            <img class="d-block w-100 h-30" src="../images/img2.jpg" >
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="../images/img1.jpg">
          </div>
         </div>
        <a class="carousel-control-prev" href="#myslide" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
          <span class="sr-only"></span>
        </a>
        <a class="carousel-control-next" href="#myslide" role="button" data-slide="next">
          <span class="carousel-control-next-icon"></span>
          <span class="sr-only"></span><div id="amenities"></div>
        </a>
      </div>
          </div>


        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/all.min.js"></script>   
    </body>
</html>
