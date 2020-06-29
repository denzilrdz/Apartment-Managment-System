<%--
    Document   : DeleteTenent
    Created on : 14 Feb, 2020, 11:11:06 PM
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
    </head>
    <%@include file="Header.jsp" %>
    <%
                        if (session.getAttribute("aname") == null) {
                            response.sendRedirect("AdminLogin.jsp? &ptr=asf");
                        }
                        try {
                            Class.forName(DBCon.DriverURL);
                            Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                            Statement s = con.createStatement();
                            ResultSet rs = s.executeQuery("SELECT `apart_no`, email FROM `tenent_email`");
    %>
        <div class="col-sm-9 col-md-5 lg-3">
            <div class="jumbotron col-md-9 mt-3 ml-2 shadow-lg" style="background-color:#111;">
                <h3 class="display-5 text-light" style="text-align: center;">Delete Tenant</h3>
                <form action="DeleteTenentDB.jsp" method="POST">
                    <h5 class="mt-3 text-white" > Select tenant to be deleted </h5>
                    <%
                        out.print("<select class='form-control' name='email'>");
                        while (rs.next()) {
                    %>
                    <option value="<%=rs.getString(2)%>"> <%=rs.getString(1)%> </option>
                    <%
                            }
                            out.print("</select>");
                            rs.close();
                            s.close();
                            con.close();
                        } catch (Exception e) {
                            out.println(e.getMessage());
                        }
                    %>
                    <button type="submit" class="btn btn-danger form-control mt-3">Delete</button>
                    <h5 style="color:white">
                        <%
                        if(session.getAttribute("output")!=null){
                            if(session.getAttribute("output").equals("e"))
                                out.print("There was a error try again");
                            else if(session.getAttribute("output").equals("d"))
                                out.print("Resident deleted successfully");
                            session.setAttribute("output", null);
                        }
                        %>
                    </h5>
                </form>
            </div>
        </div>
    </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
