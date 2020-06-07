<%--
    Document   : AddLogExit
    Created on : 18 Feb, 2020, 6:04:24 PM
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
        <%            try {
                if (session.getAttribute("wname") == null) {
                    response.sendRedirect("WatchmanLogin.jsp");
                }
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);

                Statement s = con.createStatement();
            %>
            <div class="col-sm-5 col-md-5 lg-3">
            <div class="jumbotron col-md-9 mt-3 shadow-lg" style="background-color:#111;">
                <h3 class="display-5 text-light" style="text-align: center;">Select to remove</h3>
                <%
                out.print("<form action=LogExitDB.jsp>");
                ResultSet rs = s.executeQuery("SELECT `regno`, `name` FROM `entry_log` WHERE status=0");
                out.print("<select class='form-control' name=regno>");
                while (rs.next()) {
        %>

    <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
    <%
            }
            out.print("</select><br>");
            out.print("<button type='submit' class='btn btn-danger form-control mt-3' />Submit</button>");
            %>
            <h5 style="color:white">
                        <%
                        if(session.getAttribute("output")!=null){
                            if(session.getAttribute("output").equals("e"))
                                out.print("There was a error try again");
                            else if(session.getAttribute("output").equals("a"))
                                out.print("Log updated");
                            session.setAttribute("output", null);
                        }
                        %>
                    </h5>
            <%
            out.print("</form>");
            s.close();
            con.close();
        } catch (Exception e) {
            out.print(e.getMessage());
        }
    %>
    <%@include file="Footer.jsp" %>
</body>
</html>
