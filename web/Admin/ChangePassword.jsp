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
        <%@include file="Header.jsp" %>
        <style>
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
    <div class="col-sm-5 col-md-5 lg-3">
            <div class="jumbotron col-md-9 mt-3 shadow-lg" style="background-color:#111;">
                <h3 class="display-5 text-light" style="text-align: center;color:white;">Change Password</h3>
                <form action="ChangePasswordDB.jsp" method="POST" name="f" onsubmit="return validate()">
      
           <label> Old Password</label><input type="password" class="form-control" name="old" value="" /><br>
           <label>New Password</label><input type="password" class="form-control" name="new1" value="" /><span id="msg" style="color:red"></span><br>
           <label> Retype Password</label><input type="password" class="form-control" name="new2" value="" /><span id="msg1" style="color:red"></span><br>
           <button type="submit" class="btn btn-danger form-control mt-3">Change</button>
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
