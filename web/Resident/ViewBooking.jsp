<%-- 
    Document   : ViewBooking
    Created on : 15 Feb, 2020, 12:42:22 PM
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
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <%
            if(session.getAttribute("tname")==null)
            {
                response.sendRedirect("TenentLogin.jsp");
            }
            try
            {
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL,DBCon.DBusername,DBCon.DBpassword);
                Statement s=con.createStatement(); %>
                <div class="col-sm-9 col-md-5 mt-2 ml-2 "> 
                <table class="table table-striped text-white" style="text-align:center;">
          <thead class="bg-dark text-white">
                     <tr style="text-align: center;">
                          <th scope="col">Date</th>
                          <th scope="col">Order ID</th>
                        </tr>
                      </thead>
                      <tbody>
                <%
                ResultSet rs=s.executeQuery("SELECT `date`, `status`, `o_id` FROM `hall_booking` WHERE `email`='"+session.getAttribute("tname")+"'");
                while(rs.next()){
                             

                    if(rs.getBoolean(2))
                    { %>
                        <tr style="text-align: center;"><td><%= rs.getDate(1)%></td><td><%=rs.getString(3)%></td></tr>
                    <%
                    }
                } %>
                    </tbody>
                </table>
            </div>
            <%
                rs.close();
                s.close();
                con.close();
            }
            catch(Exception e)
            {
                out.print(e.getMessage());
            }
        %>
        <%@include file="Footer.jsp" %>
    </body>
</html>
