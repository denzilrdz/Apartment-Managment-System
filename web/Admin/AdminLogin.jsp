<%--
    Document   : AdminLogin
    Created on : 24 Jan, 2020, 9:52:56 AM
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
        <style>

            .im
            {
                background-image:url(../images/adminloginimg1.jpg);
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
            .custom-mt
            {
                margin-top:7rem;
            }

        </style>

    </head>
    <%if (session.getAttribute("aname") != null) {
            response.sendRedirect("AdminIndex.jsp");
        }
    %>
    <body class="im">

        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-4 col-sm-3 custom-mt ">
                    <form method="POST" class="shadow-lg p-4 " action="AdminLoginValidate.jsp">
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
                    <h5 style="color:white">
                    <%
                        if(session.getAttribute("output")!=null)
                        {
                            if(session.getAttribute("output").equals("name"))
                                out.print("Invalid Username");
                            else if(session.getAttribute("output").equals("pass"))
                                out.print("Invalid Password");
                            else if(session.getAttribute("output").equals("error"))
                                out.print("There was a error. Try again");
                            session.setAttribute("output", null);
                        }
                        %></h5>
                </div>
            </div>
        </div>
        <%@include file="Footer.jsp" %>

    </body>
</html>
