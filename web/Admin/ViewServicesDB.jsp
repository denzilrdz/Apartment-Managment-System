<%--
    Document   : ViewServicesDB
    Created on : 17 Feb, 2020, 5:05:34 PM
    Author     : Denzil Rodrigues
--%>

<%@page import="DBConnect.DBCon"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="../css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
        
            body{
                background-color:rgb(54, 54, 54);
            }
            .navbar
    {
        background-color:black;
        
    }
    .navbar-brand
    {
        font-size: 28px;
    }
    
          
        </style>
    </head>
    <body>
    <nav class="navbar d-print-none">
        <a class="navbar-brand " href="../index.html">Maurishka Park </a>
                 <a class="btn text-white" href="Logout.jsp"><i class="fas fa-sign-out-alt" style="font-size:20px;"></i> Logout </a>
    </nav>
    

        <%
            try {
                String email = request.getParameter("email");
                String serve = request.getParameter("serve");
                String sno = request.getParameter("slno");
                String apart_no = request.getParameter("apart_no");
                /*out.print(email+"<br>"+serve+"<br>"+slno+"<br>"+apart_no);*/
                if (session.getAttribute("aname") == null) {
                    response.sendRedirect("AdminLogin.jsp");
                }
                boolean stat = false;
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("SELECT `slno`, `name`, `contact` FROM `technician` WHERE status=0 and type='" + serve + "'");
                while (rs.next()) {
                    stat = true;
        %>
        <a  href="assignDB.jsp? &slno=<%=rs.getInt(1)%> &apart_no=<%=apart_no%> &sno=<%=sno%> &email=<%=email%>">&nbsp &nbsp<%=rs.getString(2)%></a></td></tr>
        <%
                }
                if (stat == false) {
                    out.print("<h4>Technician not available");
                }
                s.close();
                con.close();
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/all.min.js"></script>
</body>
</html>
