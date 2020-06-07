<%-- 
    Document   : Logout
    Created on : 25 Jan, 2020, 11:15:26 AM
    Author     : Denzil Rodrigues
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("tname")!=null)
            {
                session.setAttribute("tname", null);
                session.invalidate();
                response.sendRedirect("TenentLogin.jsp");
            }
         %>
    </body>
</html>
