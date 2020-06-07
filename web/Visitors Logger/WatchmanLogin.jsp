<%--
    Document   : WatchmanLogin
    Created on : 18 Feb, 2020, 5:47:00 PM
    Author     : Denzil Rodrigues
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/all.min.css">
       
        <style>

         .im
            {
                background-image:url(../images/visitimg.jpg);
                background-repeat:no-repeat;
                background-size:cover;
                background-attachment:fixed;
                overflow-y:hidden;

            }
            .profile-img-card {
                width: 120px;
                height: 120px;
                margin: 0 auto 10px;
                display: block;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
            }
            .custom-mr
            {
                margin-top:12rem;
            }
        </style>
    </head>

    <%if (session.getAttribute("wname") != null) {
            response.sendRedirect("WatchIndex.jsp");
        }
    %>
 <body class="im">

        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-4 col-sm-3 custom-mr ">
                    <form method="POST" class="shadow-lg p-4" action="WatchmanLoginValidate.jsp">
                        <div class="form-group">
                            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />

                        </div>
                        <div class="form-group">
                            <label class="text-white" style="font-size:25px;">Username</label>
                            <input type="text" name="uname" class="form-control" placeholder="Username" required autofocus></div>
                        <div class="form-group">
                            <label class="text-white" style="font-size:25px;">Password</label>
                            <input type="password"  name="pass" class="form-control" placeholder="Password" required /></div>
                        <button class="btn  btn-success font-weight-bold mt-4 form-control" type="submit">Log in</button>
                 </form>
                    <h5 style="color:whitesmoke">
                            <%
                                if(session.getAttribute("output")!=null){
                                    if(session.getAttribute("output").equals("u"))
                                        out.print("Invalid Username");
                                    else if(session.getAttribute("output").equals("p"))
                                        out.print("Invaid Password");
                                    else if(session.getAttribute("output").equals("e"))
                                        out.print("There was a error. Try again");
                                    session.setAttribute("output",null);
                                }
                            %>
                        </h5>
                </div>
            </div>
        </div>
  <script src="js/bootstrap.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/all.min.js"></script>

</body>
</html>
