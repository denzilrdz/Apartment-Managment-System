<%@page import="java.sql.*"%>
<%@page import="DBConnect.DBCon"%>
    <head>
        <title>Tenant Register</title>
    
        <%@include file="Header.jsp" %>
        <%
            if (session.getAttribute("aname") == null) {
                response.sendRedirect("AdminLogin.jsp? &ptr=asf");
            } else {
                Class.forName(DBCon.DriverURL);
                Connection con = DriverManager.getConnection(DBCon.DBURL, DBCon.DBusername, DBCon.DBpassword);
                Statement s = con.createStatement();
                ResultSet rs = s.executeQuery("SELECT `apart_no` FROM `apartment` WHERE `status`=0");
        %>
    <div class="col-sm-9 col-md-5 ">
        <div class="jumbotron col-sm-9 col-md-9 mt-3 shadow-lg" style="background-color:#111;">
            <h3 class="display-5 text-light" style="text-align: center;">Register Tenant</h3>
            <form action="TenentDB.jsp" method="POST">
                <input type="email" class="form-control mt-4 mb-3" placeholder="EMAIL" name="mail" required>
            

            <select class="form-control" name="ano">
                <%
                    while (rs.next()) {
                %>
                <option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>
               <%
                    }
                %>
            
            </select>
            <button type="submit" class="btn btn-danger form-control mt-3">Add</button>
            </form>
                <h3 style="color:white">
                <%
                    if(session.getAttribute("output")!=null)
                    {
                        if(session.getAttribute("output").equals("error"))
                            out.print("There was error try again");
                        else if(session.getAttribute("output").equals("success"))
                            out.print("Resident Added");
                        else if(session.getAttribute("output").equals("email"))
                            out.print("Resident exist");
                        session.setAttribute("output", null);
                    }
                    %>
                </h3>
            </div>
            </div>
        

        <%   
             }
        %>
        </div>
        <%@include file="Footer.jsp" %>
    </body>
</html>
