<%--
    Document   : ChangePassword
    Created on : 14 Feb, 2020, 9:59:22 PM
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
        <script type="text/javascript">
		function validate() {
			var p = f.new1.value;
			var cp = f.new2.value;
			if(p.length < 6){
				document.getElementById('msg').innerHTML="*Length must be greater than 6";
				return false;
			}
			if(p.length > 20){
				document.getElementById('msg').innerHTML="*Length must be less than 20";
				return false;
			}
			if(p!=cp){
				document.getElementById('msg1').innerHTML="*Password missmatch";
				return false;
			}
		}
	</script>
    </head>
    <body>
     <nav class="navbar">
     <a class="navbar-brand col-sm-4 col-md-3 col-lg-2 mr-2" href="../index.html">Maurishka Park </a>
    </nav>
         <div class="container-fluid">
            <div class="row justify-content-center">
        <div class="col-sm-9 col-md-5 ">
            <div class="jumbotron col-md-9 col-sm-9 mt-3 ml-2  shadow-lg" style="background-color:#111;">
                <h3 class="display-5" style="text-align: center;color:white;">Change Password</h3>
                <form action="ChangePasswordDBG.jsp" method="POST" name="f" onsubmit="return validate()">
                    <label> Old Password</label><input type="password" name="old" class="form-control" value="" /><br>
                    <label> New Password</label><input type="password" name="new1" class="form-control" value="" /><span id="msg" style="color:red"></span><br>
                    <label> Retype Password</label><input type="password" name="new2" class="form-control" value="" /><span id="msg1" style="color:red"></span><br>
                    <button class="btn btn-danger form-control" type="submit" value="Change" >Change</button>

                </form>
                <h5 style="color:white">
                <%
                    if(session.getAttribute("output")!=null)
                    {
                        if(session.getAttribute("output").equals("s"))
                            out.print("Password Changed");
                        else if(session.getAttribute("output").equals("m"))
                            out.print("Password Incorrect");
                        else if(session.getAttribute("output").equals("e"))
                            out.print("There was a error. Try again");
                        session.setAttribute("output", null);
                    }
                    %></h5>
                <%@include file="Footer.jsp" %>
                </body>
                </html>
